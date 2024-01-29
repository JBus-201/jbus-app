import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'wallet_balance_event.dart';
part 'wallet_balance_state.dart';

class WalletBalanceBloc extends Bloc<WalletBalanceEvent, WalletBalanceState> {
  WalletBalanceBloc() : super(const WalletBalanceState()) {
    on<WalletBalanceEvent>((event, emit) {});

    on<DepositBalanceEvent>(_depositBalanceEvent);
    on<WithdrawBalanceEvent>(_withdrawBalanceEvent);
  }

  FutureOr<void> _depositBalanceEvent(
      DepositBalanceEvent event, Emitter<WalletBalanceState> emit) {
    double walletBalance = state.walletBalance;
    walletBalance += event.walletBalance;
    emit(state.copyWith(walletBalance));
  }

  FutureOr<void> _withdrawBalanceEvent(
      WithdrawBalanceEvent event, Emitter<WalletBalanceState> emit) {
    double walletBalance = state.walletBalance;
    walletBalance -= event.walletBalance;
    emit(state.copyWith(walletBalance));
  }
}
