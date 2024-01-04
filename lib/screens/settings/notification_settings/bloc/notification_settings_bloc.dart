import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'notification_settings_event.dart';
part 'notification_settings_state.dart';

class NotificationSettingsBloc
    extends Bloc<NotificationSettingsEvent, NotificationSettingsState> {
  NotificationSettingsBloc() : super(NotificationSettingsInitial()) {
    on<NotificationSettingsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
