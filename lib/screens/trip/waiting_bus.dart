import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/data/api/api_service.dart';
import 'package:jbus_app/data/api/google_service.dart';
import 'package:jbus_app/data/models/bus.dart';
import 'package:jbus_app/data/models/bus_route.dart';
import 'package:jbus_app/data/models/point.dart';
import 'package:jbus_app/data/models/point_create_request.dart';
import 'package:jbus_app/data/models/trip_update_request.dart';
import 'package:jbus_app/screens/home/home.dart';
import 'package:jbus_app/screens/trip/intrip.dart';
import 'package:jbus_app/services/service_locator.dart';
import 'package:jbus_app/themes/appbar_style.dart';
import 'package:jbus_app/widgets/others/app_bar_title_logo.dart';
import 'package:jbus_app/widgets/warnings/confirm.dart';
import 'package:jbus_app/widgets/warnings/warning.dart';

class TripBusWaitingPage extends StatefulWidget {
  final BusRoute route;
  final bool isGoing;
  final Point startingPoint;
  final Point endingPoint;
  final Bus bus;
  const TripBusWaitingPage({
    super.key,
    required this.route,
    required this.isGoing,
    required this.startingPoint,
    required this.endingPoint,
    required this.bus,
  });

  @override
  State<TripBusWaitingPage> createState() => _TripBusWaitingPageState();
}

class _TripBusWaitingPageState extends State<TripBusWaitingPage> {
  BitmapDescriptor? customBusIcon;
  Set<Marker> markers = {};
  GoogleMapsApi googleApi = GoogleMapsApi();
  GoogleMapController? mapController;
  LatLng busLocation = const LatLng(0, 0);
  @override
  void initState() {
    listenToDriverLocation();
    super.initState();
    markers.add(Marker(
        markerId: const MarkerId("startingPoint"),
        position: LatLng(
            widget.startingPoint.latitude, widget.startingPoint.longitude)));
    markers.add(Marker(
        markerId: const MarkerId("endingPont"),
        position:
            LatLng(widget.endingPoint.latitude, widget.endingPoint.longitude)));
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
              target: LatLng(widget.startingPoint.latitude,
                  widget.startingPoint.longitude), // Set to a default value
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
            padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FloatingActionButton(
                      backgroundColor: ourRed,
                      child: const Icon(Icons.exit_to_app_rounded),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => ConfirmationDialog(
                                title: 'Sure to Exit trip?',
                                description: "",
                                onConfirm: () {
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const HomeScreen()),
                                    (Route<dynamic> route) => false,
                                  );
                                }));
                      },
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FloatingActionButton(
                          child: const Icon(Icons.directions_bus),
                          onPressed: () {
                            googleApi.moveToLocation(
                                mapController!, busLocation);
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        FloatingActionButton(
                          child: const Icon(Icons.location_searching_sharp),
                          onPressed: () {
                            googleApi.moveToCurrentLocation(mapController!);
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        FloatingActionButton(
                          backgroundColor: ourBlack,
                          foregroundColor: ourWhite,
                          child: const Icon(Icons.qr_code_rounded),
                          onPressed: () {
                            DateTime currentUtcDateTime =
                                DateTime.now().toUtc();
                            PointCreateRequest pick = PointCreateRequest(
                                latitude: widget.startingPoint.latitude,
                                longitude: widget.startingPoint.longitude,
                                name: widget.startingPoint.name!);
                            PointCreateRequest drop = PointCreateRequest(
                                latitude: widget.endingPoint.latitude,
                                longitude: widget.endingPoint.longitude,
                                name: widget.endingPoint.name!);
                            TripUpdateRequest trip = TripUpdateRequest(
                                finishedAt: currentUtcDateTime,
                                pickUpPoint: pick,
                                status: "Completed",
                                dropOffPoint: drop);
                            sl<ApiService>().updateTrip(trip).then((value) => {
                              Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => InTripPage(
                                        bus: widget.bus,
                                        endingPoint: widget.endingPoint,
                                        isGoing: widget.isGoing,
                                        route: widget.route,
                                        startingPoint: widget.startingPoint,
                                      )),
                              (Route<dynamic> route) => false,
                            )}).catchError((error, stackTrace) {
                              print('Error: ${error.toString()}');
                              showDialog(
                                  context: context,
                                  builder: (context) => const Warning(
                                      title: "Oops!",
                                      description: "Somthing went wrog"));
                            });;
                            
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 50,
                  decoration: const BoxDecoration(
                      color: ourWhite,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          topLeft: Radius.circular(15))),
                  child: const Text(
                    'ETA',
                  ),
                ),
              ],
            ),
          ),
        ]));
  }

  void listenToDriverLocation() {
    final databaseReference = FirebaseDatabase.instance.ref();
    databaseReference
        .child(
            'Route/${widget.route.id}/${widget.isGoing ? 'going' : 'returning'}/Bus/${widget.bus.id}/currentLocation')
        .onValue
        .listen((event) {
      print('Waiting: ${event.snapshot.value}');
      if (event.snapshot.value != null) {
        final Map<Object?, Object?>? driverLocation =
            event.snapshot.value as Map<Object?, Object?>?;

        if (driverLocation != null) {
          // Access the location data using the Object? keys
          final double latitude = driverLocation['latitude'] as double;
          final double longitude = driverLocation['longitude'] as double;

          // Create a LatLng object from the location data
          final LatLng driverLatLng = LatLng(latitude, longitude);
          // Update the marker
          setState(() {
            busLocation = driverLatLng;
            markers.clear();
            markers.add(
              Marker(
                markerId: const MarkerId('driverMarker'),
                position: driverLatLng,
                icon: googleApi.customBusIcon!,
                infoWindow: InfoWindow(
                  title: 'Driver Location',
                  snippet: 'Latitude: $latitude, Longitude: $longitude',
                ),
              ),
            );
            addStartAndEndMarkers();
          });

          googleApi.moveToLocation(mapController!, LatLng(latitude, longitude));
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
