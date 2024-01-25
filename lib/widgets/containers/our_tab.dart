import 'package:flutter/material.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/main.dart';
import 'package:jbus_app/widgets/text/our_text.dart';

class OurTab extends StatelessWidget {
  const OurTab({
    super.key,
    this.firstColor = ourVeryLightGray,
    this.secondColor = ourVeryLightGray,
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
  final double? scale;
  final double topPadding;
  final double leftPadding;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        height: 116,
        width: 116,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              firstColor,
              secondColor,
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
                  color: ourNavey,
                ),
              ),
            ]),
      ),
    );
  }
}
