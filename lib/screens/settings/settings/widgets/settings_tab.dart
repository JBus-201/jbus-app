import 'package:flutter/material.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/widgets/text/our_text.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({
    super.key,
    required this.icon,
    required this.onTap,
    required this.title,
    required this.subTitle,
  });

  final IconData icon;
  final void Function()? onTap;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  size: 30,
                  color: ourNavey,
                  //weight: 100,
                  //fill: 0.9,
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OurText(
                      title,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    OurText(
                      subTitle,
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: ourDarkBlue,
                    ),
                  ],
                ),
              ],
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              color: ourNavey,
            ),
          ],
        ),
      ),
    );
  }
}
