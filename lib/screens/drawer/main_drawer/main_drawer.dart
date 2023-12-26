import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/constants/colors/gradients.dart';
import 'package:jbus_app/themes/bloc/theme_bloc.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  void refreshAmount() {
    // Implement your logic to refresh the amount
    // Example: String amount = 'get amount logic';
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, themeState) {
      return Drawer(
      // width: double.infinity,
      backgroundColor: themeState.thememode == ThemeMode.light ? ourWhite : ourDarkThemeBackgroundNavey,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            padding: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: themeState.thememode == ThemeMode.light ? ourBlue : ourOrange,
              gradient: themeState.thememode == ThemeMode.light ? blueButtonGradient : orangeButtonGradient,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0),
              ),
            ),child: null,
          ),
          ListTile(
            leading: const Icon(Icons.favorite_border_rounded),
            title: Text("Favorite points"),
            onTap: () {
            },
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: Text("Trips History"),
            onTap: () {
            },
          ),
          ListTile(
            leading: const Icon(Icons.map),
            title: Text("Routs"),
            onTap: () {
            },
          ),
          ListTile(
            leading: const Icon(Icons.wallet),
            title: Text("Wallet"),
            onTap: () {
            },
          ),
          ListTile(
            leading: const Icon(Icons.currency_exchange_rounded),
            title: Text("Balance transfer"),
            onTap: () {
            },
          ),
          ListTile(
            leading: const Icon(Icons.monetization_on_sharp),
            title: Text("Rewadr points"),
            onTap: () {
            },
          ),
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: Text("Manage account"),
            onTap: () {
            },
          ),
          ListTile(
            leading: const Icon(Icons.report_rounded),
            title: Text("faza'a"),
            onTap: () {
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: Text("settings"),
            onTap: () {
            },
          ),
          const Divider(),
          const Spacer(),
          ListTile(
              title: Text("logout"),
              leading: const Icon(Icons.exit_to_app),
              onTap: () => {
                  }),
        ],
      ),
    );});
  }
}
