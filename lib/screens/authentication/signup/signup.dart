import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jbus_app/generated/l10n.dart';
import 'package:jbus_app/themes/bloc/theme_switcher_bloc.dart';
import 'package:jbus_app/themes/theme_model.dart';
import 'package:provider/provider.dart';


class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Provider.of<ThemeModel>(context, listen: false).toggleThemeMode();
          },
          child: Text('change Theme'),
        ),
      ),
    );
  }
}

