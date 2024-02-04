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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const AddFavoriteScreen();
                        },
                      ),
                    ).then((value) => context
                        .read<FavoritePointsCubit>()
                        .fetchFavoritePoints());
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
        padding:  EdgeInsets.all(MediaQuery.of(context).size.height * 0.0093896),
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
                    padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.0093896),
                    child: Column(
                      children: [
                        ClipRRect(
                            borderRadius:  BorderRadius.only(
                              topLeft: Radius.circular(MediaQuery.of(context).size.height * 0.0187793),
                              topRight: Radius.circular(MediaQuery.of(context).size.height * 0.0187793),
                            ),
                            child: GoogleMapsApi().getPointImage(
                                point.point.latitude,
                                point.point.longitude,
                                ourBlue)),
                        Padding(
                          padding:  EdgeInsets.only(
                            left: MediaQuery.of(context).size.height * 0.0093896,
                            right: MediaQuery.of(context).size.height * 0.0093896,
                            top: MediaQuery.of(context).size.height * 0.0093896,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
  }
}
