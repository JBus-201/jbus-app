import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jbus_app/data/api/api_service.dart';
import 'package:jbus_app/data/models/passenger.dart';
import 'package:jbus_app/services/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'name_event.dart';
part 'name_state.dart';

class NameBloc extends Bloc<NameEvent, NameState> {
  NameBloc() : super(const NameState()) {
    on<NameEvent>((event, emit) {});

    on<UpdateNameEvent>(_updateNameEvent);
    on<LoadNameEvent>(_loadNameEvent);


  }

  FutureOr<void> _updateNameEvent(
      UpdateNameEvent event, Emitter<NameState> emit) {
    String firstName;
    String lastName;

    if (event.firstName == '') {
      firstName = state.firstName;
    } else {
      firstName = event.firstName;
    }

    if (event.lastName == '') {
      lastName = state.lastName;
    } else {
      lastName = event.lastName;
    }



    emit(state.copyWith(firstName, lastName));
  }

  FutureOr<void> _loadNameEvent(LoadNameEvent event, Emitter<NameState> emit) {

    //sl<ApiService>().get
    String user = sl<SharedPreferences>().getString('user')!;
    Passenger passenger = Passenger.fromJson(json.decode(user));
    
      print(passenger.user.name);

      



  }
}
