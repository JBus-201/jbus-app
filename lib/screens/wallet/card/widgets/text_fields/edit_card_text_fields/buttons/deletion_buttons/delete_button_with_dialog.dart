import 'package:flutter/material.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/screens/wallet/card/widgets/text_fields/edit_card_text_fields/buttons/deletion_buttons/no_button_for_deletion.dart';
import 'package:jbus_app/screens/wallet/card/widgets/text_fields/edit_card_text_fields/buttons/deletion_buttons/yes_button_for_deletion.dart';
import 'package:jbus_app/widgets/text/our_text.dart';

class DeleteButtonWithDialog extends StatelessWidget {
  const DeleteButtonWithDialog({
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

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: ourWhite,
                shadowColor: ourGray,
                surfaceTintColor: ourWhite,
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
                  color: ourWhite,
                  constraints: const BoxConstraints(maxHeight: 80),
                  child: const Align(
                    alignment: Alignment.center,
                    child: OurText(
                      'Are you sure you want to delete this card from your wallet?',
                    ),
                  ),
                ),
                actions: [
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        YesButtonForDeletion(
                            cardNumber: cardNumber,
                            cardHolderName: cardHolderName,
                            cvv: cvv,
                            mm: mm,
                            yy: yy),
                        const NoButtonForDeletion(),
                      ],
                    ),
                  )
                ],
              );
            });
      },
      style: OutlinedButton.styleFrom(
          backgroundColor: ourRed,
          fixedSize: const Size(111, 35),
          side: const BorderSide(
            color: ourRed,
          )),
      child: const Text(
        'Delete',
        // AppLocalizations.of(context)!
        //  .,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: ourWhite,
        ),
      ),
    );
  }
}
