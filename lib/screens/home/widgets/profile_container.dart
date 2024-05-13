import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/data/api/api_service.dart';
import 'package:jbus_app/data/models/passenger.dart';
import 'package:jbus_app/general_blocs/name_bloc/bloc/name_bloc.dart';
import 'package:jbus_app/screens/profile/edit_profile/edit_profile.dart';
import 'package:jbus_app/screens/profile/set_profile_photo/bloc/set_profile_photo_bloc.dart';
import 'package:jbus_app/services/service_locator.dart';
import 'package:jbus_app/widgets/containers/profile_photo.dart';
import 'package:jbus_app/widgets/text/our_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileContainer extends StatefulWidget {
  const ProfileContainer({
    super.key,
  });

  @override
  State<ProfileContainer> createState() => _ProfileContainerState();
}

class _ProfileContainerState extends State<ProfileContainer> {
  //  String name;
  late bool isLoading = false;

  @override
  void initState() {
    super.initState();
    // fetchName();
  }

  // Future<void> fetchName() async {
  //   // final userRes = sl<SharedPreferences>().getString('user');
  //   // Map<String, dynamic> res = json.decode(userRes!);
  //   print(res);
  //   setState(() {
  //     name = res['user']['name'];
  //   });
  // }

  Future<void> refreshData() async {
    setState(() {
      isLoading = true;
    });

    try {
      // final passenger = await sl<ApiService>().getPasssenger();
      // Update state with new passenger data
      // You can also update other parts of the UI here if needed
      setState(() {
        isLoading = false;
      });
    } catch (error) {
      print('Error refreshing data: $error');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NameBloc, NameState>(builder: (context, state) {
      return FutureBuilder<Passenger>(
        future: sl<ApiService>().getPasssenger(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(
              color: ourOrange.withOpacity(0),
            ));
          } else {
            Passenger user = snapshot.data!;
            return Container(
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

                          BlocBuilder<SetProfilePhotoBloc,
                              SetProfilePhotoState>(
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

                            user.user.name ?? "N/A",
                            fontWeight: FontWeight.w600,

                            color: ourWhite,
                          ),
                          OurText(

                            'ID: ${user.id}' ?? "N/A",
                            fontWeight: FontWeight.w600,

                            color: ourWhite,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              OurText(
                                '${user.wallet / 100} ',
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              OurText(
                                '${user.rewardPoints} ',
                                fontWeight: FontWeight.w700,
                                fontSize: 30,
                                color: ourWhite,
                                fontFamily: 'PTSerif',
                              ),
                              OurText(
                                AppLocalizations.of(context)!.points,
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                                color: ourWhite,
                                fontFamily: 'PTSerif',
                              )
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () => refreshData(),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: ourNavey.withOpacity(0),
                                elevation: 0),
                            child: const Icon(
                              Icons.refresh,
                              color: ourWhite,
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                   SizedBox(
                    height: MediaQuery.of(context).size.height * 0.0352,
                  ),
                ],
              ),

            );
          }
        },
      );
    });

  }
}
