import 'package:flutter/material.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jbus_app/screens/others/wallet/widgets/buttons/charge_wallet_button.dart';

class NaveyWalletContainer extends StatelessWidget {
  const NaveyWalletContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double walletBalance = 20;
    return Container(
      color: ourNavey,
      width: 500,
      child: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          Text(
            AppLocalizations.of(context)!.walletBalance,
            style: const TextStyle(color: ourWhite),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$walletBalance ',
                style: const TextStyle(fontSize: 50, color: Colors.white),
              ),
              Text(
                AppLocalizations.of(context)!.jod,
                style: const TextStyle(
                  fontSize: 36,
                  color: ourWhite,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const ChargeWalletButton(),
        ],
      ),
    );
  }
}
