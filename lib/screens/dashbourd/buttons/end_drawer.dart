import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/themes/bloc/theme_bloc.dart';

class CustomEndDrawerButton extends StatelessWidget {
  final Function()? onTap;
  const CustomEndDrawerButton({required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, themeState) {
      return Container(
        padding:  EdgeInsets.only(left: MediaQuery.of(context).size.height * 0.017605),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              
              decoration: const BoxDecoration(
                  shape: BoxShape.circle),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape:  CircleBorder(
                    side: BorderSide(
                        color: ourNavey, width: MediaQuery.of(context).size.height * 0.00199), // Add the border here
                  ),
                  foregroundColor: themeState.thememode == ThemeMode.light
                      ? ourBlack
                      : ourOrange,
                  backgroundColor: themeState.thememode == ThemeMode.light
                      ? ourWhite
                      : ourDarkThemeBackgroundNavey,
                  elevation: 0,
                ),
                onPressed: onTap,
                child: null,
              ),
            ),
            GestureDetector(
              onTap: onTap,
              child: Icon(
                Icons.notifications,
                color: themeState.thememode == ThemeMode.light
                    ? ourNavey
                    : ourOrange,
              ),
            )
          ],
        ),
      );
    });
  }
}
