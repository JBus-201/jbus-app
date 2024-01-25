import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/screens/profile/edit_profile/edit_profile.dart';
import 'package:jbus_app/widgets/containers/profile_photo.dart';
import 'package:jbus_app/widgets/text/our_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileContainer extends StatelessWidget {
  const ProfileContainer({
    super.key,
    required this.walletBalance,
  });

  final double walletBalance;

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: ourNavey,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            ourNavey,
            ourNavey.withOpacity(0.85),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ProfilePhoto(
                    file: File(''),
                    image:
                        'assets/images/profile_photos/boys_avatars/green_boy_four.png',
                    borderRadius: 50,
                    photoRadius: 48,
                    borderColor: ourWhite,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EditProfileScreen(),
                        ),
                      );
                    },
                  ),
                  const OurText(
                    'Ahmad King',
                    //'${AppLocalizations.of(context)!.firstName} ${AppLocalizations.of(context)!.lastName}',
                    fontWeight: FontWeight.w600,
                    color: ourWhite,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  OurText(
                    '$walletBalance ',
                    fontWeight: FontWeight.w800,
                    fontSize: 60,
                    color: ourWhite,
                  ),
                  OurText(
                    AppLocalizations.of(context)!.jod,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: ourWhite,
                  )
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
