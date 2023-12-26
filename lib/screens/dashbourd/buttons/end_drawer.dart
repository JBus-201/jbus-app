import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/themes/bloc/theme_bloc.dart';

class endDrawerButton extends StatelessWidget {
  final Function()? onTap;
  const endDrawerButton({required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, themeState) {
      return Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
            //   boxShadow: [
            //   BoxShadow(
            //     offset: const Offset(0, 2),
            //     color:themeState.thememode == ThemeMode.light ? ourDarkGray50.withOpacity(0.1) : ourWhite.withOpacity(0.1),
            //     blurRadius: 2,
            //   )
            // ], 
            shape: BoxShape.circle),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(
                  side: BorderSide(
                      color: Colors.black.withOpacity(0),
                      width: 0.5), // Add the border here
                ),
                foregroundColor: themeState.thememode == ThemeMode.light ? ourBlack : ourOrange,
                backgroundColor: themeState.thememode == ThemeMode.light ? ourWhite : ourDarkThemeBackgroundNavey,
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
              color: themeState.thememode == ThemeMode.light ? ourBlack : ourOrange,
            ),
          )
        ],
      );
    });
  }
}
