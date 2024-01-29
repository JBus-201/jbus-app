part of 'wallet_balance_bloc.dart';

sealed class WalletBalanceEvent extends Equatable {
  const WalletBalanceEvent();
}

class DepositBalanceEvent extends WalletBalanceEvent {
  const DepositBalanceEvent(this.walletBalance);

  final double walletBalance;

  @override
  List<Object> get props => [walletBalance];
}

class WithdrawBalanceEvent extends WalletBalanceEvent {
  const WithdrawBalanceEvent(this.walletBalance);

  final double walletBalance;

  @override
  List<Object> get props => [walletBalance];
}
