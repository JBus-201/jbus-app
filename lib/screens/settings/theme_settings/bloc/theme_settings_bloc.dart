import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'theme_settings_event.dart';
part 'theme_settings_state.dart';

class ThemeSettingsBloc extends Bloc<ThemeSettingsEvent, ThemeSettingsState> {
  ThemeSettingsBloc() : super(ThemeSettingsInitial()) {
    on<ThemeSettingsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
