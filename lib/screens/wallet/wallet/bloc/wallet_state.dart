part of 'wallet_bloc.dart';

class WalletState extends Equatable {
  const WalletState({
    required this.paymentCardsList,
    this.isLoading = false,
    this.icon = Icons.check_box_outline_blank_outlined,
  });

  final List<PaymentCard> paymentCardsList;
  final bool isLoading;
  final IconData icon;

  @override
  List<Object> get props => [paymentCardsList, isLoading, icon];

  WalletState copyWith(
      {List<PaymentCard>? paymentCardsList, bool? isLoading, IconData? icon}) {
    return WalletState(
      paymentCardsList: paymentCardsList ?? this.paymentCardsList,
      isLoading: isLoading ?? this.isLoading,
      icon: icon ?? this.icon,
    );
  }
}
