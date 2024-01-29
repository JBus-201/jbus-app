import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/general_blocs/name_bloc/bloc/name_bloc.dart';
import 'package:jbus_app/screens/profile/edit_profile/edit_profile.dart';
import 'package:jbus_app/screens/profile/set_profile_photo/bloc/set_profile_photo_bloc.dart';
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
    return BlocBuilder<NameBloc, NameState>(
      builder: (context, state) {
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
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BlocBuilder<SetProfilePhotoBloc, SetProfilePhotoState>(
                        builder: (context, state) {
                          return ProfilePhoto(
                            file: File(''),
                            image: state.photoUrl,
                            borderRadius: 60,
                            photoRadius: 100,
                            borderColor: ourWhite,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const EditProfileScreen(),
                                ),
                              );
                            },
                          );
                        },
                      ),
                      OurText(
                        '${state.firstName} ${state.lastName}',
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
                        fontFamily: 'PTSerif',
                      ),
                      OurText(
                        AppLocalizations.of(context)!.jod,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: ourWhite,
                        fontFamily: 'PTSerif',
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
      },
    );
  }
}
