import 'package:flutter/material.dart';
import 'package:jbus_app/screens/dashbourd/dashbourd.dart';
import 'package:jbus_app/screens/favorite/favorite_screen.dart';
import 'package:jbus_app/screens/view_routes/select-route.dart';
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
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.0118,
          bottom: MediaQuery.of(context).size.height * 0.0118,
          right: MediaQuery.of(context).size.height * 0.0188,
          left: MediaQuery.of(context).size.height * 0.0188),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                EdgeInsets.all(MediaQuery.of(context).size.height * 0.0047),
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
                scale: MediaQuery.of(context).size.height * 0.01115023,
                topPadding: MediaQuery.of(context).size.height * 0.0141,
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
                scale: MediaQuery.of(context).size.height * 0.01056338,
                topPadding: MediaQuery.of(context).size.height * 0.0176,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SelectRoutePage()));
                },
              ),
              OurTab(
                text: AppLocalizations.of(context)!.favorites,
                image: 'assets/images/favorites.png',
                scale: MediaQuery.of(context).size.height * 0.01877934,
                topPadding: MediaQuery.of(context).size.height * 0.0223,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FavoriteScreen(),
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
