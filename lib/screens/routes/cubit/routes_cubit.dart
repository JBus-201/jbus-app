import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jbus_app/data/api/api_service.dart';
import 'package:jbus_app/data/models/bus_route.dart';

part 'routes_state.dart';

class RoutesCubit extends Cubit<RoutesState> {
  final ApiService apiService;

  RoutesCubit({required this.apiService}) : super(RoutesInitial());

  void fetchRoutes() async {
    emit(RoutesLoading());
    try {
      final routes = await apiService.getRoutes();
      emit(RoutesLoaded(routes, routes));
    } catch (error) {
      emit(RoutesError(error.toString()));
    }
  }

  void searchRoutes(String query) async {
    final routes = (state as RoutesLoaded).routes;
    emit(RoutesLoading());
    final filteredRoutes = _searchRoutes(query, routes);
    emit(RoutesLoaded(routes, filteredRoutes));
  }

  List<BusRoute> _searchRoutes(String query, List<BusRoute> routes) {
    final filteredRoutes = <BusRoute>[];
    for (final route in routes) {
      if (route.name!.toLowerCase().contains(query.toLowerCase())) {
        filteredRoutes.add(route);
      }
      if (route.startingPoint.name!
          .toLowerCase()
          .contains(query.toLowerCase())) {
        filteredRoutes.add(route);
      }
      if (route.endingPoint.name!.toLowerCase().contains(query.toLowerCase())) {
        filteredRoutes.add(route);
      }
    }
    return filteredRoutes;
  }

  void clearSearch() {
    if (state is RoutesLoaded) {
      final currentState = state as RoutesLoaded;
      emit(RoutesLoaded(currentState.routes, currentState.routes));
    }
  }
}
