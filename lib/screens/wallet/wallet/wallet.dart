import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/screens/wallet/card/add_card.dart';
import 'package:jbus_app/screens/wallet/card/bloc/card_bloc.dart';
import 'package:jbus_app/screens/wallet/wallet/bloc/wallet_bloc.dart';
import 'package:jbus_app/screens/wallet/wallet/widgets/navey_wallet_container.dart';
import 'package:jbus_app/screens/wallet/wallet/widgets/payment_card.dart';
import 'package:jbus_app/widgets/text/our_text.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WalletBloc, WalletState>(
      builder: (context, state) {
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
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01643192,
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.height * 0.02347418),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.cards,
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.height *
                                  0.0410798,
                              fontWeight: FontWeight.w600,
                              color: ourNavey,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              final cardBloc =
                                  BlocProvider.of<CardBloc>(context);

                              cardBloc.add(const ChangeCardHolderNameEvent(
                                  cardHolderName: ''));
                              cardBloc.add(
                                  const ChangeCardNumberEvent(cardNumber: ''));
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
                            iconSize:
                                MediaQuery.of(context).size.height * 0.0410798,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.35211268,
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          reverse: true,
                          itemCount: state.paymentCardsList.length,
                          itemBuilder: (context, index) {
                            if (state.paymentCardsList.isEmpty) {
                              return Container(
                                color: ourWhite,
                              );
                            }
                            return state.paymentCardsList[index];
                          }),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02347418,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/protected.png',
                          scale:
                              MediaQuery.of(context).size.height * 0.01877934,
                          color: ourGray,
                        ),
                        SizedBox(
                          width:
                              MediaQuery.of(context).size.height * 0.00938967,
                        ),
                        OurText(
                            AppLocalizations.of(context)!
                                .yourPaymentDataIsStoredSecurely,
                            color: ourGray,
                            fontSize: MediaQuery.of(context).size.height *
                                0.01877934),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
