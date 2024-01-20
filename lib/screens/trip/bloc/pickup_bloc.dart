import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'pickup_event.dart';
part 'pickup_state.dart';

class PickupBloc extends Bloc<PickupEvent, PickupState> {
  PickupBloc() : super(const PickupState(isPickup: false)) {
    on<PickupEvent>((event, emit) {
      on<IsPickupEvent>(_switchtoPickEvent);
      on<IsDropoffEvent>(_switchtoDropEvent);
    });
  }
  FutureOr<void> _switchtoPickEvent(
      IsPickupEvent event, Emitter<PickupState> emit) {
    //ThemeMode themeMode = ThemeMode.light;

    emit(state.copyWith(true,"Selecting Pickup"));
  }

  FutureOr<void> _switchtoDropEvent(
      IsDropoffEvent event, Emitter<PickupState> emit) {
    //ThemeMode themeMode = ThemeMode.light;

    emit(state.copyWith(false,"Selecting Dropoff"));
  }
}
