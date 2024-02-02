import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:jbus_app/screens/wallet/wallet/widgets/payment_card.dart';
import 'package:jbus_app/services/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'wallet_event.dart';
part 'wallet_state.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  static const String _paymentCardsListKey = 'paymentCardsList';

  WalletBloc() : super(const WalletState(paymentCardsList: [])) {
    on<WalletEvent>((event, emit) {});

    on<AddCardEvent>(_addCardEvent);

    on<LoadCardsEvent>(_loadCardsEvent);

    on<DeleteCardEvent>(_deleteCardEvent);

    on<SelectCardEvent>(_selectCardEvent);
  }

  FutureOr<void> _addCardEvent(AddCardEvent event, Emitter<WalletState> emit) {
    List<PaymentCard> paymentCardsList = [
      ...state.paymentCardsList,
      event.paymentCard
    ];

    sl<SharedPreferences>().setStringList(
        _paymentCardsListKey,
        paymentCardsList
            .map((e) => e.toJson())
            .toList()
            .map((e) => json.encode(e))
            .toList());

    emit(state.copyWith(paymentCardsList: paymentCardsList));
  }

  FutureOr<void> _loadCardsEvent(
      LoadCardsEvent event, Emitter<WalletState> emit) async {
    emit(state.copyWith(isLoading: true));

    List<String>? paymentCardsListString =
        sl<SharedPreferences>().getStringList(_paymentCardsListKey);

    List<PaymentCard> paymentCardsList = paymentCardsListString != null
        ? paymentCardsListString
            .map((e) => PaymentCard.fromJson(json.decode(e)))
            .toList()
        : [];

    emit(state.copyWith(paymentCardsList: paymentCardsList, isLoading: false));
  }

  FutureOr<void> _deleteCardEvent(
      DeleteCardEvent event, Emitter<WalletState> emit) {
    List<PaymentCard> paymentCardsList = [...state.paymentCardsList];

    paymentCardsList = paymentCardsList.where((element) {
      return (element.cardHolderName != event.paymentCard.cardHolderName ||
          element.cardNumber != event.paymentCard.cardNumber ||
          element.mm != event.paymentCard.mm ||
          element.yy != event.paymentCard.yy ||
          element.cvv != event.paymentCard.cvv);
    }).toList();
    // TODO: @Ahmed: check if this is working
    sl<SharedPreferences>().setStringList(
        _paymentCardsListKey,
        paymentCardsList
            .map((e) => e.toJson())
            .toList()
            .map((e) => json.encode(e))
            .toList());

    add(const LoadCardsEvent());

    emit(state.copyWith(paymentCardsList: paymentCardsList, isLoading: false));
  }

  FutureOr<void> _selectCardEvent(
      SelectCardEvent event, Emitter<WalletState> emit) {
    List<PaymentCard> paymentCardsList = [...state.paymentCardsList];

    for (var element in paymentCardsList) {
      if (element.cardHolderName == event.paymentCard.cardHolderName &&
          element.cardNumber == event.paymentCard.cardNumber &&
          element.mm == event.paymentCard.mm &&
          element.yy == event.paymentCard.yy &&
          element.cvv == event.paymentCard.cvv) {
        element.icon = Icons.check_box_outlined;
      }
    }

    emit(state.copyWith(paymentCardsList: paymentCardsList, isLoading: false));
  }
}
