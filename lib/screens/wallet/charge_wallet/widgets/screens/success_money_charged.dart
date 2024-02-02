import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/screens/wallet/charge_wallet/charge_wallet.dart';
import 'package:jbus_app/screens/wallet/wallet/wallet.dart';
import 'package:jbus_app/widgets/buttons/rectangular_elevated_button.dart';

class SuccessMoneyChargedScreen extends StatelessWidget {
  const SuccessMoneyChargedScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.done,
              color: ourNavey,
              size: 124,
            ),
            const SizedBox(
              height: 60,
            ),
            Text(
              AppLocalizations.of(context)!.walletHasBeenChargedSuccessfully,
              textAlign: TextAlign.center,
              style: const TextStyle(color: ourNavey),
            ),
            const SizedBox(
              height: 16,
            ),
            RectangularElevatedButton(
              text: AppLocalizations.of(context)!.goBack,
              height: 4,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              width: 120,
              onPressed: () {
                Navigator.pop(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChargeWalletScreen(),
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
