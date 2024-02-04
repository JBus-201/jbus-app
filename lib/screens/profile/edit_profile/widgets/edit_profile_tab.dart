import 'package:flutter/material.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/widgets/text/our_text.dart';

class EditProfileTab extends StatelessWidget {
  const EditProfileTab({
    super.key,
    required this.icon,
    required this.onTap,
    required this.info,
  });

  final IconData icon;
  final void Function()? onTap;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.0094,
          right: MediaQuery.of(context).size.height * 0.0188,
          left: MediaQuery.of(context).size.height * 0.0188),
      child: InkWell(
        highlightColor: Colors.transparent,
        onTap: onTap,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      icon,
                      size: MediaQuery.of(context).size.height * 0.0352,
                      color: ourNavey,
                    ),
                     SizedBox(
                      width: MediaQuery.of(context).size.height * 0.0235,
                    ),
                    OurText(
                      info,
                      fontSize: MediaQuery.of(context).size.height * 0.02112676,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: ourNavey,
                ),
              ],
            ),
             SizedBox(
              height: MediaQuery.of(context).size.height * 0.0094,
            ),
          ],
        ),
      ),
    );
  }
}
