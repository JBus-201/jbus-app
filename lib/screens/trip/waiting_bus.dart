
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/data/api/google_service.dart';
import 'package:jbus_app/data/models/bus_route.dart';
import 'package:jbus_app/data/models/point.dart';
import 'package:jbus_app/themes/appbar_style.dart';
import 'package:jbus_app/widgets/others/app_bar_title_logo.dart';

class TripBusWaitingPage extends StatefulWidget {
  final BusRoute route;
  final bool isGoing;
  final Point startingPoint;
  final Point endingPoint;
  const TripBusWaitingPage({
    super.key,
    required this.route,
    required this.isGoing,
    required this.startingPoint,
    required this.endingPoint,
  });

  @override
  State<TripBusWaitingPage> createState() => _TripBusWaitingPageState();
}

class _TripBusWaitingPageState extends State<TripBusWaitingPage> {
  BitmapDescriptor? customBusIcon;
  Set<Marker> markers = {};
  GoogleMapsApi googleApi = GoogleMapsApi();
  GoogleMapController? mapController;
  @override
  void initState() {
    super.initState();
    markers.add(Marker(
        markerId: const MarkerId("startingPoint"),
        position: LatLng(
            widget.startingPoint.latitude, widget.startingPoint.longitude)));
    markers.add(Marker(
        markerId: const MarkerId("endingPont"),
        position: LatLng(
            widget.endingPoint.latitude, widget.endingPoint.longitude)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(115.0),
          child: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: Colors.black.withOpacity(0),
            title: const JbusAppBarTitle(),
            flexibleSpace: const AppBarStyle(),
          ),
        ),
        body: Stack(children: [
          GoogleMap(
            zoomControlsEnabled: false,
        myLocationButtonEnabled: false,
        myLocationEnabled: true,
            initialCameraPosition: CameraPosition(
              target: LatLng(widget.startingPoint.latitude, widget.startingPoint.longitude), // Set to a default value
              zoom: 12.0,
            ),
            markers: markers,
            onMapCreated: (controller) {
              mapController = controller;
            },
          ),
          Container(
            height: double.infinity,
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FloatingActionButton(
                  backgroundColor: ourRed,
                  child: Icon(Icons.exit_to_app_rounded),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FloatingActionButton(
                      child: const Icon(Icons.directions_bus),
                      onPressed: () {},
                    ),
                    const SizedBox(height: 15,),
                    FloatingActionButton(
                      child: const Icon(Icons.location_searching_sharp),
                      onPressed: () {
                        googleApi.moveToCurrentLocation(mapController!);
                      },
                    ),
                    const SizedBox(height: 15,),
                    FloatingActionButton(
                      backgroundColor: ourBlack,
                      foregroundColor: ourWhite,
                      child: Icon(Icons.qr_code_rounded),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]));
  }

void listenToBusesLocations() {
    FirebaseDatabase.instance.ref()
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
                      markerId: MarkerId(markerId), icon: googleApi.customBusIcon!),
                );

                markers.remove(existingMarker); // Remove the existing marker
                markers.add(
                  existingMarker.copyWith(
                    positionParam: LatLng(latitude, longitude),
                    iconParam: googleApi.customBusIcon!,
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
