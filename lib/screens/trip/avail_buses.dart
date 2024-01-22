import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:jbus_app/data/api/api_service.dart';
import 'package:jbus_app/data/api/google_service.dart';
import 'package:jbus_app/data/models/bus_route.dart';
import 'package:jbus_app/data/models/point.dart';
import 'package:jbus_app/data/models/point_create_request.dart';
import 'package:jbus_app/data/models/trip_create_request.dart';
import 'package:jbus_app/screens/trip/eta.dart';
import 'package:jbus_app/screens/trip/waiting_bus.dart';
import 'package:jbus_app/services/service_locator.dart';
import 'package:jbus_app/themes/appbar_style.dart';
import 'package:jbus_app/widgets/others/app_bar_title_logo.dart';
import 'package:jbus_app/widgets/warnings/warning.dart';

class TripAvailableBuses extends StatefulWidget {
  final BusRoute route;
  final bool isGoing;
  final Point startingPoint;
  final Point endingPoint;

  TripAvailableBuses({
    Key? key,
    required this.route,
    required this.isGoing,
    required this.startingPoint,
    required this.endingPoint,
  }) : super(key: key);

  @override
  _TripAvailableBusesState createState() => _TripAvailableBusesState();
}

class _TripAvailableBusesState extends State<TripAvailableBuses> {
  final databaseReference = FirebaseDatabase.instance.ref();
  GoogleMapController? mapController;
  Set<Marker> markers = {};
  GoogleMapsApi googleApi = GoogleMapsApi();
  LatLng? startLatLng;
  LatLng? endLatLng;
  @override
  void initState() {
    super.initState();
    listenToBusesLocations();
    startLatLng =
        LatLng(widget.startingPoint.latitude, widget.startingPoint.latitude);
    endLatLng =
        LatLng(widget.endingPoint.latitude, widget.endingPoint.latitude);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(115.0),
        child: AppBar(
          automaticallyImplyLeading: true,
          elevation: 0,
          backgroundColor: Colors.black.withOpacity(0),
          title: const JbusAppBarTitle(),
          flexibleSpace: const AppBarStyle(),
        ),
      ),
      body: GoogleMap(
        zoomControlsEnabled: false,
        myLocationButtonEnabled: false,
        myLocationEnabled: true,
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.startingPoint.latitude,
              widget.startingPoint.latitude), // Set to a default value
          zoom: 12.0,
        ),
        markers: markers,
        onMapCreated: (controller) {
          mapController = controller;
        },
      ),
    );
  }

  void listenToBusesLocations() {
    databaseReference
        .child(
            'Route/${widget.route.id}/${widget.isGoing ? 'going' : 'returning'}')
        .onValue
        .listen((event) {
      if (event.snapshot.value != null) {
        Map<Object?, Object?> busesData =
            event.snapshot.value as Map<Object?, Object?>;
        print('BusData: ${busesData.toString()}');
        List<dynamic>? busesList = busesData['Bus'] as List<dynamic>?;

        // Check if busesList is not null and contains data
        if (busesList != null) {
          setState(() {
            // Update existing markers
            for (int i = 0; i < busesList.length; i++) {
              Map<dynamic, dynamic>? busData =
                  busesList[i] as Map<dynamic, dynamic>?;

              if (busData != null && busData.containsKey('currentLocation')) {
                double latitude =
                    busData['currentLocation']?['latitude'] as double? ?? 0.0;
                double longitude =
                    busData['currentLocation']?['longitude'] as double? ?? 0.0;

                // Use the index of the busData as a unique identifier for the bus
                String markerId = i.toString();

                // Find the existing marker with the same id and update its position
                Marker existingMarker = markers.firstWhere(
                  (marker) => marker.markerId.value == markerId,
                  orElse: () => Marker(
                      markerId: MarkerId(markerId),
                      icon: googleApi.customBusIcon!),
                );

                markers.remove(existingMarker); // Remove the existing marker
                markers.add(
                  existingMarker.copyWith(
                    positionParam: LatLng(latitude, longitude),
                    iconParam: googleApi.customBusIcon!,
                    onTapParam: () {
                      showDialog(
                          context: context,
                          builder: (context) => ETAViewDialog(
                              onPress: () {
                                DateTime currentUtcDateTime =
                                    DateTime.now().toUtc();

                                print(
                                    'Current UTC Date and Time: $currentUtcDateTime');
                                PointCreateRequest pick = PointCreateRequest(
                                    latitude: startLatLng!.latitude,
                                    longitude: startLatLng!.longitude,
                                    name: widget.startingPoint.name!);
                                PointCreateRequest drop = PointCreateRequest(
                                    latitude: endLatLng!.latitude,
                                    longitude: endLatLng!.longitude,
                                    name: widget.endingPoint.name!);
                                TripCreateRequest trip = TripCreateRequest(
                                    pickUpPoint: pick,
                                    startedAt: currentUtcDateTime,
                                    status: "PENDDING",
                                    dropOffPoint: drop);
                                sl<ApiService>()
                                    .createTrip(trip)
                                    .then((value) => {
                                          if (value.response.statusCode == 201)
                                            {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        TripBusWaitingPage(
                                                          route: widget.route,
                                                          isGoing:
                                                              widget.isGoing,
                                                          startingPoint: widget
                                                              .startingPoint,
                                                          endingPoint: widget
                                                              .endingPoint,
                                                        )),
                                              )
                                            }
                                        })
                                    // ignore: body_might_complete_normally_catch_error
                                    .catchError((error, stackTrace) {
                                  print('Error: ${error.toString()}');
                                  showDialog(
                                      context: context,
                                      builder: (context) => const Warning(
                                          title: "Oops!",
                                          description: "Sonthing went wrong"));
                                });
                              },
                              first: LatLng(latitude, longitude),
                              second: startLatLng!));
                    },
                  ),
                );
              } else {
                print('Invalid busData: $busData');
              }
            }

            // Add markers for starting and ending points
            addStartAndEndMarkers();

            // Update the map camera position to include all markers
            if (markers.isNotEmpty && mapController != null) {
              GoogleMapsApi().moveToLocation(
                  mapController!, markers.elementAt(0).position);
            }
          });
        }
      }
    });
  }

  void addStartAndEndMarkers() {
    // Add marker for the starting point
    markers.add(Marker(
      markerId: MarkerId('startingPoint'),
      position: LatLng(
        widget.startingPoint.latitude,
        widget.startingPoint.longitude,
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ));

    // Add marker for the ending point
    markers.add(Marker(
      markerId: MarkerId('endingPoint'),
      position: LatLng(
        widget.endingPoint.latitude,
        widget.endingPoint.longitude,
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    ));
  }
}
