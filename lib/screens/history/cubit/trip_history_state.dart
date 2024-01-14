part of 'trip_history_cubit.dart';

sealed class TripHistoryState extends Equatable {
  const TripHistoryState();

  @override
  List<Object> get props => [];
}

final class TripHistoryInitial extends TripHistoryState {}
