import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/data/api/google_service.dart';
import 'package:jbus_app/data/models/bus_route.dart';
import 'package:jbus_app/data/models/point.dart';
import 'package:jbus_app/screens/trip/avail_buses.dart';
import 'package:jbus_app/screens/trip/edit_point.dart';
import 'package:jbus_app/themes/appbar_style.dart';
import 'package:jbus_app/themes/bloc/theme_bloc.dart';
import 'package:jbus_app/widgets/buttons/rectangular_elevated_button.dart';
import 'package:jbus_app/widgets/others/app_bar_title_logo.dart';
import 'package:jbus_app/widgets/warnings/warning.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TripSettup extends StatefulWidget {
  final BusRoute route;
  final bool isGoing;
  final Point? startingPoint;
  final Point? endingPoint;
  final Point? preMarkedPoint;
  const TripSettup({
    super.key,
    required this.route,
    this.isGoing = true,
    this.startingPoint,
    this.endingPoint,
    this.preMarkedPoint,
  });

  @override
  State<TripSettup> createState() => _TripSettupState();
}

class _TripSettupState extends State<TripSettup> {
  late Point startingPoint;
  late Point endingPoint;
  late bool isGoing;
  final double max = 0.37;
  final double min = 0.2;
  double _dragSheetPosition = 0.35;
  GoogleMapsApi googleApi = GoogleMapsApi();
  late GoogleMapController mapController;
  dynamic route;
  void initState() {
    super.initState();
    route = widget.route;
    isGoing = widget.isGoing;

    startingPoint = widget.startingPoint ?? route.startingPoint.location;

    endingPoint = widget.endingPoint ?? route.endingPoint.location;
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    setState(() {
      _dragSheetPosition -=
          details.primaryDelta! / MediaQuery.of(context).size.height;
      _dragSheetPosition = _dragSheetPosition.clamp(min, max);
    });
  }

  void _handleDragEnd(DragEndDetails details) {
    setState(() {
      _dragSheetPosition =
          (_dragSheetPosition - max).abs() <= (_dragSheetPosition - min).abs()
              ? max
              : min;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, themeState) {
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
                onMapCreated: (controller) {
              mapController = controller;
              // ignore: unrelated_type_equality_checks
              if (themeState.thememode == ThemeMode.dark) {
                mapController.setMapStyle(GoogleMapsApi.darkMapString);
              }
                },
                initialCameraPosition: CameraPosition(
                    target: isGoing
                        ? LatLng(
                            startingPoint.latitude, startingPoint.longitude)
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
                    position:
                        LatLng(endingPoint.latitude, endingPoint.longitude),
                  ),
                  if (widget.preMarkedPoint != null)
                    Marker(
                      markerId: const MarkerId("premarkedpoint"),
                      position: LatLng(widget.preMarkedPoint!.latitude,
                          widget.preMarkedPoint!.longitude),
                      icon: BitmapDescriptor.defaultMarkerWithHue(
                          BitmapDescriptor.hueGreen),
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
                // onVerticalDragUpdate: _handleDragUpdate,
                // onVerticalDragEnd: _handleDragEnd,
                child: DraggableScrollableSheet(
                    initialChildSize: _dragSheetPosition,
                    // minChildSize: min,
                    // maxChildSize: max,
                    builder: (BuildContext context,
                        ScrollController scrollController) {
                      return Container(
                        decoration: BoxDecoration(
                          // color: Colors.white,
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                ourWhite.withOpacity(0),
                                themeState.thememode == ThemeMode.light
                                    ? ourWhite
                                    : ourDarkThemeBackgroundNavey,
                              ]),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                        ),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding:  EdgeInsets.all(MediaQuery.of(context).size.height * 0.011737),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                RectangularElevatedButton(
                                  text:
                                      AppLocalizations.of(context)!.activeBuses,
                                  padding: MediaQuery.of(context).size.height * 0.01760563,
                                  width: MediaQuery.of(context).size.height * 0.2347417,
                                  fontSize: MediaQuery.of(context).size.height * 0.0199530,
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
                                 SizedBox(height: MediaQuery.of(context).size.height * 0.01760563),
                                SingleChildScrollView(
                                  child: Row(
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
                                            width: MediaQuery.of(context).size.height * 0.05868545,
                                            height: MediaQuery.of(context).size.height * 0.05868545,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    width: MediaQuery.of(context).size.height * 0.00058685,
                                                    color: themeState
                                                          .thememode ==
                                                      ThemeMode.light?ourGray:ourWhite)),
                                            child: Icon(
                                              Icons.location_on,
                                              color: themeState
                                                          .thememode ==
                                                      ThemeMode.light?ourGray:ourWhite,
                                            ),
                                          ),
                                           SizedBox(
                                            height: MediaQuery.of(context).size.height * 0.023474,
                                          ),
                                          Text(
                                              isGoing
                                                  ? startingPoint.name!
                                                  : endingPoint.name!,
                                              style: TextStyle(
                                                  fontSize: startingPoint.name!
                                                                  .length <
                                                              19 ||
                                                          endingPoint.name!
                                                                  .length >
                                                              19
                                                      ? MediaQuery.of(context).size.height * 0.02112676
                                                      : MediaQuery.of(context).size.height * 0.01760563,
                                                  fontWeight: FontWeight.w300)),
                                           SizedBox(
                                            height: MediaQuery.of(context).size.height * 0.02347418,
                                          ),
                                          FloatingActionButton(
                                              shape: const CircleBorder(),
                                              backgroundColor: themeState
                                                          .thememode ==
                                                      ThemeMode.light
                                                  ? ourWhite
                                                  : ourDarkThemeBackgroundNavey,
                                              child: Icon(Icons.edit,
                                                  color: themeState.thememode ==
                                                          ThemeMode.light
                                                      ? ourGray
                                                      : ourWhite),
                                              onPressed: () {
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            EditPickupPointPage(
                                                              startingPoint:
                                                                  startingPoint,
                                                              endingPoint:
                                                                  endingPoint,
                                                              route:
                                                                  widget.route,
                                                              isGoing: isGoing,
                                                              isPickup: true,
                                                            )));
                                              }),
                                        ],
                                      ),
                                      FloatingActionButton(
                                          shape: const CircleBorder(),
                                          backgroundColor: themeState
                                                          .thememode ==
                                                      ThemeMode.light
                                                  ? ourWhite
                                                  : ourDarkThemeBackgroundNavey,
                                              child: Icon(Icons.swap_horiz_rounded,
                                                  color: themeState.thememode ==
                                                          ThemeMode.light
                                                      ? ourGray
                                                      : ourWhite),
                                          onPressed: () {
                                            setState(() {
                                              if (widget.route.waypointsGoing !=
                                                      null &&
                                                  widget.route
                                                          .waypointsReturning !=
                                                      null) {
                                                isGoing = !isGoing;
                                                // googleApi.decodePolyline(isGoing
                                                //   ? widget.route.waypointsGoing!
                                                //   : widget.route.waypointsReturning!);
                                              } else {
                                                showDialog(
                                                    context: context,
                                                    builder: (context) => Warning(
                                                        title:
                                                            AppLocalizations.of(
                                                                    context)!
                                                                .sawpError,
                                                        description:
                                                            AppLocalizations.of(
                                                                    context)!
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
                                            width: MediaQuery.of(context).size.height * 0.05868545,
                                            height: MediaQuery.of(context).size.height * 0.05868545,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    width: MediaQuery.of(context).size.height * 0.0005868545,
                                                    color: themeState
                                                          .thememode ==
                                                      ThemeMode.light?ourGray:ourWhite)),
                                            child: Icon(
                                              Icons.location_on,
                                              color: themeState
                                                          .thememode ==
                                                      ThemeMode.light?ourGray:ourWhite,
                                            ),
                                          ),
                                           SizedBox(
                                            height: MediaQuery.of(context).size.height * 0.02347418,
                                          ),
                                          Text(
                                            isGoing
                                                ? endingPoint.name!
                                                : startingPoint.name!,
                                            style: TextStyle(
                                                fontSize:
                                                    startingPoint.name!.length <
                                                                19 ||
                                                            endingPoint.name!
                                                                    .length >
                                                                19
                                                        ? MediaQuery.of(context).size.height * 0.02112676
                                                        : MediaQuery.of(context).size.height * 0.01760563,
                                                fontWeight: FontWeight.w300),
                                          ),
                                           SizedBox(
                                            height: MediaQuery.of(context).size.height * 0.02347418,
                                          ),
                                          FloatingActionButton(
                                              shape: const CircleBorder(),
                                              backgroundColor: themeState
                                                          .thememode ==
                                                      ThemeMode.light
                                                  ? ourWhite
                                                  : ourDarkThemeBackgroundNavey,
                                              child: Icon(Icons.edit,
                                                  color: themeState.thememode ==
                                                          ThemeMode.light
                                                      ? ourGray
                                                      : ourWhite),
                                              onPressed: () {
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            EditPickupPointPage(
                                                              startingPoint:
                                                                  startingPoint,
                                                              endingPoint:
                                                                  endingPoint,
                                                              route:
                                                                  widget.route,
                                                              isGoing: widget
                                                                  .isGoing,
                                                              isDropoff: true,
                                                            )));
                                              })
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }))
          ],
        ),
      );
    });
  }
}
