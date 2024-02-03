import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/themes/bloc/theme_bloc.dart';
import 'package:jbus_app/widgets/buttons/favorite.dart';
import 'package:jbus_app/widgets/buttons/rectangular_elevated_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LongPressDialog extends StatelessWidget {
  final dynamic Function()? onPickup;
  final dynamic Function()? onDropoff;
  final int routeId;
  final LatLng location;

  const LongPressDialog({
    super.key,
    required this.onPickup,
    required this.onDropoff,
    required this.routeId,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, themeState) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 5,
        backgroundColor: themeState.thememode == ThemeMode.light ? ourWhite : ourDarkGray,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              FavoriteButton(
                  routeId: routeId, location: location, isFavorite: false),
              const SizedBox(height: 16),
              RectangularElevatedButton(
                width: 150,
                fontSize: 15,
                fontWeight: FontWeight.w300,
                onPressed: onPickup,
                text: AppLocalizations.of(context)!.selectPick,
              ),
              RectangularElevatedButton(
                  width: 150,
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                  onPressed: onDropoff,
                  text: AppLocalizations.of(context)!.selectDrop),
            ],
          ),
        ),
      );
    });
  }
}
