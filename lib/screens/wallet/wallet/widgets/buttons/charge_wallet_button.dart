import 'package:flutter/material.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/constants/colors/gradients.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jbus_app/screens/wallet/scratch_wallet/charge_wallet.dart';
import 'package:jbus_app/widgets/buttons/rectangular_elevated_button.dart';

class ScratchWalletButton extends StatelessWidget {
  const ScratchWalletButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(
        left: MediaQuery.of(context).size.height * 0.01877934,
        right: MediaQuery.of(context).size.height * 0.01877934,
        bottom: MediaQuery.of(context).size.height * 0.014845,
        top: MediaQuery.of(context).size.height * 0.028169,
      ),
      child: RectangularElevatedButton(
        text: AppLocalizations.of(context)!.chargeWallet,
        icon: Icons.attach_money_rounded,
        gradient: grayButtonGradient,
        fontColor: ourNavey,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ScratshCarkWallet()));
        },
      ),
    );
  }
}
