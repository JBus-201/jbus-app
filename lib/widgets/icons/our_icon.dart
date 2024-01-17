import 'package:flutter/material.dart';
import 'package:jbus_app/constants/colors/colors.dart';

class OurIcon extends StatelessWidget {
  const OurIcon(this.icon, {super.key, this.color = ourNavey});
  final IconData icon;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: color,
    );
  }
}
