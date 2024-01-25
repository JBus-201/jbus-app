import 'package:flutter/material.dart';
import 'package:jbus_app/screens/dashbourd/dashbourd.dart';
import 'package:jbus_app/widgets/containers/our_tab.dart';
import 'package:jbus_app/widgets/text/our_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StartYourTripRow extends StatelessWidget {
  const StartYourTripRow({
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
              AppLocalizations.of(context)!.startYourTrip,
              fontWeight: FontWeight.w700,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OurTab(
                text: AppLocalizations.of(context)!.ride,
                image: 'assets/images/bus.png',
                scale: 9.5,
                topPadding: 12,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Dashboard(),
                    ),
                  );
                },
              ),
              OurTab(
                text: AppLocalizations.of(context)!.routes,
                image: 'assets/images/routes.png',
                scale: 8,
                topPadding: 15,
                onTap: () {},
              ),
              OurTab(
                text: AppLocalizations.of(context)!.favorite,
                image: 'assets/images/favorite.png',
                scale: 17,
                topPadding: 19,
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}