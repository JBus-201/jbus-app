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
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.0117,
          bottom: MediaQuery.of(context).size.height * 0.0117,
          right: MediaQuery.of(context).size.width * 0.0407,
          left: MediaQuery.of(context).size.width * 0.0407),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.0102),
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
                scale: MediaQuery.of(context).size.height * 0.0106,
                topPadding: MediaQuery.of(context).size.width * 0.0254,
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
                scale: MediaQuery.of(context).size.height * 0.0235,
                topPadding: MediaQuery.of(context).size.width * 0.0254,
                onTap: () {},
              ),
              OurTab(
                text: AppLocalizations.of(context)!.fazaa,
                image: 'assets/images/hands.png',
                scale: MediaQuery.of(context).size.height * 0.0258216,
                topPadding: 0,
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
