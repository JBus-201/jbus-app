import 'package:flutter/material.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/screens/wallet/charge_wallet/widgets/screens/success_money_charged.dart';
import 'package:jbus_app/screens/wallet/charge_wallet/widgets/text_fields/amount_of_charge_money.dart';
import 'package:jbus_app/screens/wallet/send_money/widgets/screens/success_money_sent_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jbus_app/screens/wallet/send_money/widgets/text_fields/account_number.dart';
import 'package:jbus_app/screens/wallet/send_money/widgets/text_fields/amount_of_money.dart';
import 'package:jbus_app/widgets/warnings/warning.dart';

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
          showDialog(
              context: context,
              builder: (context) => Warning(
                  title: AppLocalizations.of(context)!.ops,
                  description: AppLocalizations.of(context)!.somthingWrong));
        }
      },
      style: OutlinedButton.styleFrom(
          fixedSize: Size(MediaQuery.of(context).size.height * 0.0140845,
              MediaQuery.of(context).size.height * 0.041079),
          side: const BorderSide(
            color: ourNavey,
          )),
      child: Text(
        AppLocalizations.of(context)!.yes,
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.height * 0.0211267,
          fontWeight: FontWeight.w500,
          color: ourNavey,
        ),
      ),
    );
  }
}
