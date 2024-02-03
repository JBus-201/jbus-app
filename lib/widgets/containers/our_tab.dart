import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/themes/bloc/theme_bloc.dart';
import 'package:jbus_app/widgets/text/our_text.dart';

class OurTab extends StatelessWidget {
  const OurTab({
    super.key,
    this.firstColor = ourVeryLightGray,
    this.secondColor = ourVeryLightGray,
    this.darkFirstColor = ourGray,
    this.darkSecondColor = ourGray,
    required this.text,
    required this.image,
    this.scale,
    this.topPadding = 8,
    this.leftPadding = 0,
    this.onTap,
  });

  final String text;
  final String image;
  final Color firstColor;
  final Color secondColor;
  final Color darkFirstColor;
  final Color darkSecondColor;
  final double? scale;
  final double topPadding;
  final double leftPadding;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, themeState){return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.14,
        //116,
        width: MediaQuery.of(context).size.width * 0.29,
        //116,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              themeState.thememode == ThemeMode.light?firstColor:darkFirstColor,
              themeState.thememode == ThemeMode.light?secondColor:darkSecondColor,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          // image: DecorationImage(
          //   image: AssetImage(
          //     image,
          //   ),
          //   fit: BoxFit.fill,
          // ),
          borderRadius: BorderRadius.circular(18),
        ),
        //child: Image.asset(image),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(top: topPadding, left: leftPadding),
                child: Image.asset(
                  image,
                  scale: scale,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4),
                child: OurText(
                  text,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  darkColor: ourWhite,
                ),
              ),
            ]),
      ),
    );});
  }
}
