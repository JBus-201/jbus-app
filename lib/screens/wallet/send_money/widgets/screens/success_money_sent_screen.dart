import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/screens/settings/settings/settings.dart';
import 'package:jbus_app/screens/wallet/send_money/send_money.dart';
import 'package:jbus_app/screens/wallet/wallet/wallet.dart';
import 'package:jbus_app/widgets/buttons/rectangular_elevated_button.dart';

class SuccessMoneySentScreen extends StatelessWidget {
  const SuccessMoneySentScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Icon(
              Icons.done,
              color: ourNavey,
              size: MediaQuery.of(context).size.height * 0.1455399,
            ),
             SizedBox(
              height: MediaQuery.of(context).size.height * 0.07042254,
            ),
            Text(
              AppLocalizations.of(context)!.moneyHasBeenSentSuccessfully,
              textAlign: TextAlign.center,
              style: const TextStyle(color: ourNavey),
            ),
             SizedBox(
              height: MediaQuery.of(context).size.height * 0.018779,
            ),
            RectangularElevatedButton(
              text: AppLocalizations.of(context)!.goBack,
              height: MediaQuery.of(context).size.height * 0.004694,
              fontSize: MediaQuery.of(context).size.height * 0.018779,
              fontWeight: FontWeight.w600,
              width: MediaQuery.of(context).size.height * 0.140845,
              onPressed: () {
                Navigator.pop(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SendMoneyScreen(),
                  ),
                );

                Navigator.pop(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WalletScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
