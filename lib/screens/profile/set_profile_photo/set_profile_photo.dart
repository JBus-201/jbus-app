import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/screens/dashbourd/dashbourd.dart';
import 'package:jbus_app/screens/profile/set_profile_photo/bloc/set_profile_photo_bloc.dart';
import 'package:jbus_app/widgets/buttons/rectangular_elevated_button.dart';
import 'package:jbus_app/widgets/buttons/text_button.dart';
import 'package:jbus_app/widgets/containers/profile_photo.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SetProfilePhotoScreen extends StatefulWidget {
  const SetProfilePhotoScreen({super.key});

  @override
  State<SetProfilePhotoScreen> createState() => _SetProfilePhotoScreenState();
}

class _SetProfilePhotoScreenState extends State<SetProfilePhotoScreen> {
  // There's a problem here...
  File file = File('');
  ImagePicker image = ImagePicker();
  bool hasBeenChoosenFromGallery = false;

  Future chooseImageFromGallary() async {
    XFile? image = await this.image.pickImage(source: ImageSource.gallery);

    if (image == null) return;

    setState(() {
      hasBeenChoosenFromGallery = true;
      file = File(image.path);
    });
  }

  //final setProfilePhotoBloc =
  // ignore: use_build_context_synchronously
  //   BlocProvider.of<Set
  //ProfilePhotoBloc>(context);
  //setProfilePhotoBloc.add(
  //PickPhotoFromGalleryEvent(
  //  file: File(imagee.path),
  //   ),
  // );
  //}

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SetProfilePhotoBloc(),
      child: BlocBuilder<SetProfilePhotoBloc, SetProfilePhotoState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                AppLocalizations.of(context)!.choosePhoto,
                style: const TextStyle(color: ourNavey),
              ),
            ),
            body: Center(
              child: Column(
                children: [
                  // Main photo
                  ProfilePhoto(
                    borderRadius: 100,
                    photoRadius: 96,
                    image: state.photoUrl,
                    hasBeenChoosenFromGallery: hasBeenChoosenFromGallery,
                    //file: state.file,
                    file: file,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ProfilePhoto(
                        hasBeenChoosenFromGallery: hasBeenChoosenFromGallery,
                        borderRadius: 50,
                        photoRadius: 48,
                        image: 'assets/images/galery.png',
                        onTap: () => chooseImageFromGallary(),
                        file: File('assets/images/galery.png'),
                      ),
                      ProfilePhoto(
                        file: File(''),
                        borderRadius: 50,
                        photoRadius: 48,
                        image:
                            'assets/images/profile_photos/boys_avatars/red_boy_four.png',
                        onTap: () {
                          
                          final setProfilePhotoBloc =
                              context.read<SetProfilePhotoBloc>();
                          setProfilePhotoBloc.add(
                            ChangeProfilePhotoEvent(
                              profilePhotoUrl:
                                  'assets/images/profile_photos/boys_avatars/red_boy_four.png',
                            ),
                          );
                        },
                      ),
                      ProfilePhoto(
                        file: File(''),
                        borderRadius: 50,
                        photoRadius: 48,
                        image:
                            'assets/images/profile_photos/boys_avatars/blue_boy_four.png',
                        onTap: () {
                          final setProfilePhotoBloc =
                              context.read<SetProfilePhotoBloc>();

                          setProfilePhotoBloc.add(
                            ChangeProfilePhotoEvent(
                              profilePhotoUrl:
                                  'assets/images/profile_photos/boys_avatars/blue_boy_four.png',
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ProfilePhoto(
                        file: File(''),
                        borderRadius: 50,
                        photoRadius: 48,
                        image:
                            'assets/images/profile_photos/boys_avatars/green_boy_four.png',
                        onTap: () {
                          final setProfilePhotoBloc =
                              context.read<SetProfilePhotoBloc>();

                          setProfilePhotoBloc.add(
                            ChangeProfilePhotoEvent(
                              profilePhotoUrl:
                                  'assets/images/profile_photos/boys_avatars/green_boy_four.png',
                            ),
                          );
                        },
                      ),
                      ProfilePhoto(
                        file: File(''),
                        borderRadius: 50,
                        photoRadius: 48,
                        image:
                            'assets/images/profile_photos/girls_avatars/blue_girl_four.png',
                        onTap: () {
                          final setProfilePhotoBloc =
                              context.read<SetProfilePhotoBloc>();

                          setProfilePhotoBloc.add(
                            ChangeProfilePhotoEvent(
                              profilePhotoUrl:
                                  'assets/images/profile_photos/girls_avatars/blue_girl_four.png',
                            ),
                          );
                        },
                      ),
                      ProfilePhoto(
                        file: File(''),
                        borderRadius: 50,
                        photoRadius: 48,
                        image:
                            'assets/images/profile_photos/girls_avatars/green_girl_four.png',
                        onTap: () {
                          final setProfilePhotoBloc =
                              context.read<SetProfilePhotoBloc>();

                          setProfilePhotoBloc.add(
                            ChangeProfilePhotoEvent(
                              profilePhotoUrl:
                                  'assets/images/profile_photos/girls_avatars/green_girl_four.png',
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ProfilePhoto(
                        file: File(''),
                        borderRadius: 50,
                        photoRadius: 48,
                        image:
                            'assets/images/profile_photos/girls_avatars/pink_girl_four.png',
                        onTap: () {
                          final setProfilePhotoBloc =
                              context.read<SetProfilePhotoBloc>();

                          setProfilePhotoBloc.add(
                            ChangeProfilePhotoEvent(
                              profilePhotoUrl:
                                  'assets/images/profile_photos/girls_avatars/pink_girl_four.png',
                            ),
                          );
                        },
                      ),
                      ProfilePhoto(
                        file: File(''),
                        borderRadius: 50,
                        photoRadius: 48,
                        image:
                            'assets/images/profile_photos/girls_avatars/yellow_girl_four.png',
                        onTap: () {
                          final setProfilePhotoBloc =
                              context.read<SetProfilePhotoBloc>();

                          setProfilePhotoBloc.add(
                            ChangeProfilePhotoEvent(
                              profilePhotoUrl:
                                  'assets/images/profile_photos/girls_avatars/yellow_girl_four.png',
                            ),
                          );
                        },
                      ),
                      ProfilePhoto(
                        file: File(''),
                        borderRadius: 50,
                        photoRadius: 48,
                        image: 'assets/images/camera.png',
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  RectangularElevatedButton(
                    text: AppLocalizations.of(context)!.save,
                    width: 336,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Dashbourd(),
                        ),
                      );
                    },
                  ),
                  OurTextButton(
                    text: AppLocalizations.of(context)!.skip,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Dashbourd(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
