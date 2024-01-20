import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/data/api/api_service.dart';
import 'package:jbus_app/data/api/google_service.dart';
import 'package:jbus_app/data/models/bus_route.dart';
import 'package:jbus_app/data/models/favorite_point.dart';
import 'package:jbus_app/data/models/point.dart';
import 'package:jbus_app/screens/trip/bloc/pickup_bloc.dart';
import 'package:jbus_app/screens/trip/buttons/pointBT.dart';
import 'package:jbus_app/screens/trip/tripSettup.dart';
import 'package:jbus_app/services/service_locator.dart';
import 'package:jbus_app/themes/appbar_style.dart';
import 'package:jbus_app/widgets/buttons/circular_elevated_button.dart';
import 'package:jbus_app/widgets/buttons/rectangular_elevated_button.dart';
import 'package:jbus_app/widgets/others/app_bar_title_logo.dart';

class EditPickupPointPage extends StatefulWidget {
  final BusRoute route;
  final bool isGoing;
  final bool isPickup;
  final bool isDropoff;
  const EditPickupPointPage({
    super.key,
    required this.route,
    this.isGoing = true,
    this.isPickup = false,
    this.isDropoff = false,
  });

  @override
  State<EditPickupPointPage> createState() => _EditPickupPointPageState();
}

class _EditPickupPointPageState extends State<EditPickupPointPage> {
  late Point startingPoint;
  late Point endingPoint;
  late Point pickupSelectedPoint;
  late Point dropoffSelectedPoint;
  late bool isGoing;
  late bool isPickup;
  GoogleMapsApi googleApi = GoogleMapsApi();
  late GoogleMapController _mapController;
  dynamic route;
  late Future<String?> poly;
  int currentIndex = 0;
  List<FavoritePoint>? favoritePointsList;

  void initState() {
    super.initState();
    route = widget.route;
    isGoing = widget.isGoing;
    isPickup = widget.isPickup;
    startingPoint = route.startingPoint.location;
    endingPoint = route.endingPoint.location;
    pickupSelectedPoint = startingPoint;
    dropoffSelectedPoint = endingPoint;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(115.0),
        child: AppBar(
          automaticallyImplyLeading: false,
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
                return const Center(
                  child: Text('No favorite points available'),
                );
              } else {
                favoritePointsList = favPointsSnapshot.data;
                print('\n\nfav list lengetth${favoritePointsList!.length}\n\n');
                Set<Marker> markers = {
                  Marker(
                    markerId: const MarkerId("startpoint"),
                    position:
                        LatLng(startingPoint.latitude, startingPoint.longitude),
                  ),
                };
                for (var favPoint in favoritePointsList!) {
                  markers.add(Marker(
                    markerId: MarkerId(favPoint.id.toString()),
                    position: LatLng(
                        favPoint.point.latitude, favPoint.point.longitude),
                    icon: BitmapDescriptor.defaultMarkerWithHue(
                        BitmapDescriptor.hueGreen),
                    infoWindow: InfoWindow(
                      title: "Favorite Point",
                      snippet: favPoint.point.name,
                    ),
                  ));
                }
                markers.add(
                  Marker(
                    markerId: const MarkerId("endpoint"),
                    position:
                        LatLng(endingPoint.latitude, endingPoint.longitude),
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
                        ? LatLng(
                            startingPoint.latitude, startingPoint.longitude)
                        : LatLng(endingPoint.latitude, endingPoint.longitude),
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
                IsPickUpButton(
                    width: 175,
                    onPressed: () {
                      if (BlocProvider.of<PickupBloc>(context).state.isPickup) {
                        pickupSelectedPoint =
                            favoritePointsList![currentIndex].point;
                        BlocProvider.of<PickupBloc>(context)
                            .add(IsDropoffEvent());
                      } else {
                        dropoffSelectedPoint =
                            favoritePointsList![currentIndex].point;
                        BlocProvider.of<PickupBloc>(context)
                            .add(IsPickupEvent());
                      }
                    }),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircularElevatedButton(
                      size: 30,
                      icon: Icons.arrow_left_rounded,
                      onPressed: () {
                        if (favoritePointsList != null && currentIndex > 0) {
                          print('Currrent index: $currentIndex');
                          currentIndex--;
                          googleApi.moveToLocation(
                            _mapController,
                            LatLng(
                              favoritePointsList![currentIndex].point.latitude,
                              favoritePointsList![currentIndex].point.longitude,
                            ),
                          );
                        }
                      },
                    ),
                    RectangularElevatedButton(
                        text: "Select Points",
                        width: 175,
                        onPressed: () {
                          if (BlocProvider.of<PickupBloc>(context)
                              .state
                              .isPickup) {
                            pickupSelectedPoint =
                                favoritePointsList![currentIndex].point;
                          } else {
                            dropoffSelectedPoint =
                                favoritePointsList![currentIndex].point;
                          }
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
                        if (favoritePointsList != null &&
                            currentIndex < favoritePointsList!.length - 1) {
                          currentIndex++;
                          googleApi.moveToLocation(
                            _mapController,
                            LatLng(
                              favoritePointsList![currentIndex].point.latitude,
                              favoritePointsList![currentIndex].point.longitude,
                            ),
                          );
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
