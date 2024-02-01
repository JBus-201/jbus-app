part of 'wallet_bloc.dart';

class WalletState extends Equatable {
  const WalletState({required this.paymentCardsList, this.isLoading = false});

  final List<PaymentCard> paymentCardsList;
  final bool isLoading;

  @override
  List<Object> get props => [paymentCardsList, isLoading];

  WalletState copyWith({List<PaymentCard>? paymentCardsList, bool? isLoading}) {
    return WalletState(
        paymentCardsList: paymentCardsList ?? this.paymentCardsList,
        isLoading: isLoading ?? this.isLoading);
  }
}
