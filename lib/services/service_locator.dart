import 'package:get_it/get_it.dart';
import 'package:jbus_app/services/navigation_service.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final GetIt sl = GetIt.instance;

void setupLocator() {
  // Register services here
  sl.registerSingleton(NavigationService());
}

localeInstance() =>
    AppLocalizations.of(sl<NavigationService>().navigatorKey.currentContext!)!;
