part of 'wallet_balance_bloc.dart';

class WalletBalanceState extends Equatable {
  const WalletBalanceState({this.walletBalance = 00.00});

  final double walletBalance;

  @override
  List<Object> get props => [walletBalance];

  WalletBalanceState copyWith(double walletBalance) {
    return WalletBalanceState(walletBalance: walletBalance);
  }
}
