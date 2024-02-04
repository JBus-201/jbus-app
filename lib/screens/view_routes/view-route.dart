import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/data/api/api_service.dart';
import 'package:jbus_app/data/api/google_service.dart';
import 'package:jbus_app/data/models/bus_route.dart';
import 'package:jbus_app/data/models/favorite_point.dart';
import 'package:jbus_app/screens/view_routes/view-dialog.dart';
import 'package:jbus_app/services/service_locator.dart';
import 'package:jbus_app/themes/appbar_style.dart';
import 'package:jbus_app/widgets/buttons/circular_elevated_button.dart';
import 'package:jbus_app/widgets/others/app_bar_title_logo.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jbus_app/widgets/warnings/warning.dart';

class ViewSelectedRoutePage extends StatefulWidget {
  final BusRoute route;
  const ViewSelectedRoutePage({
    super.key,
    required this.route,
  });

  @override
  State<ViewSelectedRoutePage> createState() => _ViewSelectedRoutePageState();
}

class _ViewSelectedRoutePageState extends State<ViewSelectedRoutePage> {
  bool isGoing = true;
  Set<Marker> markers = {};
  GoogleMapsApi googleApi = GoogleMapsApi();
  late GoogleMapController _mapController;
  dynamic route;
  int currentIndex = 0;
  List<FavoritePoint>? favoritePointsList;

  void initState() {
    super.initState();
    route = widget.route;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize:  Size.fromHeight(MediaQuery.of(context).size.height * 0.134976),
        child: AppBar(
          automaticallyImplyLeading: true,
          elevation: 0,
          backgroundColor: ourBlack.withOpacity(0),
          title: const JbusAppBarTitle(),
          flexibleSpace: const AppBarStyle(),
        ),
      ),
      body: Stack(
        children: [
          FutureBuilder<List<FavoritePoint>>(
            future: sl<ApiService>().getFavoritePointsInRoute(widget.route.id),
            builder: (context, favPointsSnapshot) {
              if (favPointsSnapshot.connectionState ==
                  ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (favPointsSnapshot.hasError) {
                return Center(
                  child: Text('Error: ${favPointsSnapshot.error}'),
                );
              } else if (!favPointsSnapshot.hasData) {
                return Center(
                  child: Text(AppLocalizations.of(context)!.noFavePointsMsg),
                );
              } else {
                favoritePointsList = favPointsSnapshot.data;
                print('\n\nfav list lengetth${favoritePointsList!.length}\n\n');
                markers = {
                  Marker(
                    markerId:
                        MarkerId(widget.route.startingPoint.id.toString()),
                    position: LatLng(
                        widget.route.startingPoint.location.latitude,
                        widget.route.startingPoint.location.longitude),
                    infoWindow: InfoWindow(
                      title: widget.route.startingPoint.name,
                      snippet: AppLocalizations.of(context)!.predefinedStop,
                    ),
                  ),
                };
                if (favoritePointsList!.isNotEmpty &&
                    favoritePointsList != null) {
                  for (var favPoint in favoritePointsList!) {
                    markers.add(Marker(
                      markerId: MarkerId(favPoint.id.toString()),
                      position: LatLng(
                          favPoint.point.latitude, favPoint.point.longitude),
                      icon: BitmapDescriptor.defaultMarkerWithHue(
                          BitmapDescriptor.hueGreen),
                      infoWindow: InfoWindow(
                        title: favPoint.point.name,
                        snippet: AppLocalizations.of(context)!.favoriteStops,
                      ),
                    ));
                  }
                }

                if (widget.route.predefinedStops!.points != null) {
                  final preStops = widget.route.predefinedStops!.points;
                  for (var stop in preStops!) {
                    markers.add(Marker(
                      markerId: MarkerId(stop.id.toString()),
                      position: LatLng(stop.latitude, stop.longitude),
                      icon: BitmapDescriptor.defaultMarkerWithHue(
                          BitmapDescriptor.hueGreen),
                      infoWindow: InfoWindow(
                        title: stop.name,
                        snippet: AppLocalizations.of(context)!.predefinedStop,
                      ),
                    ));
                  }
                }
                markers.add(
                  Marker(
                    markerId: MarkerId(widget.route.endingPoint.id.toString()),
                    position: LatLng(widget.route.endingPoint.location.latitude,
                        widget.route.endingPoint.location.longitude),
                    infoWindow: InfoWindow(
                      title: widget.route.endingPoint.name,
                      snippet: AppLocalizations.of(context)!.predefinedStop,
                    ),
                  ),
                );
                return GoogleMap(
                  zoomControlsEnabled: false,
                  myLocationButtonEnabled: false,
                  myLocationEnabled: true,
                  onMapCreated: (controler) {
                    _mapController = controler;
                  },
                  initialCameraPosition: CameraPosition(
                    target: LatLng(widget.route.startingPoint.location.latitude,
                        widget.route.startingPoint.location.longitude),
                    zoom: 14,
                  ),
                  markers: markers,
                  polylines: {
                    if (route.waypointsGoing != null ||
                        route.waypointsReturning != null)
                      Polyline(
                        polylineId: const PolylineId('route'),
                        color: ourBlue,
                        visible: true,
                        width: 5,
                        points: googleApi.decodePolyline(isGoing
                            ? widget.route.waypointsGoing!
                            : widget.route.waypointsReturning!),
                      ),
                  },
                  onLongPress: handleLongPress,
                );
              }
            },
          ),
          DraggableScrollableSheet(
              initialChildSize: 0.2,
              minChildSize: 0.2,
              maxChildSize: 0.3,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Container(
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [ourWhite.withOpacity(0), ourWhite],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CircularElevatedButton(
                            size: MediaQuery.of(context).size.height * 0.0352112,
                            icon: Icons.arrow_left_rounded,
                            onPressed: () {
                              if (markers.isNotEmpty && currentIndex > 0) {
                                print('Currrent index: $currentIndex');
                                currentIndex--;
                                googleApi.moveToLocation(
                                  _mapController,
                                  markers.elementAt(currentIndex).position,
                                );
                              }
                            },
                          ),
                          CircularElevatedButton(
                            size: MediaQuery.of(context).size.height * 0.0352112,
                            icon: Icons.swap_horiz_rounded,
                            onPressed: () {
                              setState(() {
                                if (widget.route.waypointsGoing != null &&
                                    widget.route.waypointsReturning != null) {
                                  isGoing = !isGoing;
                                } else {
                                  showDialog(
                                      context: context,
                                      builder: (context) => Warning(
                                          title: AppLocalizations.of(context)!
                                              .sawpError,
                                          description:
                                              AppLocalizations.of(context)!
                                                  .noOtherDirectionMsg));
                                }
                              });
                            },
                          ),
                          CircularElevatedButton(
                            size: MediaQuery.of(context).size.height * 0.0352112,
                            icon: Icons.arrow_right_rounded,
                            onPressed: () {
                              print(
                                  'Currrent index: ${favoritePointsList!.length}');
                              if (markers.isNotEmpty &&
                                  currentIndex < markers.length - 1) {
                                currentIndex++;
                                googleApi.moveToLocation(_mapController,
                                    markers.elementAt(currentIndex).position);
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              })
        ],
      ),
    );
  }

  void handleLongPress(LatLng point) {
    currentIndex = markers.length;
    print('Marker New: $currentIndex');

    markers.add(Marker(
      markerId: MarkerId("10000"),
      position: point,
      icon: BitmapDescriptor.defaultMarker,
      visible: true,
    ));
    showDialog(
        context: context,
        builder: (context) => ViewLongPressDialog(
              routeId: widget.route.id,
              location: point,
            ));
  }
}
