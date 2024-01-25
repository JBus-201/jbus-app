import 'package:flutter/material.dart';
import 'package:jbus_app/screens/authentication/signup/signup.dart';
import 'package:jbus_app/screens/settings/settings/settings.dart';
import 'package:jbus_app/widgets/containers/our_tab.dart';
import 'package:jbus_app/widgets/text/our_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OthersRow extends StatelessWidget {
  const OthersRow({
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
              AppLocalizations.of(context)!.others,
              fontWeight: FontWeight.w700,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OurTab(
                text: AppLocalizations.of(context)!.history,
                image: 'assets/images/history.png',
                scale: 9,
                topPadding: 14,
                onTap: () {},
              ),
              OurTab(
                text: AppLocalizations.of(context)!.settings,
                image: 'assets/images/settings.png',
                scale: 9,
                topPadding: 14,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SettingsScreen(),
                    ),
                  );
                },
              ),
              OurTab(
                text: AppLocalizations.of(context)!.logOut,
                image: 'assets/images/logout.png',
                scale: 8,
                topPadding: 14,
                leftPadding: 15,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignupScreen(),
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
