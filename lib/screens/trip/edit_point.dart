import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/data/api/api_service.dart';
import 'package:jbus_app/data/api/google_service.dart';
import 'package:jbus_app/data/models/bus_route.dart';
import 'package:jbus_app/data/models/favorite_point.dart';
import 'package:jbus_app/data/models/point.dart';
import 'package:jbus_app/screens/trip/tripSettup.dart';
import 'package:jbus_app/services/service_locator.dart';
import 'package:jbus_app/themes/appbar_style.dart';
import 'package:jbus_app/widgets/buttons/circular_elevated_button.dart';
import 'package:jbus_app/widgets/buttons/rectangular_elevated_button.dart';
import 'package:jbus_app/widgets/others/app_bar_title_logo.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditPickupPointPage extends StatefulWidget {
  final BusRoute route;
  final bool isGoing;
  final bool isPickup;
  final bool isDropoff;
  final Point startingPoint;
  final Point endingPoint;

  const EditPickupPointPage({
    super.key,
    required this.route,
    required this.startingPoint,
    required this.endingPoint,
    this.isGoing = true,
    this.isPickup = false,
    this.isDropoff = false,
  });

  @override
  State<EditPickupPointPage> createState() => _EditPickupPointPageState();
}

class _EditPickupPointPageState extends State<EditPickupPointPage> {
  late Point pickupSelectedPoint;
  late Point dropoffSelectedPoint;
  late bool isGoing;
  late bool isPickup;
  Set<Marker> markers = {};
  GoogleMapsApi googleApi = GoogleMapsApi();
  late GoogleMapController _mapController;
  dynamic route;
  int currentIndex = 0;
  List<FavoritePoint>? favoritePointsList;

  void initState() {
    super.initState();
    route = widget.route;
    isGoing = widget.isGoing;
    isPickup = widget.isPickup;
    pickupSelectedPoint = widget.startingPoint;
    dropoffSelectedPoint = widget.endingPoint;
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
                    markerId: MarkerId(widget.startingPoint.id.toString()),
                    position: LatLng(pickupSelectedPoint.latitude,
                        pickupSelectedPoint.longitude),
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
                    markerId: MarkerId(widget.endingPoint.id.toString()),
                    position: LatLng(dropoffSelectedPoint.latitude,
                        dropoffSelectedPoint.longitude),
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
                    target: widget.isPickup
                        ? LatLng(pickupSelectedPoint.latitude,
                            pickupSelectedPoint.longitude)
                        : LatLng(dropoffSelectedPoint.latitude,
                            dropoffSelectedPoint.longitude),
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
                );
              }
            },
          ),
          Container(
            height: double.infinity,
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                RectangularElevatedButton(
                    text: AppLocalizations.of(context)!.selectPick,
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    width: 175,
                    onPressed: () {
                      pickupSelectedPoint = Point(
                          name:
                              markers.elementAt(currentIndex).infoWindow.title,
                          id: int.fromEnvironment(markers
                              .elementAt(currentIndex)
                              .markerId
                              .toString()),
                          latitude:
                              markers.elementAt(currentIndex).position.latitude,
                          longitude: markers
                              .elementAt(currentIndex)
                              .position
                              .longitude,
                          createdAt: DateTime.now().toUtc());
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TripSettup(
                                  route: widget.route,
                                  isGoing: isGoing,
                                  startingPoint: pickupSelectedPoint,
                                  endingPoint: dropoffSelectedPoint)));
                    }),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircularElevatedButton(
                      size: 30,
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
                    RectangularElevatedButton(
                        text: AppLocalizations.of(context)!.selectDrop,
                        fontSize: 16,
                    fontWeight: FontWeight.w300,
                        width: 175,
                        onPressed: () {
                          dropoffSelectedPoint = Point(
                              name: markers
                                  .elementAt(currentIndex)
                                  .infoWindow
                                  .title,
                              id: int.fromEnvironment(markers
                                  .elementAt(currentIndex)
                                  .markerId
                                  .toString()),
                              latitude: markers
                                  .elementAt(currentIndex)
                                  .position
                                  .latitude,
                              longitude: markers
                                  .elementAt(currentIndex)
                                  .position
                                  .longitude,
                              createdAt: DateTime.now().toUtc());

                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TripSettup(
                                      route: widget.route,
                                      isGoing: isGoing,
                                      startingPoint: pickupSelectedPoint,
                                      endingPoint: dropoffSelectedPoint)));
                        }),
                    CircularElevatedButton(
                      size: 30,
                      icon: Icons.arrow_right_rounded,
                      onPressed: () {
                        print('Currrent index: ${favoritePointsList!.length}');
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
          )
        ],
      ),
    );
  }
}
