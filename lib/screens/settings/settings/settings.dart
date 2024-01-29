import 'package:flutter/material.dart';
import 'package:jbus_app/screens/settings/language_settings/language_settings.dart';
import 'package:jbus_app/screens/settings/notification_settings/notification_settings.dart';
import 'package:jbus_app/screens/settings/settings/widgets/settings_tab.dart';
import 'package:jbus_app/screens/settings/theme_settings/theme_settings.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
              leading: Icon(Icons.language_outlined),
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
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            SettingsTab(
              icon: Icons.color_lens_outlined,
              title: AppLocalizations.of(context)!.apperance,
              subTitle: AppLocalizations.of(context)!.lightTheme,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ThemeSettingsScreen(),
                  ),
                );
              },
            ),
            SettingsTab(
              icon: Icons.notifications_on_outlined,
              title: AppLocalizations.of(context)!.notifications,
              subTitle: AppLocalizations.of(context)!.turnedOff,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NotificationSettingsScreen(),
                  ),
                );
              },
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
