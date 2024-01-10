part of 'mobile_number_bloc.dart';

sealed class MobileNumberState extends Equatable {
  const MobileNumberState();
  
  @override
  List<Object> get props => [];
}

final class MobileNumberInitial extends MobileNumberState {}
