import 'package:flutter/material.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/widgets/text/our_text.dart';

class EditProfileTab extends StatelessWidget {
  const EditProfileTab( {
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
      padding: const EdgeInsets.only(top: 8, right: 16, left: 16),
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
                      size: 30,
                      color: ourNavey,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    OurText(
                      info,
                      fontSize: 18,
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
            const SizedBox(
              height: 8,
            ),
            
          ],
        ),
      ),
    );
  }
}
