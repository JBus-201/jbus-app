import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'main_drawer_event.dart';
part 'main_drawer_state.dart';

class MainDrawerBloc extends Bloc<MainDrawerEvent, MainDrawerState> {
  MainDrawerBloc() : super(MainDrawerInitial()) {
    on<MainDrawerEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
