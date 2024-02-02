import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/screens/wallet/card/bloc/card_bloc.dart';
import 'package:jbus_app/screens/wallet/card/widgets/text_fields/edit_card_text_fields/buttons/deletion_buttons/delete_button_with_dialog.dart';
import 'package:jbus_app/screens/wallet/card/widgets/text_fields/edit_card_text_fields/buttons/updating_buttons/done_button_with_dialog.dart';
import 'package:jbus_app/screens/wallet/card/widgets/text_fields/edit_card_text_fields/containers/card_for_updating.dart';
import 'package:jbus_app/screens/wallet/card/widgets/text_fields/edit_card_text_fields/text_fields/card_holder_name_text_field.dart';
import 'package:jbus_app/screens/wallet/card/widgets/text_fields/edit_card_text_fields/text_fields/card_number_text_field.dart';
import 'package:jbus_app/screens/wallet/card/widgets/text_fields/edit_card_text_fields/text_fields/cvv_text_field.dart';
import 'package:jbus_app/screens/wallet/card/widgets/text_fields/edit_card_text_fields/text_fields/mm_text_field.dart';
import 'package:jbus_app/screens/wallet/card/widgets/text_fields/edit_card_text_fields/text_fields/yy_text_field.dart';

class EditCardScreen extends StatelessWidget {
  const EditCardScreen({
    super.key,
    required this.cardNumber,
    required this.cardHolderName,
    required this.cvv,
    required this.mm,
    required this.yy,
  });

  final String cardNumber;
  final String cardHolderName;
  final String cvv;
  final String mm;
  final String yy;

  //static CardBloc cardBloc =  CardBloc();

  @override
  Widget build(BuildContext context) {
    // final cardBloc = BlocProvider.of<CardBloc>(context);

    // cardBloc.add(ChangeCardHolderNameEvent(cardHolderName: EditCardHolderNameTextField.cardHolderNameContorller.text));
    // cardBloc.add(ChangeCardNumberEvent(cardNumber: cardNumber));
    // cardBloc.add(ChangeCVVEvent(cvv: cvv));
    // cardBloc.add(ChangeMMEvent(mm: mm));
    // cardBloc.add(ChangeYYEvent(yy: yy));

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
                const SliverAppBar(
                  foregroundColor: ourNavey,
                ),
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
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              DeleteButtonWithDialog(
                                                  cardNumber: cardNumber,
                                                  cardHolderName:
                                                      cardHolderName,
                                                  cvv: cvv,
                                                  mm: mm,
                                                  yy: yy),
                                              DoneButtonWithDialog(
                                                  formKey: formKey,
                                                  cardNumber: cardNumber,
                                                  cardHolderName:
                                                      cardHolderName,
                                                  mm: mm,
                                                  yy: yy,
                                                  cvv: cvv),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          const CardContainerForUpdating(),
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
                                          EditCardNumberTextField(),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Expanded(
                                                child: EditMMTextField(),
                                              ),
                                              Expanded(
                                                child: EditYYTextField(),
                                              ),
                                            ],
                                          ),
                                          EditCVVTextField(),
                                          EditCardHolderNameTextField(),
                                        ],
                                      ),
                                    ),
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
