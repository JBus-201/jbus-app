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
      padding:  EdgeInsets.all(MediaQuery.of(context).size.height * 0.01877934),
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  size: MediaQuery.of(context).size.height * 0.03521127,
                  color: ourNavey,
                  //weight: 100,
                  //fill: 0.9,
                ),
                 SizedBox(
                  width: MediaQuery.of(context).size.height * 0.02347418,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OurText(
                      title,
                      fontSize: MediaQuery.of(context).size.height * 0.02112676,
                      fontWeight: FontWeight.w500,
                    ),
                    OurText(
                      subTitle,
                      fontSize: MediaQuery.of(context).size.height * 0.01643192,
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
