import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jbus_app/screens/wallet/wallet/widgets/payment_card.dart';
part 'wallet_event.dart';
part 'wallet_state.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  WalletBloc() : super(const WalletState(paymentCardsList: [])) {
    on<WalletEvent>((event, emit) {});

    on<AddCardEvent>(_addCardEvent);
  }

  FutureOr<void> _addCardEvent(AddCardEvent event, Emitter<WalletState> emit) {
    List<PaymentCard> paymentCardsList = [...state.paymentCardsList];
    paymentCardsList.add(event.paymentCard);

    for (int i = 0; i < state.paymentCardsList.length - 1; i++) {
      print(state.paymentCardsList[i].cardNumber);
    }

    // they are not being stored in the state list, why? i don't know..
    // try it in another program..

    // print(paymentCardsList[paymentCardsList.length - 2].cardNumber);
    // print(paymentCardsList[paymentCardsList.length - 1].cardNumber);

    print('Card has been added!');
    emit(state.copyWith(paymentCardsList));
  }
}
