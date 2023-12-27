part of 'signup_bloc.dart';

@immutable
sealed class SignupEvent {}

class SwitchToVisibilityOnEvent extends SignupEvent {}

class SwitchToVisibilityOffEvent extends SignupEvent {}
