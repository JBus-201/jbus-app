import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jbus_app/constants/strings.dart';
import 'package:jbus_app/screens/favorite/add_favorite_screen.dart';
import 'package:jbus_app/screens/favorite/cubit/favorite_points_cubit.dart';
import 'package:jbus_app/screens/trip/tripSettup.dart';
import 'package:jbus_app/services/service_locator.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const AddFavoriteScreen();
              }));
            },
          ),
        ],
      ),
      body: BlocProvider(
        create: (context) =>
            FavoritePointsCubit(apiService: sl())..fetchFavoritePoints(),
        child: BlocConsumer<FavoritePointsCubit, FavoritePointsState>(
          listener: (context, state) {
            if (state is FavoritePointsError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is FavoritePointsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is FavoritePointsLoaded) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: state.points.map((point) {
                      String staticMapUrl =
                          'https://maps.googleapis.com/maps/api/staticmap'
                          '?center=${point.point.latitude},${point.point.longitude}'
                          '&zoom=16&size=600x300'
                          '&maptype=roadmap'
                          '&markers=color:red%7Clabel:C%7C${point.point.latitude},${point.point.longitude}'
                          '&key=$googlApiKey';

                      return Card(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TripSettup(
                                  route: point.route,
                                  preMarkedPoint: point.point,
                                ),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(16),
                                    topRight: Radius.circular(16),
                                  ),
                                  child: Image.network(
                                    staticMapUrl,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            const Text('Error loading image'),
                                    gaplessPlayback: true,
                                    fit: BoxFit.fill,
                                    cacheHeight: 300,
                                    cacheWidth: 600,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 8,
                                    right: 8,
                                    top: 8,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(point.point.name ?? ''),
                                      Text(point.route.name ??
                                          '${point.route.startingPoint.name} - ${point.route.endingPoint.name}'),
                                      IconButton(
                                        icon: const Icon(Icons.delete),
                                        onPressed: () {
                                          context
                                              .read<FavoritePointsCubit>()
                                              .removePoint(point.id);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              );
            }

            return Container();
          },
        ),
      ),
    );
  }
}
