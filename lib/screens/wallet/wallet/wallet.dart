import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/screens/wallet/card/add_card.dart';
import 'package:jbus_app/screens/wallet/card/bloc/card_bloc.dart';
import 'package:jbus_app/screens/wallet/wallet/bloc/wallet_bloc.dart';
import 'package:jbus_app/screens/wallet/wallet/widgets/navey_wallet_container.dart';
import 'package:jbus_app/widgets/text/our_text.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  //static List<PaymentCard> paymentCardsList = [];

  // PaymentCard(
  //     cardNumber: '9999999999999999',
  //     cardHolderName: '44',
  //     cvv: '44',
  //     mm: '44',
  //     yy: '44'),

  // PaymentCard(
  //     cardNumber: 's423423424sd',
  //     cardHolderName: '4ddsdfsdfdd4',
  //     cvv: 'dss',
  //     mm: '4d',
  //     yy: 'ds'),
  // const PaymentCard(),
  // const PaymentCard(),
  // const PaymentCard(),
  // const PaymentCard(),
  //];

  @override
  Widget build(BuildContext context) {
    // cardsList.add(
    //   const PaymentCard(),
    // );

    return BlocBuilder<WalletBloc, WalletState>(
      builder: (context, state) {
        // List<PaymentCard> paymentCardsList = [...state.paymentCardsList];
        // print('bloc Builder: $paymentCardsList');

        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            foregroundColor: ourWhite,
          ),
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const NaveyWalletContainer(),
                const SizedBox(
                  height: 14,
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 20, top: 20.0, bottom: 20, left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OurText(
                            AppLocalizations.of(context)!.cards,
                            
                              fontSize: 35,
                              fontWeight: FontWeight.w600,
                              //color: Color.fromARGB(255, 58, 58, 58),
                              color: ourNavey,
                              darkColor: ourWhite,
                            
                          ),

                          IconButton(
                            onPressed: () {

                              final cardBloc = BlocProvider.of<CardBloc>(context);

          cardBloc.add(const ChangeCardHolderNameEvent(cardHolderName: ''));
          cardBloc.add(const ChangeCardNumberEvent(cardNumber: ''));
          cardBloc.add(const ChangeCVVEvent(cvv: ''));
          cardBloc.add(const ChangeMMEvent(mm: ''));
          cardBloc.add(const ChangeYYEvent(yy: ''));





                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder:
                                      (context, animation, secondaryAnimation) {
                                    return const AddCardScreen();
                                  },
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    const begin = Offset(0.0, 1.0);
                                    const end = Offset.zero;
                                    const curve = Curves.easeInOut;
                                    var tween = Tween(begin: begin, end: end)
                                        .chain(CurveTween(curve: curve));
                                    var offsetAnimation =
                                        animation.drive(tween);

                                    return SlideTransition(
                                      position: offsetAnimation,
                                      child: child,
                                    );
                                  },
                                  transitionDuration:
                                      const Duration(milliseconds: 500),
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.add_circle_outline_outlined,
                              fill: 0.1,
                            ),
                            color: ourNavey,
                            iconSize: 35,
                          ),

                          // OutlinedButton(
                          //   style: OutlinedButton.styleFrom(
                          //     shape: RoundedRectangleBorder(
                          //       borderRadius: BorderRadius.circular(44.0),
                          //     ),
                          //     side: const BorderSide(width: 2, color: Colors.green),
                          //   ),
                          //   onPressed: () {},
                          //   child: const Icon(Icons.add_circle_outline_outlined),
                          // ),

                          // CircularElevatedButton(
                          //   onPressed: () {},
                          //   icon: Icons.add_circle_outline_outlined,
                          //   size: 20,
                          //   gradient: const RadialGradient(
                          //       colors: [Colors.green, Colors.blue]),
                          // ),
                          // TextButton(
                          //   onPressed: () {},
                          //   //{
                          //   //   showDialog(
                          //   //     context: context,
                          //   //     builder: (context) => const Warning(
                          //   //         title: "Feature Not Implemented",
                          //   //         description:
                          //   //             "This feature is under development and will be available soon."),
                          //   //   );
                          //   // },
                          //   // style: TextButton.styleFrom(

                          //   // ),
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.end,
                          //     children: [
                          //       Text(
                          //         AppLocalizations.of(context)!.add,
                          //         style: const TextStyle(
                          //           fontSize: 20,
                          //           //color: Color.fromARGB(255, 58, 58, 58),
                          //           color: Color.fromARGB(255, 30, 75, 124),
                          //         ),
                          //       ),
                          //       const SizedBox(
                          //         width: 3,
                          //       ),
                          //       const Icon(
                          //         Icons.add,
                          //         //color: Color.fromARGB(255, 58, 58, 58),
                          //         color: Color.fromARGB(255, 30, 75, 124),
                          //       ),
                          //     ],
                          //   ),
                          // )
                        ],
                      ),
                    ),
                    // Text(
                    //   '${state.paymentCardsList.length}',
                    //   style: const TextStyle(color: ourNavey),
                    // ),
                    // OurText('${state.paymentCardsList.length}'),
                    SizedBox(
                      height: 300,
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          reverse: true,
                          itemCount: state.paymentCardsList.length,
                          itemBuilder: (context, index) {
                            // print(
                            //     'list View Builder: ${state.paymentCardsList.length}');
                            if (state.paymentCardsList.isEmpty) {
                              return Container(
                                color: ourWhite,
                              );
                            }
                            return state.paymentCardsList[index];

                          }),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Icon(Icons.check),
                        Image.asset(
                          'assets/images/protected.png',
                          scale: 16,
                          color: ourGray,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        OurText(
                            AppLocalizations.of(context)!
                                .yourPaymentDataIsStoredSecurely,
                            color: ourGray,
                            fontSize: 16),
                      ],
                    ),
                  ],
                )
              ],
            ),
            // const PaymentCard(),
            // const PaymentCard(),
            //cardsList[0],
          ),
        );
      },
    );
  }
}
