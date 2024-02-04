import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jbus_app/screens/wallet/wallet/bloc/wallet_bloc.dart';
import 'package:jbus_app/screens/wallet/wallet/widgets/payment_card.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // final myBloc = BlocProvider.of(context);
    int i = 1;

    return BlocBuilder<WalletBloc, WalletState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('TestScreen'),
          ),
          body: Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.35211268,
              child: ListView.builder(
                  itemCount:
                      //state.paymentCardsList.length
                      i++,
                  itemBuilder: (context, index) {
                    return PaymentCard(
                        cardNumber: state.paymentCardsList[index].cardNumber,
                        cardHolderName:
                            state.paymentCardsList[index].cardHolderName,
                        cvv: state.paymentCardsList[index].cvv,
                        mm: state.paymentCardsList[index].mm,
                        yy: state.paymentCardsList[index].yy);

                    // Card(
                    //   child: state.paymentCardsList[index],
                    // );
                  }),
            ),
          ),
        );
      },
    );
  }
}
