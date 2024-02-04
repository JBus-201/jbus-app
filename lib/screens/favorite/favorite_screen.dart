import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/data/api/google_service.dart';
import 'package:jbus_app/screens/favorite/add_favorite_screen.dart';
import 'package:jbus_app/screens/favorite/cubit/favorite_points_cubit.dart';
import 'package:jbus_app/screens/trip/tripSettup.dart';
import 'package:jbus_app/services/service_locator.dart';
import 'package:jbus_app/widgets/others/app_bar_title_logo.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
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
          return Scaffold(
            appBar: AppBar(
              title: const JbusAppBarTitle(),
              actions: [
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) {
                    //       return const AddFavoriteScreen();
                    //     },
                    //   ),
                    // ).then((value) => context
                    //     .read<FavoritePointsCubit>()
                    //     .fetchFavoritePoints());
                  },
                ),
              ],
            ),
            body: _buildContent(context, state),
          );
        },
      ),
    );
  }

  Widget _buildContent(BuildContext context, FavoritePointsState state) {
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
                            child: GoogleMapsApi().getPointImage(
                                point.point.latitude,
                                point.point.longitude,
                                ourBlue)),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 8,
                            right: 8,
                            top: 8,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                //TODO
                                children: [
                                  Text(
                                    point.point.name ?? '',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    point.route.name ?? '${point.route.name}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w300),
                                  ),
                                ],
                              ),
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
  }
}
