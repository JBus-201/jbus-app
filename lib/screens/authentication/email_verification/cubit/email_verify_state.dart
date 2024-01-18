part of 'email_verify_cubit.dart';

sealed class EmailVerifyState extends Equatable {
  const EmailVerifyState();

  @override
  List<Object> get props => [];
}

final class EmailVerifyInitial extends EmailVerifyState {}

final class EmailVerifyLoading extends EmailVerifyState {}

final class EmailVerifyFailure extends EmailVerifyState {
  final String message;

  const EmailVerifyFailure(this.message);
}

final class EmailVerifySuccess extends EmailVerifyState {}
