import 'package:flutter/material.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/constants/colors/gradients.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jbus_app/screens/wallet/send_money/send_money.dart';
import 'package:jbus_app/widgets/buttons/rectangular_elevated_button.dart';

class SendMonyButton extends StatelessWidget {
  const SendMonyButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(
        left: MediaQuery.of(context).size.height * 0.01877934,
        right: MediaQuery.of(context).size.height * 0.01877934,
        bottom: MediaQuery.of(context).size.height * 0.028169,
        top: 0,
      ),
      child: RectangularElevatedButton(
        icon: Icons.arrow_upward_rounded,
        text: AppLocalizations.of(context)!.sendMoney,
        gradient: grayButtonGradient,
        fontColor: ourNavey,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const SendMoneyScreen()));
         },
      ),
    );
  }
}
