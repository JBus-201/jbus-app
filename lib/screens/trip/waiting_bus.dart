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
import 'package:jbus_app/screens/home/home.dart';
import 'package:jbus_app/screens/qr_screen/pages/qr_screen.dart';
import 'package:jbus_app/screens/trip/intrip.dart';
import 'package:jbus_app/services/service_locator.dart';
import 'package:jbus_app/themes/appbar_style.dart';
import 'package:jbus_app/themes/bloc/theme_bloc.dart';
import 'package:jbus_app/widgets/others/app_bar_title_logo.dart';
import 'package:jbus_app/widgets/warnings/confirm.dart';
import 'package:jbus_app/widgets/warnings/warning.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
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
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, themeState) {
      return Scaffold(
          key: _scaffoldKey,
          extendBodyBehindAppBar: true,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(115.0),
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
                // ignore: unrelated_type_equality_checks
                if (themeState.thememode == ThemeMode.dark) {
                  mapController!.setMapStyle(GoogleMapsApi.darkMapString);
                }
              },
            ),
            Container(
              height: double.infinity,
              alignment: Alignment.bottomCenter,
              padding:
                  const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
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
                                  title:
                                      AppLocalizations.of(context)!.exitTripMsg,
                                  description: "",
                                  onConfirm: () {
                                    sl<ApiService>()
                                        .finishTrip()
                                        .then((value) => {
                                              Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const HomeScreen()),
                                                (Route<dynamic> route) => false,
                                              )
                                            });
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
                              Navigator.push<bool?>(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const QrScreen()))
                                  .then((value) => {
                                        value ??= false,
                                        if (value)
                                          {
                                            Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      InTripPage(
                                                        busId: widget.bus.id!,
                                                        endingPoint:
                                                            widget.endingPoint,
                                                        isGoing: widget.isGoing,
                                                        route: widget.route,
                                                        startingPoint: widget
                                                            .startingPoint,
                                                      )),
                                              (Route<dynamic> route) => true,
                                              // ignore: body_might_complete_normally_catch_error
                                            )
                                          }
                                      })
                                  // ignore: body_might_complete_normally_catch_error
                                  .catchError((error, stackTrace) {
                                print('Error: ${error.toString()}');
                                showDialog(
                                    context: context,
                                    builder: (context) => Warning(
                                        title:
                                            AppLocalizations.of(context)!.ops,
                                        description:
                                            AppLocalizations.of(context)!
                                                .somthingWrong));
                              });
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
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.center,
                          colors: [ourWhite.withOpacity(0), ourWhite]),
                    ),
                    child: const Text('ETA',
                        style: TextStyle(
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
