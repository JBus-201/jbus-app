import 'package:flutter/material.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/screens/wallet/charge_wallet/widgets/screens/success_money_charged.dart';
import 'package:jbus_app/screens/wallet/charge_wallet/widgets/text_fields/amount_of_charge_money.dart';
import 'package:jbus_app/screens/wallet/send_money/widgets/screens/success_money_sent_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jbus_app/screens/wallet/send_money/widgets/text_fields/account_number.dart';
import 'package:jbus_app/screens/wallet/send_money/widgets/text_fields/amount_of_money.dart';

class YesButtonForCharging extends StatelessWidget {
  const YesButtonForCharging({
    super.key,
    required this.onPressed,
  });

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () async {
        try {
          await onPressed.call();

          if (context.mounted) {
            Navigator.of(context).pop();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SuccessMoneyChargedScreen(),
              ),
            );
          }

          AmmountOfChargeMoneyTextField.amountOfChargeMoneyController.text = '';
        } catch (e) {
          print("error");
        }
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
