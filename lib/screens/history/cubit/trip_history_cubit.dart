import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'trip_history_state.dart';

class TripHistoryCubit extends Cubit<TripHistoryState> {
  TripHistoryCubit() : super(TripHistoryInitial());
}
