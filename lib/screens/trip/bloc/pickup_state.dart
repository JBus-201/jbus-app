part of 'pickup_bloc.dart';

class PickupState extends Equatable {
  const PickupState({this.isPickup = true,this.text = "Selecting Pickup"});
  final bool isPickup;
  final String text; 

  @override
  List<Object> get props => [isPickup,text];

  PickupState copyWith(bool isPickup,String text) {
    return PickupState(isPickup: isPickup,text: text);
  }
}
