import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/screens/settings/settings/settings.dart';
import 'package:jbus_app/widgets/buttons/rectangular_elevated_button.dart';

class NotificationSettingsScreen extends StatelessWidget {
  const NotificationSettingsScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.notifications),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Icon(
              Icons.notification_important_sharp,
              color: ourNavey,
              size: MediaQuery.of(context).size.height * 0.14553991,
            ),
             SizedBox(
              height: MediaQuery.of(context).size.height * 0.07042254,
            ),
            Text(
              AppLocalizations.of(context)!.youDontHaveAnyNotifications,
              textAlign: TextAlign.center,
              style: const TextStyle(color: ourNavey),
            ),
             SizedBox(
              height: MediaQuery.of(context).size.height * 0.01877934,
            ),
            RectangularElevatedButton(
              text: AppLocalizations.of(context)!.goBack,
              height: MediaQuery.of(context).size.height * 0.00469484,
              fontSize: MediaQuery.of(context).size.height * 0.01877934,
              fontWeight: FontWeight.w600,
              width: MediaQuery.of(context).size.height * 0.14084507,
              onPressed: () {
                Navigator.pop(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsScreen(),
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
