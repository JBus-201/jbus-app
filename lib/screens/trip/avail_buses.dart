import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/data/api/api_service.dart';
import 'package:jbus_app/data/api/google_service.dart';
import 'package:jbus_app/data/models/bus.dart';
import 'package:jbus_app/data/models/bus_route.dart';
import 'package:jbus_app/data/models/point.dart';
import 'package:jbus_app/data/models/point_create_request.dart';
import 'package:jbus_app/data/models/trip_create_request.dart';
import 'package:jbus_app/screens/trip/eta.dart';
import 'package:jbus_app/screens/trip/waiting_bus.dart';
import 'package:jbus_app/services/service_locator.dart';
import 'package:jbus_app/themes/appbar_style.dart';
import 'package:jbus_app/themes/bloc/theme_bloc.dart';
import 'package:jbus_app/widgets/buttons/circular_elevated_button.dart';
import 'package:jbus_app/widgets/others/app_bar_title_logo.dart';
import 'package:jbus_app/widgets/warnings/warning.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TripAvailableBuses extends StatefulWidget {
  final BusRoute route;
  final bool isGoing;
  final Point startingPoint;
  final Point endingPoint;

  const TripAvailableBuses({
    super.key,
    required this.route,
    required this.isGoing,
    required this.startingPoint,
    required this.endingPoint,
  });

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
  int busesNum = 0;
  int currentIndex = 1;
  int currentPassNum = 0;
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
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, themeState) {
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
        body: Stack(
          children: [
            GoogleMap(
              zoomControlsEnabled: false,
              myLocationButtonEnabled: false,
              myLocationEnabled: true,
              initialCameraPosition: CameraPosition(
                target: startLatLng!,
                zoom: 12.0,
              ),
              markers: markers,
              onMapCreated: (controller) {
                mapController = controller;
                if (themeState.thememode == ThemeMode.dark) {
                  mapController!.setMapStyle(GoogleMapsApi.darkMapString);
                }
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.11737089,
                  width: double.infinity,
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircularElevatedButton(
                        size: MediaQuery.of(context).size.height * 0.03521127,
                        icon: Icons.arrow_left_rounded,
                        onPressed: () {
                          if (markers.isNotEmpty && currentIndex > 1) {
                            print('Currrent index: $currentIndex');
                            currentIndex--;
                            googleApi.moveToLocation(
                              mapController!,
                              markers.elementAt(currentIndex).position,
                            );
                          }
                        },
                      ),
                      Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.height * 0.0821596,
                          height: MediaQuery.of(context).size.height * 0.0821596,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: MediaQuery.of(context).size.height * 0.00058685, color: ourGray)),
                          child: Text(
                            '$busesNum',
                            textAlign: TextAlign.start,
                            style:  TextStyle(
                                fontSize: MediaQuery.of(context).size.height * 0.03521127, fontWeight: FontWeight.w300),
                          )),
                      CircularElevatedButton(
                        size: MediaQuery.of(context).size.height * 0.03521127,
                        icon: Icons.arrow_right_rounded,
                        onPressed: () {
                          if (markers.isNotEmpty &&
                              currentIndex < markers.length - 2) {
                            currentIndex++;
                            googleApi.moveToLocation(mapController!,
                                markers.elementAt(currentIndex).position);
                          }
                        },
                      ),
                    ],
                  )),
            ),
          ],
        ),
      );
    });
  }

  void listenToBusesLocations() async {
    List<Bus> activeBuses =
        await sl<ApiService>().getActiveBusesByRoute(widget.route.id);
    setState(() {
      busesNum = activeBuses.length;
    });
    print('Acitve Buses:$activeBuses');
    if (activeBuses.isNotEmpty) {
      for (var i = 0; i < activeBuses.length; i++) {
        listenToDriverLocation(i, activeBuses[i].id!, activeBuses);
      }
    } else {
      // ignore: use_build_context_synchronously
      showDialog(
              context: context,
              builder: (context) => Warning(
                  title: AppLocalizations.of(context)!.ops,
                  description: AppLocalizations.of(context)!.noAvailableBuses))
          .then((value) => {Navigator.pop(context)});
    }
  }

  void listenToDriverLocation(int index, int busId, List<Bus> activeBuses) {
    final databaseReference = FirebaseDatabase.instance.ref();
    databaseReference
        .child(
            'Route/${widget.route.id}/${widget.isGoing ? 'going' : 'returning'}/Bus/$busId/currentLocation')
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
          getCurrentPassNum(busId);
          if (currentPassNum < activeBuses.elementAt(index).capacity! || true) {
            Marker existingMarker = markers.firstWhere(
              (marker) => marker.markerId.value == busId.toString(),
              orElse: () => Marker(
                  markerId: MarkerId(busId.toString()),
                  icon: googleApi.customBusIcon!),
            );
            setState(() {
              markers.remove(existingMarker);
              markers.add(
                existingMarker.copyWith(
                  positionParam: driverLatLng,
                  iconParam: googleApi.customBusIcon!,
                  onTapParam: () {
                    showDialog(
                        context: context,
                        builder: (context) => ETAViewDialog(
                            onPress: () {
                              // DateTime currentUtcDateTime =
                              //     DateTime.now().toUtc();
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
                                  // startedAt: currentUtcDateTime,
                                  // status: "Pending",
                                  dropOffPoint: drop);
                              sl<ApiService>()
                                  .createTrip(trip, busId)
                                  .then((value) => {
                                        if (value.response.statusCode == 201)
                                          {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      TripBusWaitingPage(
                                                        route: widget.route,
                                                        isGoing: widget.isGoing,
                                                        startingPoint: widget
                                                            .startingPoint,
                                                        endingPoint:
                                                            widget.endingPoint,
                                                        bus: activeBuses[index],
                                                      )),
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
                            first: LatLng(latitude, longitude),
                            second: startLatLng!));
                  },
                ),
              );
            });
          }

          googleApi.moveToLocation(mapController!, LatLng(latitude, longitude));
        }
      }
    });
  }

  void getCurrentPassNum(int busId) {
    databaseReference
        .child(
            'Route/${widget.route.id}/${widget.isGoing ? 'going' : 'returning'}/Bus/$busId/currentPassNum')
        .onValue
        .listen((event) {
      print('Capacity: ${event.snapshot.value}');
      if (event.snapshot.value != null) {
        final Map<Object?, Object?>? cpassNum=
            event.snapshot.value as Map<Object?, Object?>?;

        if (cpassNum != null) {
          // Access the location data using the Object? keys
          final int passNum = cpassNum as int;
          setState(() {
            currentPassNum = passNum;
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
