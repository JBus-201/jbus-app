
part of 'wallet_bloc.dart';

class WalletState extends Equatable {
  const WalletState({required this.paymentCardsList});

    final List<PaymentCard> paymentCardsList;

  @override
  List<Object> get props => [paymentCardsList];

  WalletState copyWith(List<PaymentCard> cardNumbersList) {
    return WalletState(paymentCardsList: cardNumbersList);
}}











