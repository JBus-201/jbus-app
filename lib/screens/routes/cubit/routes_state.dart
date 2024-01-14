part of 'routes_cubit.dart';

sealed class RoutesState extends Equatable {
  const RoutesState();

  @override
  List<Object> get props => [];
}

final class RoutesInitial extends RoutesState {}

final class RoutesLoading extends RoutesState {}

final class RoutesLoaded extends RoutesState {
  final List<BusRoute> routes;
  final List<BusRoute> filteredRoutes;

  const RoutesLoaded(this.routes, this.filteredRoutes);

  @override
  List<Object> get props => [routes];
}

final class RoutesError extends RoutesState {
  final String message;

  const RoutesError(this.message);

  @override
  List<Object> get props => [message];
}
