import 'package:flutter/material.dart';
import 'package:jbus_app/screens/authentication/signin/signin.dart';
import 'package:jbus_app/screens/settings/language_settings/language_settings.dart';
import 'package:jbus_app/screens/settings/notification_settings/notification_settings.dart';
import 'package:jbus_app/screens/settings/settings/widgets/settings_tab.dart';
import 'package:jbus_app/screens/settings/theme_settings/theme_settings.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jbus_app/services/auth_service.dart';
import 'package:jbus_app/services/service_locator.dart';
import 'package:jbus_app/widgets/others/app_bar_title_logo.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const JbusAppBarTitle(),
      ),
      body: Center(
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.language_outlined),
              title: Text(AppLocalizations.of(context)!.language),
              subtitle: Text(AppLocalizations.of(context)!.english),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LanguageSettingsScreen(),
                  ),
                );
                
              },
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
            ),
            ListTile(
              leading:  const Icon(Icons.color_lens_outlined),
              title: Text(AppLocalizations.of(context)!.apperance),
              subtitle: Text(AppLocalizations.of(context)!.lightTheme),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ThemeSettingsScreen(),
                  ),
                );
              },
              trailing: const Icon(Icons.arrow_forward_ios_rounded),

            ),
            ListTile(
              leading: const Icon(Icons.notifications_on_outlined),
              title: Text(AppLocalizations.of(context)!.notifications),
              subtitle: Text(AppLocalizations.of(context)!.turnedOff),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NotificationSettingsScreen(),
                  ),
                );
              },
              trailing: const Icon(Icons.arrow_forward_ios_rounded),

            ),
            ListTile(
              leading:  const Icon(Icons.exit_to_app),
              title: Text(AppLocalizations.of(context)!.logOut),
              subtitle: Text(AppLocalizations.of(context)!.logOut),
              onTap: () {
                sl<AuthService>().setLoggedOut();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignInScreen(),
                  ),
                  (route) => false,
                );
              },
              trailing: const Icon(Icons.arrow_forward_ios_rounded),

            ),
          ],
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:jbus_app/screens/settings/language_settings/language_settings.dart';
// import 'package:jbus_app/widgets/buttons/circular_elevated_button.dart';
// import 'package:jbus_app/widgets/buttons/rectangular_elevated_button.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// class SettingsScreen extends StatelessWidget {
//   const SettingsScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(AppLocalizations.of(context)!.settings),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             RectangularElevatedButton(
//               text: '',
//               //AppLocalizations.of(context)!.language,
//               width: 50,
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => const LanguageSettingsScreen()),
//                 );
//               },
//             ),
//             RectangularElevatedButton(
//               text: '',
//               //AppLocalizations.of(context)!.language,
//               width: 100,
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => const LanguageSettingsScreen()),
//                 );
//               },
//             ),

//             CircularElevatedButton(
//               icon: Icons.apple,
//               //AppLocalizations.of(context)!.language,
//               //width: 150,
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => const LanguageSettingsScreen()),
//                 );
//               },
//             ),
//             RectangularElevatedButton(
//               text: '',
//               //AppLocalizations.of(context)!.language,
//               width: 200,
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => const LanguageSettingsScreen()),
//                 );
//               },
//             ),
//             RectangularElevatedButton(
//               text: '',
//               //AppLocalizations.of(context)!.language,
//               width: 250,
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => const LanguageSettingsScreen()),
//                 );
//               },
//             ),
//             RectangularElevatedButton(
//               text: '',
//               //AppLocalizations.of(context)!.language,
//               width: 300,
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => const LanguageSettingsScreen()),
//                 );
//               },
//             ),
//             // ElevatedButton(
//             //     child: Text(
//             //       AppLocalizations.of(context)!.settings,
//             //     ),
//             //     onPressed: () {
//             //       Navigator.push(
//             //         context,
//             //         MaterialPageRoute(
//             //             builder: (context) => const ThemeSettingsScreen()),
//             //       );
//             //     }),
//           ],
//         ),
//       ),
//     );
//   }
// }
