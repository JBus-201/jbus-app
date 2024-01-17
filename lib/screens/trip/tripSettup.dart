import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/data/api/google_service.dart';
import 'package:jbus_app/data/models/bus_route.dart';
import 'package:jbus_app/data/models/point.dart';
import 'package:jbus_app/screens/trip/edit_point.dart';
import 'package:jbus_app/widgets/buttons/rectangular_elevated_button.dart';
import 'package:jbus_app/widgets/others/app_bar_title_logo.dart';

class TripSettup extends StatefulWidget {
  final BusRoute route;
  final bool isGoing;
  final Point? startingPoint;
  final Point? endingPoint;
  const TripSettup(
      {super.key,
      required this.route,
      this.isGoing = true,
      this.startingPoint,
      this.endingPoint});

  @override
  State<TripSettup> createState() => _TripSettupState();
}

class _TripSettupState extends State<TripSettup> {
  late Point startingPoint;
  late Point endingPoint;
  late bool isGoing;
  GoogleMapsApi googleApi = GoogleMapsApi();
  dynamic route;
  late Future<String?> poly;
  void initState() {
    // TODO: implement initState
    super.initState();
    route = widget.route;
    isGoing = widget.isGoing;

    startingPoint = widget.startingPoint ?? route.startingPoint.location;

    endingPoint = widget.endingPoint ?? route.endingPoint.location;

    poly = isGoing
        ? googleApi.loadRoute(jsonDecode(route.waypointsGoing))
        : googleApi.loadRoute(jsonDecode(route.waypointsReturning));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const JbusAppBarTitle(),toolbarHeight: 31),
      body: Stack(
        children: [
          FutureBuilder<String?>(
              future: poly,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else if (!snapshot.hasData) {
                  return const Center(
                    child: Text('No data available'),
                  );
                } else {
                  final _polyline = snapshot.data;

                  return GoogleMap(
                      zoomControlsEnabled: false,
                      myLocationButtonEnabled: false,
                      myLocationEnabled: true,
                      initialCameraPosition: CameraPosition(
                          target: isGoing
                              ? LatLng(startingPoint.latitude,
                                  startingPoint.longitude)
                              : LatLng(
                                  endingPoint.latitude, endingPoint.longitude),
                          zoom: 10),
                      markers: {
                        Marker(
                          markerId: const MarkerId("startpoint"),
                          position: LatLng(
                              startingPoint.latitude, startingPoint.longitude),
                        ),
                        Marker(
                          markerId: const MarkerId("endpoint"),
                          position: LatLng(
                              endingPoint.latitude, endingPoint.longitude),
                        ),
                      },
                      polylines: {
                        if (route.waypointsGoing != null ||
                            route.waypointsReturning != null)
                          Polyline(
                            polylineId: const PolylineId('route'),
                            color: ourBlue,
                            visible: true,
                            width: 3,
                            points: googleApi.decodePolyline(_polyline),
                          ),
                      });
                }
              }),
          Container(
            height: 150,
            alignment: Alignment.bottomCenter,
            width: double.infinity,
            child: Container(
              decoration: BoxDecoration(
                color: ourWhite,
                boxShadow: [
                  BoxShadow(
                      color: ourLightGray50,
                      blurRadius: 4,
                      offset: const Offset(0, 4))
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditPickupPointPage(
                                    route: widget.route,
                                    isGoing: isGoing,
                                    isPickup: true,
                                  )));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          'from:',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.normal),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 3, 5, 3),
                          margin: const EdgeInsets.fromLTRB(5, 10, 5, 3),
                          width: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(width: 0.5, color: ourBlack)),
                          child: Expanded(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                isGoing
                                    ? widget.route.startingPoint.name!
                                    : widget.route.endingPoint.name!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.edit,
                          color: ourGray,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: ourWhite,
                        ),
                    child: GestureDetector(
                      child: const Icon(Icons.swap_vert),
                      onTap: () {
                        setState(() {
                          isGoing = !isGoing;
                          poly = googleApi.loadRoute(jsonDecode(isGoing
                              ? widget.route.waypointsGoing
                              : widget.route.waypointsReturning));
                        });
                      },
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditPickupPointPage(
                                    route: widget.route,
                                    isGoing: isGoing,
                                    isDropoff: true,
                                  )));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          'to   :',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.normal),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 3, 5, 3),
                          margin: const EdgeInsets.fromLTRB(5, 10, 5, 3),
                          width: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(width: 0.5, color: ourBlack)),
                          child: Expanded(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                !isGoing
                                    ? widget.route.startingPoint.name!
                                    : widget.route.endingPoint.name!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.edit,
                          color: ourGray,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: RectangularElevatedButton(
          text: "Available Buses", width: 200, onPressed: () {}),
    );
  }
}
