import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'card_event.dart';
part 'card_state.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  CardBloc()
      : super(const CardState(
          cardNumber: '#### #### #### ####',
          cvv: '###',
          mm: 'mm',
          yy: 'yy',
          cardHolderName: 'Card   Holder   Name',
          // AppLocalizations.of(context as BuildContext)!.cardHolderName,
        )) {
    on<CardEvent>((event, emit) {});

    on<ChangeCardNumberEvent>(_changeCardNumberEvent);
    on<ChangeCVVEvent>(_changeCVVEvent);
    on<ChangeMMEvent>(_changeMMEvent);
    on<ChangeYYEvent>(_changeYYEvent);
    on<ChangeCardHolderNameEvent>(_changeCardHolderNameEvent);
  }

  FutureOr<void> _changeCardNumberEvent(
      ChangeCardNumberEvent event, Emitter<CardState> emit) {
    String cardNumber = event.cardNumber;

    switch (cardNumber.length) {
      case 0:
        cardNumber += '#### #### #### ####';
        break;

      case 1:
        cardNumber += '### #### #### ####';
        break;

      case 2:
        cardNumber += '## #### #### ####';
        break;

      case 3:
        cardNumber += '# #### #### ####';
        break;

      case 4:
        cardNumber += ' #### #### ####';
        break;

      case 5:
        cardNumber += '#### #### ####';
        break;

      case 6:
        cardNumber += '### #### ####';
        break;

      case 7:
        cardNumber += '## #### ####';
        break;

      case 8:
        cardNumber += '# #### ####';
        break;

      case 9:
        cardNumber += ' #### ####';
        break;

      case 10:
        cardNumber += '#### ####';
        break;

      case 11:
        cardNumber += '### ####';
        break;

      case 12:
        cardNumber += '## ####';
        break;

      case 13:
        cardNumber += '# ####';
        break;

      case 14:
        cardNumber += ' ####';
        break;

      case 15:
        cardNumber += '####';
        break;

      case 16:
        cardNumber += '###';
        break;

      case 17:
        cardNumber += '##';
        break;

      case 18:
        cardNumber += '#';
        break;
    }

    emit(state.copyWith(
        cardNumber: cardNumber,
        cvv: state.cvv,
        mm: state.mm,
        yy: state.yy,
        cardHolderName: state.cardHolderName));
  }

  FutureOr<void> _changeCVVEvent(
      ChangeCVVEvent event, Emitter<CardState> emit) {
    String cvv = event.cvv;

    switch (cvv.length) {
      case 0:
        cvv += '###';
        break;

      case 1:
        cvv += '##';
        break;

      case 2:
        cvv += '#';
        break;
    }

    emit(state.copyWith(
        cardNumber: state.cardNumber,
        cvv: cvv,
        mm: state.mm,
        yy: state.yy,
        cardHolderName: state.cardHolderName));
  }

  FutureOr<void> _changeMMEvent(ChangeMMEvent event, Emitter<CardState> emit) {
    String mm = event.mm;

    switch (mm.length) {
      case 0:
        mm += 'mm';
        break;

      case 1:
        mm += 'm';
        break;
    }

    emit(state.copyWith(
        cardNumber: state.cardNumber,
        cvv: state.cvv,
        mm: mm,
        yy: state.yy,
        cardHolderName: state.cardHolderName));
  }

  FutureOr<void> _changeYYEvent(ChangeYYEvent event, Emitter<CardState> emit) {
    String yy = event.yy;

    switch (yy.length) {
      case 0:
        yy += 'yy';
        break;

      case 1:
        yy += 'y';
        break;
    }

    emit(state.copyWith(
        cardNumber: state.cardNumber,
        cvv: state.cvv,
        mm: state.mm,
        yy: yy,
        cardHolderName: state.cardHolderName));
  }

  FutureOr<void> _changeCardHolderNameEvent(
      ChangeCardHolderNameEvent event, Emitter<CardState> emit) {
    String cardHolderName = event.cardHolderName;

    switch (cardHolderName.length) {
      case 0:
        cardHolderName += 'Card Holder Name';
        break;
    }

    emit(state.copyWith(
        cardNumber: state.cardNumber,
        cvv: state.cvv,
        mm: state.mm,
        yy: state.yy,
        cardHolderName: cardHolderName));
  }
}
