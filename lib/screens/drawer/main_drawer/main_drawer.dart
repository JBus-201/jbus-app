import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/constants/colors/gradients.dart';
import 'package:jbus_app/data/api/api_service.dart';
import 'package:jbus_app/data/models/passenger.dart';
import 'package:jbus_app/screens/favorite/favorite_screen.dart';
import 'package:jbus_app/screens/faza/widgets/main_faza.dart';
import 'package:jbus_app/screens/profile/edit_profile/edit_profile.dart';
import 'package:jbus_app/screens/settings/settings/settings.dart';
import 'package:jbus_app/screens/view_routes/select-route.dart';
import 'package:jbus_app/screens/wallet/wallet/wallet.dart';
import 'package:jbus_app/services/service_locator.dart';
import 'package:jbus_app/themes/bloc/theme_bloc.dart';
import 'package:jbus_app/widgets/containers/profile_photo.dart';
import 'package:jbus_app/widgets/icons/our_icon.dart';
import 'package:jbus_app/widgets/text/our_text.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  void refreshAmount() {
    // Implement your logic to refresh the amount
    // Example: String amount = 'get amount logic';
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, themeState) {
      //File file = File('');
      return Drawer(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), bottomLeft: Radius.circular(40))),
        // width: double.infinity,
        backgroundColor: themeState.thememode == ThemeMode.light
            ? ourWhite
            : ourDarkThemeBackgroundNavey,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.293427,
              child: DrawerHeader(
                padding: const EdgeInsets.only(bottom: 1),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: themeState.thememode == ThemeMode.light
                      ? ourNavey
                      : ourOrange,
                  gradient: themeState.thememode == ThemeMode.light
                      ? naveyButtonGradient
                      : orangeButtonGradient,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                  ),
                ),
                child: Column(
                  children: [
                    ProfilePhoto(
                      file: File(''),
                      image:
                          'assets/images/profile_photos/boys_avatars/green_boy_four.png',
                      borderRadius: MediaQuery.of(context).size.height * 0.05868545,
                      photoRadius: MediaQuery.of(context).size.height * 0.05633803,
                      borderColor: ourWhite,
                    ),
                    Text(
                      '${AppLocalizations.of(context)!.firstName} ${AppLocalizations.of(context)!.lastName}',
                      style: const TextStyle(color: ourWhite),
                    ),
                    FutureBuilder<Passenger>(
                        future: sl<ApiService>().getPasssenger(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                                child: CircularProgressIndicator(
                              color: ourOrange.withOpacity(0),
                            ));
                          } else {
                            Passenger user = snapshot.data!;
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${user.wallet / 100} ',
                                  style: const TextStyle(
                                    color: ourWhite,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  AppLocalizations.of(context)!.jod,
                                  style: const TextStyle(
                                    color: ourWhite,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            );
                          }
                        }),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: const OurIcon(
                Icons.favorite_border_rounded,
              ),
              title: OurText(AppLocalizations.of(context)!.favoriteStops),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FavoriteScreen()));
              },
            ),
            ListTile(
              leading: const OurIcon(Icons.history),
              title: OurText(AppLocalizations.of(context)!.tripsHistory),
              onTap: () {},
            ),
            ListTile(
              leading: const OurIcon(Icons.map),
              title: OurText(AppLocalizations.of(context)!.routes),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SelectRoutePage()));
              },
            ),
            ListTile(
              leading: const OurIcon(Icons.wallet),
              title: OurText(AppLocalizations.of(context)!.wallet),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WalletScreen()));
              },
            ),
            // ListTile(
            //   leading: const OurIcon(Icons.currency_exchange_rounded),
            //   title: OurText(AppLocalizations.of(context)!.transfereBalance),
            //   onTap: () {},
            // ),
            ListTile(
              leading: const OurIcon(Icons.monetization_on_sharp),
              title: OurText(AppLocalizations.of(context)!.rewardPoints),
              onTap: () {},
            ),
            ListTile(
              leading: const OurIcon(Icons.account_circle),
              title: OurText(AppLocalizations.of(context)!.manageAccount),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EditProfileScreen()));
              },
            ),
            ListTile(
              leading: const OurIcon(Icons.report_rounded),
              title: OurText(AppLocalizations.of(context)!.fazaa),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FazaMainPage()));
              },
            ),
            ListTile(
              leading: const OurIcon(Icons.settings),
              title: OurText(AppLocalizations.of(context)!.settings),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsScreen()));
              },
            ),
            const Divider(),
            const Spacer(),
            // ListTile(
            //   title: OurText(AppLocalizations.of(context)!.logOut),
            //   leading: const OurIcon(Icons.exit_to_app),
            //   onTap: () => {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => const SignInScreen(),
            //       ),
            //     ),
            //   },
            // ),
          ],
        ),
      );
    });
  }
}
