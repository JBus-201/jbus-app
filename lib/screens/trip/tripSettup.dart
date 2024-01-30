import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/data/api/google_service.dart';
import 'package:jbus_app/data/models/bus_route.dart';
import 'package:jbus_app/data/models/point.dart';
import 'package:jbus_app/screens/trip/avail_buses.dart';
import 'package:jbus_app/screens/trip/edit_point.dart';
import 'package:jbus_app/themes/appbar_style.dart';
import 'package:jbus_app/widgets/buttons/rectangular_elevated_button.dart';
import 'package:jbus_app/widgets/others/app_bar_title_logo.dart';
import 'package:jbus_app/widgets/warnings/warning.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TripSettup extends StatefulWidget {
  final BusRoute route;
  final bool isGoing;
  final Point? startingPoint;
  final Point? endingPoint;
  const TripSettup({
    super.key,
    required this.route,
    this.isGoing = true,
    this.startingPoint,
    this.endingPoint,
  });

  @override
  State<TripSettup> createState() => _TripSettupState();
}

class _TripSettupState extends State<TripSettup> {
  late Point startingPoint;
  late Point endingPoint;
  late bool isGoing;
  final double max = 0.37;
  GoogleMapsApi googleApi = GoogleMapsApi();
  dynamic route;
  void initState() {
    super.initState();
    route = widget.route;
    isGoing = widget.isGoing;

    startingPoint = widget.startingPoint ?? route.startingPoint.location;

    endingPoint = widget.endingPoint ?? route.endingPoint.location;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: AppBar(
          automaticallyImplyLeading: true,
          elevation: 0,
          backgroundColor: Colors.black.withOpacity(0),
          title: const JbusAppBarTitle(),
          flexibleSpace: const AppBarStyle(),
        ),
      ),
      body: Stack(
        children: [
          GoogleMap(
              zoomControlsEnabled: false,
              myLocationButtonEnabled: false,
              myLocationEnabled: true,
              initialCameraPosition: CameraPosition(
                  target: isGoing
                      ? LatLng(startingPoint.latitude, startingPoint.longitude)
                      : LatLng(endingPoint.latitude, endingPoint.longitude),
                  zoom: 10),
              markers: {
                Marker(
                  markerId: const MarkerId("startpoint"),
                  position:
                      LatLng(startingPoint.latitude, startingPoint.longitude),
                ),
                Marker(
                  markerId: const MarkerId("endpoint"),
                  position: LatLng(endingPoint.latitude, endingPoint.longitude),
                ),
              },
              polylines: {
                if (route.waypointsGoing != null ||
                    route.waypointsReturning != null)
                  Polyline(
                      polylineId: const PolylineId("1"),
                      points: googleApi.decodePolyline(isGoing
                          ? widget.route.waypointsGoing!
                          : widget.route.waypointsReturning!),
                      color: ourBlue,
                      width: 5)
              }),
          GestureDetector(
              child: DraggableScrollableSheet(
                  initialChildSize: max,
                  builder: (BuildContext context,
                      ScrollController scrollController) {
                    return Container(
                        decoration: BoxDecoration(
                          // color: Colors.white,
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.center,
                              colors: [ourWhite.withOpacity(0), ourWhite]),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              RectangularElevatedButton(
                                text: AppLocalizations.of(context)!.activeBuses,
                                padding: 15,
                                width: 200,
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              TripAvailableBuses(
                                                route: widget.route,
                                                isGoing: isGoing,
                                                startingPoint: startingPoint,
                                                endingPoint: endingPoint,
                                              )));
                                },
                              ),
                              const SizedBox(height: 15),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                width: 0.5, color: ourGray)),
                                        child: const Icon(
                                          Icons.location_on,
                                          color: ourGray,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                          isGoing
                                              ? startingPoint.name!
                                              : endingPoint.name!,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w300)),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      FloatingActionButton(
                                          shape: const CircleBorder(),
                                          backgroundColor: ourWhite,
                                          child: const Icon(Icons.edit,
                                              color: ourGray),
                                          onPressed: () {
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        EditPickupPointPage(
                                                          startingPoint: startingPoint,
                                                          endingPoint: endingPoint,
                                                          route: widget.route,
                                                          isGoing: isGoing,
                                                          isPickup: true,
                                                        )));
                                          }),
                                    ],
                                  ),
                                  FloatingActionButton(
                                      shape: const CircleBorder(),
                                      backgroundColor: ourWhite,
                                      child: const Icon(
                                          Icons.swap_horiz_rounded,
                                          color: ourBlack),
                                      onPressed: () {
                                        setState(() {
                                          if (widget.route.waypointsGoing !=
                                                  null &&
                                              widget.route.waypointsReturning !=
                                                  null) {
                                            isGoing = !isGoing;
                                            // googleApi.decodePolyline(isGoing
                                            //   ? widget.route.waypointsGoing!
                                            //   : widget.route.waypointsReturning!);
                                          } else {
                                            showDialog(
                                                context: context,
                                                builder: (context) => Warning(
                                                    title: AppLocalizations.of(
                                                            context)!
                                                        .sawpError,
                                                    description: AppLocalizations
                                                            .of(context)!
                                                        .noOtherDirectionMsg));
                                          }
                                        });
                                      }),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                width: 0.5, color: ourGray)),
                                        child: const Icon(
                                          Icons.location_on,
                                          color: ourGray,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        isGoing
                                            ? endingPoint.name!
                                            : startingPoint.name!,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w300),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      FloatingActionButton(
                                          shape: const CircleBorder(),
                                          backgroundColor: ourWhite,
                                          child: const Icon(Icons.edit,
                                              color: ourGray),
                                          onPressed: () {
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        EditPickupPointPage(
                                                          startingPoint: startingPoint,
                                                          endingPoint: endingPoint,
                                                          route: widget.route,
                                                          isGoing:
                                                              widget.isGoing,
                                                          isDropoff: true,
                                                        )));
                                          })
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ));
                  }))
        ],
      ),
    );
  }
}
