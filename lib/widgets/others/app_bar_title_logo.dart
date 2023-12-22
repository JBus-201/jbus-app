import 'package:flutter/material.dart';
import 'package:jbus_app/themes/light_theme.dart';

class AppBarTitleLogo extends StatelessWidget {
  const AppBarTitleLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Image.asset(
          'assets/logos/splash.png',
          scale: 13,
        ),
      ],
    ));
  }
}
