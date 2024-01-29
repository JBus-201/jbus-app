import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jbus_app/constants/colors/colors.dart';

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({
    super.key,
    this.borderColor = ourNavey,
    this.borderRadius,
    this.image = 'assets/images/profile_photos/defult_avatar.png',
    this.photoRadius = 50,
    this.onTap,
    this.isActualPhoto = false,
    this.hasBeenChoosenFromGallery = false,
    required this.file,
  });

  final Color borderColor;
  final double? borderRadius;
  final String image;
  final double photoRadius;
  final void Function()? onTap;
  final bool isActualPhoto;
  final bool hasBeenChoosenFromGallery;
  final File file;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: CircleAvatar(
          backgroundColor: ourOrange,
          radius: borderRadius,
          child: hasBeenChoosenFromGallery == true
              ? (file != File(''))
                  ? Image.file(file)
                  : //(isActualPhoto == true)
                  //? Image.asset(state.photoUrl)
                  Image.asset(image)
              : Image.asset(
                  image,
                  scale: 15,
                ),
        ),

        //  CircleAvatar(
        //   backgroundColor: ourWhite,
        //   // backgroundImage: hasBeenChoosenFromGallery == true
        //   //     ? Image.file(file) as ImageProvider
        //   //     : (isActualPhoto == true)
        //   //         ? AssetImage(state.photoUrl)
        //   //         : AssetImage(image) as ImageProvider,
        //   radius: photoRadius,
        // child:
        //),
        //),
      ),
    );
  }
}
