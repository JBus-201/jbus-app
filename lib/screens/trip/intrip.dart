import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/data/api/api_service.dart';
import 'package:jbus_app/data/api/google_service.dart';
import 'package:jbus_app/data/models/bus.dart';
import 'package:jbus_app/data/models/bus_route.dart';
import 'package:jbus_app/data/models/point.dart';
import 'package:jbus_app/screens/dashbourd/buttons/drawer.dart';
import 'package:jbus_app/screens/drawer/main_drawer/main_drawer.dart';
import 'package:jbus_app/screens/drawer_notification/notification_drawer.dart';
import 'package:jbus_app/screens/home/home.dart';
import 'package:jbus_app/screens/trip/dialogs/ratingdialog.dart';
import 'package:jbus_app/services/service_locator.dart';
import 'package:jbus_app/themes/appbar_style.dart';
import 'package:jbus_app/themes/bloc/theme_bloc.dart';
import 'package:jbus_app/widgets/others/app_bar_title_logo.dart';
import 'package:jbus_app/widgets/warnings/warning.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class InTripPage extends StatefulWidget {
  final BusRoute route;
  final String isGoing;
  final Point startingPoint;
  final Point endingPoint;
  final Bus bus;
  const InTripPage({
    super.key,
    required this.route,
    required this.isGoing,
    required this.startingPoint,
    required this.endingPoint,
    required this.bus,
  });

  @override
  State<InTripPage> createState() => _InTripPageState();
}

class _InTripPageState extends State<InTripPage> {
  BitmapDescriptor? customBusIcon;
  Set<Marker> markers = {};
  GoogleMapsApi googleApi = GoogleMapsApi();
  GoogleMapController? mapController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng busLocation = const LatLng(0, 0);
  int _secondsRemaining = 120;
  // ignore: unused_field
  late Timer _timer;
  @override
  void initState() {
    _startTimer();
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

    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, themeState) {
      return Scaffold(
          key: _scaffoldKey,
          extendBodyBehindAppBar: true,
          appBar: PreferredSize(
            preferredSize:  Size.fromHeight(MediaQuery.of(context).size.height * 0.13497653),
            child: AppBar(
              automaticallyImplyLeading: false,
              elevation: 0,
              backgroundColor: Colors.black.withOpacity(0),
              title: const JbusAppBarTitle(),
              flexibleSpace: const AppBarStyle(),
              // leading: CustomEndDrawerButton(
              //   onTap: () {
              //     _scaffoldKey.currentState!.openDrawer();
              //   },
              // ),
              actions: [
                CustomDrawerButton(onTap: () {
                  _scaffoldKey.currentState!.openEndDrawer();
                })
              ],

            ),
          ),

          drawer: const NotificationsDrawer(),
          endDrawer: const MainDrawer(),
          body: Stack(children: [
            GoogleMap(
                zoomControlsEnabled: false,
                myLocationButtonEnabled: false,
                myLocationEnabled: true,
                initialCameraPosition: CameraPosition(
                  target: LatLng(widget.startingPoint.latitude,
                      widget.startingPoint.longitude),
                  zoom: 12.0,
                ),
                markers: markers,
                onMapCreated: (controller) {
                  mapController = controller;
                  // ignore: unrelated_type_equality_checks
                  if (themeState.thememode == ThemeMode.dark) {
                    mapController!.setMapStyle(GoogleMapsApi.darkMapString);
                  }
                }),
            Container(
              height: double.infinity,
              alignment: Alignment.bottomCenter,
              padding:
                   EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01877934, left: MediaQuery.of(context).size.height * 0.01877934, right: MediaQuery.of(context).size.height * 0.01877934),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
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
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            ourWhite.withOpacity(0),
                            themeState.thememode == ThemeMode.light
                                ? ourWhite
                                : ourDarkThemeBackgroundNavey,
                          ]),
                    ),
                    child: Text('ETA: $_secondsRemaining',
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w300)),
                  ),
                ],
              ),

            ),
          ]));
    });
  }

  void listenToDriverLocation() {
    final databaseReference = FirebaseDatabase.instance.ref();
    databaseReference
        .child(
            'Route/${widget.route.id}/${widget.isGoing}/Bus/${widget.bus.id}/currentLocation')
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
              ),
            );
            addEndMarkers();
          });

          googleApi.moveToLocation(mapController!, LatLng(latitude, longitude));
        }
      }
    });
  }

  void addEndMarkers() {
    markers.add(Marker(
      markerId: MarkerId('endingPoint'),
      position: LatLng(
        widget.endingPoint.latitude,
        widget.endingPoint.longitude,
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    ));
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          timer.cancel();
          sl<ApiService>()
              .finishTrip()
              .then((value) => {
                    showDialog(
                        context: context,
                        builder: (context) => RatingDialog(
                              title: AppLocalizations.of(context)!.youArived,
                              description:
                                  AppLocalizations.of(context)!.howWasTripMsg,
                              onConfirm: () {
                                //TODO Rating
                                Navigator.pop(context);
                              },
                            )).then((value) => {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()),
                              (Route<dynamic> route) => false)
                        })
                  })
              // ignore: body_might_complete_normally_catch_error
              .catchError((error, stackTrace) {
            print('Error: ${error.toString()}');
            showDialog(
                context: context,
                builder: (context) => Warning(
                    title: AppLocalizations.of(context)!.ops,
                    description: AppLocalizations.of(context)!.somthingWrong));
          });
          ;
        }
      });
    });
  }
}
