import 'package:flutter/material.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/constants/colors/gradients.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jbus_app/screens/wallet/charge_wallet/charge_wallet.dart';
import 'package:jbus_app/screens/wallet/scratch_wallet/charge_wallet.dart';
import 'package:jbus_app/widgets/buttons/rectangular_elevated_button.dart';

class ChargeWalletButton extends StatelessWidget {
  const ChargeWalletButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(

      padding: const EdgeInsets.only(
        left: 5,
        right: 5,
        bottom: 12,
        top: 24,

      ),
      child: RectangularElevatedButton(
        width: double.infinity,
        text: AppLocalizations.of(context)!.chargeWallet,
        // icon: Icons.attach_money_rounded,
        gradient: grayButtonGradient,
        gradientForDark: grayButtonGradient,
        fontColor: ourNavey,
        darkfontColor: ourNavey,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ChargeWalletScreen()));
        },
      ),
    );
  }
}
