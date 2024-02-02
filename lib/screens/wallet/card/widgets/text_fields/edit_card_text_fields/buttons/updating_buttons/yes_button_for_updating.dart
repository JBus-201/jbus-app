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

class YesButtonForUpdation extends StatelessWidget {
  const YesButtonForUpdation({
    super.key,
    required this.cardNumber,
    required this.cardHolderName,
    required this.mm,
    required this.yy,
    required this.cvv,
  });

  final String cardNumber;
  final String cardHolderName;
  final String mm;
  final String yy;
  final String cvv;

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

        walletBloc.add(AddCardEvent(
            paymentCard: PaymentCard(
                cardNumber: EditCardNumberTextField.cardNumberController.text,
                cardHolderName:
                    EditCardHolderNameTextField.cardHolderNameContorller.text,
                cvv: EditCVVTextField.cvvController.text,
                mm: EditMMTextField.mmController.text,
                yy: EditYYTextField.yyController.text)));

        walletBloc.add(DeleteCardEvent(
            paymentCard: PaymentCard(
                cardNumber: cardNumber,
                cardHolderName: cardHolderName,
                cvv: cvv,
                mm: mm,
                yy: yy)));

        EditCardNumberTextField.cardNumberController.text = '';

        EditCardHolderNameTextField.cardHolderNameContorller.text = '';

        EditCVVTextField.cvvController.text = '';

        EditMMTextField.mmController.text = '';

        EditYYTextField.yyController.text = '';
      },
      style: OutlinedButton.styleFrom(
          backgroundColor: ourNavey,
          fixedSize: const Size(120, 35),
          side: const BorderSide(
            color: ourNavey,
          )),
      child: Text(
        AppLocalizations.of(context)!.yes,
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w500,
          color: ourWhite,
        ),
      ),
    );
  }
}
