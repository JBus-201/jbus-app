part of 'qr_screen_cubit.dart';

abstract class QrScreenState extends Equatable {
  const QrScreenState();

  @override
  List<Object> get props => [];
}

class QrScreenInitial extends QrScreenState {}

class QrScreenLoading extends QrScreenState {}

class QrScreenSuccess extends QrScreenState {
  final String message;

  const QrScreenSuccess(this.message);

  @override
  List<Object> get props => [message];
}

class QrScreenFailure extends QrScreenState {
  final String message;

  const QrScreenFailure(this.message);

  @override
  List<Object> get props => [message];
}
