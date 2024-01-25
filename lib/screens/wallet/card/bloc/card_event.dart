part of 'card_bloc.dart';

sealed class CardEvent extends Equatable {
  const CardEvent();
}

class ChangeCardNumberEvent extends CardEvent {
  const ChangeCardNumberEvent({required this.cardNumber});
  final String cardNumber;
  @override
  List<Object> get props => [cardNumber];
}

class ChangeCVVEvent extends CardEvent {
  const ChangeCVVEvent({required this.cvv});
  final String cvv;
  @override
  List<Object> get props => [cvv];
}

class ChangeMMEvent extends CardEvent {
  const ChangeMMEvent({required this.mm});
  final String mm;
  @override
  List<Object> get props => [mm];
}

class ChangeYYEvent extends CardEvent {
  const ChangeYYEvent({required this.yy});
  final String yy;
  @override
  List<Object> get props => [yy];
}



class ChangeCardHolderNameEvent extends CardEvent {
  const ChangeCardHolderNameEvent({required this.cardHolderName});
  final String cardHolderName;
  @override
  List<Object> get props => [cardHolderName];
}
