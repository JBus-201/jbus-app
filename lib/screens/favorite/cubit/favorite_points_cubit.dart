import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jbus_app/data/api/api_service.dart';
import 'package:jbus_app/data/models/favorite_point.dart';

part 'favorite_points_state.dart';

class FavoritePointsCubit extends Cubit<FavoritePointsState> {
  final ApiService apiService;

  FavoritePointsCubit({
    required this.apiService,
  }) : super(FavoritePointsInitial());

  Future<void> fetchFavoritePoints() async {
    try {
      emit(FavoritePointsLoading());
      final points = await apiService.getFavoritePoints();
      emit(FavoritePointsLoaded(points));
    } catch (error) {
      emit(FavoritePointsError(error.toString()));
    }
  }

  Future<void> removePoint(int pointId) async {
    try {
      await apiService.deleteFavoritePoint(pointId);
      // Fetch updated list after removal
      emit(FavoritePointsLoading());
      await fetchFavoritePoints();
    } catch (error) {
      emit(FavoritePointsError(error.toString()));
    }
  }
}
