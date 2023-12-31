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
                  color: Colors.black.withOpacity(0),
                  width: 0.5), // Add the border here
            ),
            foregroundColor:
                themeState.thememode == ThemeMode.light ? ourWhite : ourOrange,
            backgroundColor: themeState.thememode == ThemeMode.light
                ? ourBlack
                : ourDarkThemeBackgroundNavey,
            elevation: 0,
          ),
          onPressed: onTap,
          child: const Icon(
            Icons.menu_rounded,
          ),
        ),
      );
    });
  }
}
