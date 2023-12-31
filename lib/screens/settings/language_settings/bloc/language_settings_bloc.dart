import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'language_settings_event.dart';
part 'language_settings_state.dart';

class LanguageSettingsBloc
    extends Bloc<LanguageSettingsEvent, LanguageSettingsState> {
  LanguageSettingsBloc() : super(LanguageSettingsInitial()) {
    on<LanguageSettingsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
