import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/screens/wallet/card/widgets/text_fields/edit_card_text_fields/text_fields/card_holder_name_text_field.dart';
import 'package:jbus_app/screens/wallet/card/widgets/text_fields/edit_card_text_fields/text_fields/card_number_text_field.dart';
import 'package:jbus_app/screens/wallet/card/widgets/text_fields/edit_card_text_fields/text_fields/cvv_text_field.dart';
import 'package:jbus_app/screens/wallet/card/widgets/text_fields/edit_card_text_fields/text_fields/mm_text_field.dart';
import 'package:jbus_app/screens/wallet/card/widgets/text_fields/edit_card_text_fields/text_fields/yy_text_field.dart';
import 'package:jbus_app/screens/wallet/wallet/bloc/wallet_bloc.dart';
import 'package:jbus_app/screens/wallet/wallet/wallet.dart';
import 'package:jbus_app/screens/wallet/wallet/widgets/payment_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class YesButtonForDeletion extends StatelessWidget {
  const YesButtonForDeletion({
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
        Navigator.of(context).pop();
        Navigator.pop(
          context,
          MaterialPageRoute(
            builder: (context) => const WalletScreen(),
          ),
        );

        final walletBloc = BlocProvider.of<WalletBloc>(context);
        walletBloc.add(
          DeleteCardEvent(
            paymentCard: PaymentCard(
              cardNumber: cardNumber,
              cardHolderName: cardHolderName,
              cvv: cvv,
              mm: mm,
              yy: yy,
            ),
          ),
        );
        EditCardNumberTextField.cardNumberController.text = '';

        EditCardHolderNameTextField.cardHolderNameContorller.text = '';

        EditCVVTextField.cvvController.text = '';

        EditMMTextField.mmController.text = '';

        EditYYTextField.yyController.text = '';
      },
      style: OutlinedButton.styleFrom(
          backgroundColor: ourWhite,
          fixedSize: const Size(120, 35),
          side: const BorderSide(
            color: ourNavey,
          )),
      child: Text(
        AppLocalizations.of(context)!.yes,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: ourNavey,
        ),
      ),
    );
  }
}
