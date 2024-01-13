part of 'favorite_points_cubit.dart';

abstract class FavoritePointsState extends Equatable {
  const FavoritePointsState();

  @override
  List<Object> get props => [];
}

// Initial state
class FavoritePointsInitial extends FavoritePointsState {}

// Loading state
class FavoritePointsLoading extends FavoritePointsState {}

// Loaded state with data
class FavoritePointsLoaded extends FavoritePointsState {
  final List<FavoritePoint> points;

  const FavoritePointsLoaded(this.points);

  @override
  List<Object> get props => [points];
}

// Error state with message
class FavoritePointsError extends FavoritePointsState {
  final String errorMessage;

  const FavoritePointsError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
