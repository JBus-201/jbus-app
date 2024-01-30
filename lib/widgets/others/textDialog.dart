import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/data/api/api_service.dart';
import 'package:jbus_app/data/models/favorite_point_create_request.dart';
import 'package:jbus_app/services/service_locator.dart';
import 'package:jbus_app/widgets/buttons/rectangular_elevated_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jbus_app/widgets/text_fields/text_form_field.dart';

class TextDialog extends StatelessWidget {
  final int routeId;
  final LatLng location;
  const TextDialog({
    super.key,
    required this.routeId,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final TextEditingController friendIdController = TextEditingController();
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
            const Icon(
              Icons.location_on,
              size: 48,
              color: ourOrange,
            ),
            const SizedBox(height: 16),
            Text(
              AppLocalizations.of(context)!.favoriteStops,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Form(
              key: formKey,
              child: OurTextFormField(
                  topPadding: 50,
                  leftPadding: 70,
                  rightPadding: 70,
                  bottomPadding: 50,
                  showCursor: true,
                  textAlign: TextAlign.center,
                  icon: Icons.location_on,
                  label: AppLocalizations.of(context)!.enterPointName,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return null;
                    }
                    final bool numberValid =
                        RegExp('^[0-9]+\$').hasMatch(value.trim());

                    if (numberValid) {
                      return null;
                    } else {
                      return AppLocalizations.of(context)!
                          .sorryPleaseEnterAValidNumberStartsWith07;
                    }
                  },
                  autocorrect: false,
                  enableSuggestions: false,
                  keyboardType: const TextInputType.numberWithOptions(),
                  maxLength: 5,
                  controller: friendIdController),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RectangularElevatedButton(
                  width: 70,
                  onPressed: () {
                    final newFav = FavoritePointCreateRequest(
                        name: friendIdController.text,
                        lat: location.latitude,
                        long: location.longitude,
                        routeId: routeId);
                    sl<ApiService>().addFavoritePoint(newFav);
                  },
                  text: AppLocalizations.of(context)!.add,
                ),
                TextButton(
                  onPressed: () {
                    final newFav = FavoritePointCreateRequest(
                        name: "N/A",
                        lat: location.latitude,
                        long: location.longitude,
                        routeId: routeId);
                    sl<ApiService>().addFavoritePoint(newFav);
                  },
                  child: Text(AppLocalizations.of(context)!.cancel),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
