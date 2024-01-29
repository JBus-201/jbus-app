import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'mobile_number_event.dart';
part 'mobile_number_state.dart';

class MobileNumberBloc extends Bloc<MobileNumberEvent, MobileNumberState> {
  MobileNumberBloc()
      : super(const MobileNumberState(mobileNumber: 'Add a mobile number')) {
    on<MobileNumberEvent>((event, emit) {});

    on<UpdateMobileNumberEvent>(_updateMobileNumberEvent);
  }

  FutureOr<void> _updateMobileNumberEvent(
      UpdateMobileNumberEvent event, Emitter<MobileNumberState> emit) {
    String mobileNumber;
    mobileNumber = event.mobileNumber;

    emit(state.copyWith(mobileNumber));
  }
}
