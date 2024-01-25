import 'package:flutter/material.dart';
import 'package:jbus_app/screens/faza/widgets/main_faza.dart';
import 'package:jbus_app/screens/wallet/wallet/wallet.dart';
import 'package:jbus_app/widgets/containers/our_tab.dart';
import 'package:jbus_app/widgets/text/our_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MoneyRow extends StatelessWidget {
  const MoneyRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: OurText(
              AppLocalizations.of(context)!.money,
              fontWeight: FontWeight.w700,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OurTab(
                text: AppLocalizations.of(context)!.wallet,
                image: 'assets/images/wallet.png',
                scale: 9,
                topPadding: 10,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WalletScreen(),
                    ),
                  );
                },
              ),
              OurTab(
                text: AppLocalizations.of(context)!.points,
                image: 'assets/images/coins.png',
                scale: 20,
                topPadding: 10,
                onTap: () {},
              ),
              OurTab(
                text: AppLocalizations.of(context)!.fazaa,
                image: 'assets/images/fazaa.png',
                scale: 11,
                topPadding: 16,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FazaMainPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
