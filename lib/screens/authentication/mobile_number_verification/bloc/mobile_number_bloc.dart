import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'mobile_number_event.dart';
part 'mobile_number_state.dart';

class MobileNumberBloc extends Bloc<MobileNumberEvent, MobileNumberState> {
  MobileNumberBloc() : super(MobileNumberInitial()) {
    on<MobileNumberEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
