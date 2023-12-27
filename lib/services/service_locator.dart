import 'package:get_it/get_it.dart';
import 'package:jbus_app/services/navigation_service.dart';

final GetIt sl = GetIt.instance;

void setupLocator() {
  // Register services here
  sl.registerSingleton(NavigationService());
}
