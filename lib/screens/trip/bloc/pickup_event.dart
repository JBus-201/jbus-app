part of 'pickup_bloc.dart';

sealed class PickupEvent extends Equatable {
  const PickupEvent();

  @override
  List<Object> get props => [];
}
class IsPickupEvent extends PickupEvent {}
class IsDropoffEvent extends PickupEvent {}

