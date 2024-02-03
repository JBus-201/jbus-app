import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/themes/bloc/theme_bloc.dart';

class CustomDrawerButton extends StatelessWidget {
  final Function()? onTap;
  const CustomDrawerButton({required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, themeState) {
      return Container(
        decoration: const BoxDecoration(shape: BoxShape.circle),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(
              side: BorderSide(
                  color: themeState.thememode == ThemeMode.light?ourNavey:ourWhite, width: 1.7), // Add the border here
            ),
            foregroundColor:
                themeState.thememode == ThemeMode.light ? ourWhite : ourOrange,
            backgroundColor: themeState.thememode == ThemeMode.light
                ? ourWhite
                : ourDarkThemeBackgroundNavey,
            elevation: 0,
          ),
          onPressed: onTap,
          child: Icon(
            Icons.home_rounded,
            color: themeState.thememode == ThemeMode.light?ourNavey:ourWhite,
          ),
        ),
      );
    });
  }
}
