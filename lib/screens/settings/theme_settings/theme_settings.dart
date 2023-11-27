import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jbus_app/generated/l10n.dart';
import 'package:jbus_app/themes/bloc/theme_bloc.dart';

class ThemeSettingsScreen extends StatelessWidget {
  const ThemeSettingsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ThemeSettingsScreen'),
      ),
      body: Center(
          child:
              //Text('ThemeSettingsScreen'),

              //BlocBuilder<ThemeBloc, ThemeState>(
              // builder: (context, state) {
              // return

              Column(
        children: [
          ElevatedButton(
            child: Text(
              S.of(context).darkTheme,
            ),
            onPressed: () {
              final themeBloc = BlocProvider.of<ThemeBloc>(context);
              themeBloc.add(SwitchToDarkThemeEvent());
            },
          ),
          ElevatedButton(
            child: Text(
              S.of(context).lightTheme,
            ),
            onPressed: () {
              final themeBloc = BlocProvider.of<ThemeBloc>(context);
              themeBloc.add(SwitchToLightThemeEvent());
            },
          ),

          ElevatedButton(
            child: Text(
              S.of(context).systemTheme,
            ),
            onPressed: () {
              final themeBloc = BlocProvider.of<ThemeBloc>(context);
              themeBloc.add(SwitchToSystemThemeEvent());
            },
          ),

          //ThemeBloc().add(SwitchToDarkThemeEvent());
          //themeBloc.add(SwitchToDarkThemeEvent());
          //   // Navigator.push(
          //   //   context,
          //   //   MaterialPageRoute(
          //   //       builder: (context) => const LanguageSettingsScreen()),
          //   // );
          // }
        ],
      )

          // },
          //)
          ),
    );
  }
}
