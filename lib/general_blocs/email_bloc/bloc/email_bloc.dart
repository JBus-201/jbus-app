import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'email_event.dart';
part 'email_state.dart';

class EmailBloc extends Bloc<EmailEvent, EmailState> {
  EmailBloc() : super(const EmailState()) {
    on<EmailEvent>((event, emit) {});

    on<UpdateEmailEvent>(_updateEmailEvent);
  }

  FutureOr<void> _updateEmailEvent(
      UpdateEmailEvent event, Emitter<EmailState> emit) {
    String email;
    email = event.email;

    emit(state.copyWith(email));
  }
}
