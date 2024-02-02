import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jbus_app/general_blocs/email_bloc/bloc/email_bloc.dart';
import 'package:jbus_app/general_blocs/mobile_number_bloc/bloc/mobile_number_bloc.dart';
import 'package:jbus_app/general_blocs/name_bloc/bloc/name_bloc.dart';
import 'package:jbus_app/screens/profile/edit_profile/widgets/edit_profile_tab.dart';
import 'package:jbus_app/screens/profile/set_profile_photo/set_profile_photo.dart';
import 'package:jbus_app/screens/profile/update/update_email/update_email.dart';
import 'package:jbus_app/screens/profile/update/update_mobile_number/update_mobile_number.dart';
import 'package:jbus_app/screens/profile/update/update_name/update_name.dart';
import 'package:jbus_app/screens/profile/update/update_password/update_password.dart';
import 'package:jbus_app/widgets/others/app_bar_title_logo.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const JbusAppBarTitle(),),
      body: SafeArea(
        child: Center(
            child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            EditProfileTab(
              icon: Icons.person_pin_outlined,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SetProfilePhotoScreen()));
              },
              info: 'Change your personal photo',
            ),
            const Divider(
              color: ourLightGray,
              indent: 40,
            ),
            BlocBuilder<NameBloc, NameState>(
              builder: (context, state) {
                return EditProfileTab(
                    icon: Icons.person_outline_outlined,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UpdateNameScreen(),
                        ),
                      );
                    },
                    info: '${state.firstName} ${state.lastName}');
              },
            ),

            const Divider(
              color: ourLightGray,
              indent: 40,
            ),
            BlocBuilder<EmailBloc, EmailState>(
              builder: (context, state) {
                return EditProfileTab(
                    icon: Icons.email_outlined,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UpdateEmailScreen(),
                        ),
                      );
                    },
                    info: state.email);
              },
            ),

            const Divider(
              color: ourLightGray,
              indent: 40,
            ),
            BlocBuilder<MobileNumberBloc, MobileNumberState>(
              builder: (context, state) {
                return EditProfileTab(
                    icon: Icons.phone_iphone,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const UpdateMobileNumberScreen(),
                        ),
                      );
                    },
                    info: state.mobileNumber);
              },
            ),

            const Divider(
              color: ourLightGray,
              indent: 40,
            ),
            EditProfileTab(
              icon: Icons.lock_outline_rounded,
              onTap: () {
                const UpdatePasswordScreen();
              },
              info: AppLocalizations.of(context)!.changePassword,
            ),

            // icon: Icons.email_outlined,
            //       icon: Icons.person_outline_outlined,
            //        icon: Icons.phone_iphone,
            //  icon: Icons.lock_outline_rounded,
          ],
        )),
      ),
    );
  }
}
