import 'package:flutter/material.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/screens/wallet/send_money/widgets/screens/success_money_sent_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jbus_app/screens/wallet/send_money/widgets/text_fields/account_number.dart';
import 'package:jbus_app/screens/wallet/send_money/widgets/text_fields/amount_of_money.dart';

class YesButtonForSending extends StatelessWidget {
  const YesButtonForSending({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        Navigator.of(context).pop();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SuccessMoneySentScreen(),
          ),
        );

        AmmountOfMoneyTextField.amountOfMoneyController.text = '';
        AccountNumberTextField.accountNumberCotroller.text = '';
      },
      style: OutlinedButton.styleFrom(
          fixedSize: const Size(120, 35),
          side: const BorderSide(
            color: ourNavey,
          )),
      child: Text(
        AppLocalizations.of(context)!.yes,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: ourNavey,
        ),
      ),
    );
  }
}
