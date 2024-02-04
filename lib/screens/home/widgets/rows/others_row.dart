import 'package:flutter/material.dart';
import 'package:jbus_app/screens/profile/edit_profile/edit_profile.dart';
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
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.0117,
          bottom: MediaQuery.of(context).size.height * 0.0117,
          right: MediaQuery.of(context).size.height * 0.0188,
          left: MediaQuery.of(context).size.height * 0.0188),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                EdgeInsets.all(MediaQuery.of(context).size.height * 0.0047),
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
                image: 'assets/images/calendar.png',
                scale: MediaQuery.of(context).size.height * 0.00997653,
                topPadding: MediaQuery.of(context).size.height * 0.0164,
                onTap: () {},
              ),
              OurTab(
                text: AppLocalizations.of(context)!.settings,
                image: 'assets/images/settings.png',
                scale: MediaQuery.of(context).size.height * 0.01079812,
                topPadding: MediaQuery.of(context).size.height * 0.0176,
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
                text: AppLocalizations.of(context)!.account,
                image: 'assets/images/profile_photos/boy_four.png',
                scale: MediaQuery.of(context).size.height * 0.02816901,
                topPadding: MediaQuery.of(context).size.height * 0.0141,
                //leftPadding: 1,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EditProfileScreen(),
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
