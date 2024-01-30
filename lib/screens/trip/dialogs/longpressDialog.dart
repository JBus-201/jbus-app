import 'package:flutter/material.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/widgets/buttons/favorite.dart';
import 'package:jbus_app/widgets/buttons/rectangular_elevated_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LongPressDialog extends StatelessWidget {
  final dynamic Function()? onPickup;
  final dynamic Function()? onDropoff;


  const LongPressDialog({
    super.key,
    required this.onPickup,
    required this.onDropoff,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            FavoriteButton(routeId: routeId, location: location)
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RectangularElevatedButton(
                  width: 110,
                  onPressed: onPickup,
                  text: AppLocalizations.of(context)!.selectPick,
                ),
                TextButton(
                  onPressed: onDropoff,
                  child: Text(AppLocalizations.of(context)!.selectDrop),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
