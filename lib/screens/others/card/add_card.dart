import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/screens/others/card/bloc/card_bloc.dart';
import 'package:jbus_app/screens/others/card/widgets/text_fields/card_holder_name_text_field.dart';
import 'package:jbus_app/screens/others/card/widgets/text_fields/card_number_text_field.dart';
import 'package:jbus_app/screens/others/card/widgets/text_fields/cvv_text_field.dart';
import 'package:jbus_app/screens/others/card/widgets/text_fields/mm_text_field.dart';
import 'package:jbus_app/screens/others/card/widgets/text_fields/yy_text_field.dart';
import 'package:jbus_app/screens/others/wallet/bloc/wallet_bloc.dart';
import 'package:jbus_app/screens/others/wallet/testScreen.dart';
import 'package:jbus_app/screens/others/wallet/wallet.dart';
import 'package:jbus_app/screens/others/wallet/widgets/payment_card.dart';
import 'package:jbus_app/widgets/text/our_text.dart';

class AddCardScreen extends StatelessWidget {
  const AddCardScreen({super.key});

  //static CardBloc cardBloc =  CardBloc();

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    //final WalletBloc walletBloc = WalletBloc();
    //TextEditingController? controller;
    return BlocProvider(
      create: (context) => CardBloc(),
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          body: SafeArea(
            child: CustomScrollView(
              slivers: [
                const SliverAppBar(),
                //   title: const JbusAppBarTitle(),
                //   leading: OutlinedButton(
                //     onPressed: () {},
                //     style: OutlinedButton.styleFrom(
                //         side: const BorderSide(color: ourNavey)),
                //     child: Text(
                //       AppLocalizations.of(context)!.add,
                //       style: const TextStyle(
                //         fontSize: 17,
                //         fontWeight: FontWeight.w500,
                //         color: ourNavey,
                //       ),
                //     ),
                //   ),
                //   automaticallyImplyLeading:
                //       false, // Set this to false to remove the back button
                //   floating: false,
                //   pinned: false,
                // ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: 1,
                    (context, index) => BlocBuilder<CardBloc, CardState>(
                      builder: (context, state) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Form(
                                key: formKey,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 0, bottom: 8, left: 8, right: 8),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              OutlinedButton(
                                                onPressed: () {
                                                  if (formKey.currentState!
                                                      .validate()) {
                                                    final  walletBloc =
                                                        BlocProvider.of<
                                                                WalletBloc>(
                                                            context);
                                                    walletBloc.add(AddCardEvent(
                                                        paymentCard: PaymentCard(
                                                            cardNumber:
                                                                CardNumberTextField
                                                                    .cardNumberController
                                                                    .text,
                                                            cardHolderName:
                                                                CardHolderNameTextField
                                                                    .cardHolderNameContorller
                                                                    .text,
                                                            cvv: CVVTextField
                                                                .cvvController
                                                                .text,
                                                            mm: MMTextField
                                                                .mmController
                                                                .text,
                                                            yy: YYTextField
                                                                .yyController
                                                                .text)));

                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            const WalletScreen(),

                                                        // EmailVerificationScreen(
                                                        //       firstName: firstNameControllerText,
                                                        //       lastName: lastNameControllerText,
                                                        //       email: emailControllerText,
                                                        //       phoneNumber: phoneNumberControllerText,
                                                        //       password: passwordControllerText,
                                                        //     ),
                                                      ),
                                                    );
                                                  }
                                                },
                                                style: OutlinedButton.styleFrom(
                                                    side: const BorderSide(
                                                  color: ourNavey,
                                                )),
                                                child: Text(
                                                  AppLocalizations.of(context)!
                                                      .add,
                                                  style: const TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.w500,
                                                    color: ourNavey,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              gradient: const LinearGradient(
                                                colors: [
                                                  ourLightBlue,
                                                  ourBlack,
                                                ],
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                              ),
                                              image: DecorationImage(
                                                image: const AssetImage(
                                                  'assets/images/visa_background.png',
                                                ),
                                                fit: BoxFit.fill,
                                                colorFilter: ColorFilter.mode(
                                                  ourLightBlue50
                                                      .withOpacity(0.08),
                                                  BlendMode.srcOver,
                                                ),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(18),
                                            ),
                                            child: Card(
                                              color: Colors.transparent,
                                              shadowColor: Colors.transparent,
                                              surfaceTintColor:
                                                  Colors.transparent,
                                              elevation: 16.0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                side: BorderSide.none,
                                              ),
                                              margin: const EdgeInsets.all(6.0),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(12.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    OurText(
                                                      AppLocalizations.of(
                                                              context)!
                                                          .visaGold,
                                                      color: ourWhite,
                                                      fontSize: 35,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontFamily: "PTSerif",
                                                    ),
                                                    Row(
                                                      children: [
                                                        const SizedBox(
                                                          width: 6,
                                                        ),
                                                        Image.asset(
                                                          'assets/images/chip.png',
                                                          scale: 4.5,
                                                        ),
                                                        const SizedBox(
                                                          width: 7,
                                                        ),
                                                        Image.asset(
                                                          'assets/images/wifi.png',
                                                          scale: 3,
                                                        ),
                                                        const SizedBox(
                                                          width: 190,
                                                        ),
                                                        Image.asset(
                                                          'assets/images/map.png',
                                                          scale: 3.2,
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(height: 8.0),
                                                    OurText(
                                                      state.cardNumber,
                                                      color: ourWhite,
                                                      fontSize: 28,
                                                      //fontFamily: "PTSerif",
                                                    ),
                                                    Row(
                                                      children: [
                                                        const SizedBox(
                                                          width: 60,
                                                        ),
                                                        OurText(
                                                          '${state.mm}/${state.yy}',
                                                          color: ourWhite,
                                                        ),
                                                        const SizedBox(
                                                          width: 40,
                                                        ),
                                                        OurText(
                                                          state.cvv,
                                                          color: ourWhite,
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        OurText(
                                                          state.cardHolderName,
                                                          color: ourWhite,
                                                          fontFamily: "PTSerif",
                                                        ),
                                                        Image.asset(
                                                          'assets/images/visa_text.png',
                                                          scale: 3,
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),

                                    const Padding(
                                      padding:
                                          EdgeInsets.only(left: 12, right: 12),
                                      child: Column(
                                        children: [
                                          CardNumberTextField(),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Expanded(
                                                child: MMTextField(),
                                              ),
                                              Expanded(
                                                child: YYTextField(),
                                              ),
                                            ],
                                          ),
                                          CVVTextField(),
                                          CardHolderNameTextField(),
                                        ],
                                      ),
                                    ),

                                    // autocorrect: false,
                                    // enableSuggestions: false,
                                    // keyboardType: const TextInputType.numberWithOptions(),
                                    // maxLength: 16,
                                    // controller: controller,
                                    // ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
