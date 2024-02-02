import 'package:flutter/material.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/screens/wallet/card/widgets/text_fields/edit_card_text_fields/buttons/updating_buttons/no_button_for_updating.dart';
import 'package:jbus_app/screens/wallet/card/widgets/text_fields/edit_card_text_fields/buttons/updating_buttons/yes_button_for_updating.dart';
import 'package:jbus_app/screens/wallet/card/widgets/text_fields/edit_card_text_fields/text_fields/card_holder_name_text_field.dart';
import 'package:jbus_app/screens/wallet/card/widgets/text_fields/edit_card_text_fields/text_fields/card_number_text_field.dart';
import 'package:jbus_app/screens/wallet/card/widgets/text_fields/edit_card_text_fields/text_fields/cvv_text_field.dart';
import 'package:jbus_app/screens/wallet/card/widgets/text_fields/edit_card_text_fields/text_fields/mm_text_field.dart';
import 'package:jbus_app/screens/wallet/card/widgets/text_fields/edit_card_text_fields/text_fields/yy_text_field.dart';
import 'package:jbus_app/screens/wallet/wallet/wallet.dart';
import 'package:jbus_app/widgets/text/our_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DoneButtonWithDialog extends StatelessWidget {
  const DoneButtonWithDialog({
    super.key,
    required this.formKey,
    required this.cardNumber,
    required this.cardHolderName,
    required this.mm,
    required this.yy,
    required this.cvv,
  });

  final GlobalKey<FormState> formKey;
  final String cardNumber;
  final String cardHolderName;
  final String mm;
  final String yy;
  final String cvv;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          if (cardNumber != EditCardNumberTextField.cardNumberController.text ||
              cardHolderName !=
                  EditCardHolderNameTextField.cardHolderNameContorller.text ||
              mm != EditMMTextField.mmController.text ||
              yy != EditYYTextField.yyController.text ||
              cvv != EditCVVTextField.cvvController.text) {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Theme(
                    data: Theme.of(context)
                        .copyWith(dialogBackgroundColor: ourWhite),
                    child: AlertDialog(
                      iconColor: ourWhite,
                      title: const Align(
                        alignment: Alignment.center,
                        child: OurText(
                          'Confirmation',
                          color: ourNavey,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      content: Container(
                        constraints: const BoxConstraints(maxHeight: 80),
                        child: const Align(
                          alignment: Alignment.center,
                          child: OurText(
                            'Are you sure you want to update your card information?',
                          ),
                        ),
                      ),
                      actions: [
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              YesButtonForUpdation(
                                  cardNumber: cardNumber,
                                  cardHolderName: cardHolderName,
                                  mm: mm,
                                  yy: yy,
                                  cvv: cvv),
                              const NoButtonForUpdating(),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                });
          } else {
            Navigator.pop(
              context,
              MaterialPageRoute(
                builder: (context) => const WalletScreen(),
              ),
            );
          }
        }
      },
      style: OutlinedButton.styleFrom(
          backgroundColor: ourNavey,
          fixedSize: const Size(111, 35),
          side: const BorderSide(
            color: ourNavey,
          )),
      child: Text(
        AppLocalizations.of(context)!.done,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: ourWhite,
        ),
      ),
    );
  }
}
