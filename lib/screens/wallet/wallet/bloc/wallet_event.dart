part of 'wallet_bloc.dart';

sealed class WalletEvent extends Equatable {
  const WalletEvent();
}

class AddCardEvent extends WalletEvent {
  const AddCardEvent({required this.paymentCard});

  final PaymentCard paymentCard;

  @override
  List<Object> get props => [paymentCard];
}
