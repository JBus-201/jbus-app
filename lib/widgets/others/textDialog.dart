import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/data/api/api_service.dart';
import 'package:jbus_app/data/models/favorite_point_create_request.dart';
import 'package:jbus_app/services/service_locator.dart';
import 'package:jbus_app/widgets/buttons/rectangular_elevated_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jbus_app/widgets/text_fields/text_form_field.dart';
import 'package:jbus_app/widgets/warnings/warning.dart';

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
    final TextEditingController favNameController = TextEditingController();
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      backgroundColor: Colors.white,
      child: Padding(
        padding:  EdgeInsets.all(MediaQuery.of(context).size.height * 0.02347418),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
             Icon(
              Icons.location_on,
              size: MediaQuery.of(context).size.height * 0.05633803,
              color: ourOrange,
            ),
             SizedBox(height: MediaQuery.of(context).size.height * 0.01877934),
            Text(
              AppLocalizations.of(context)!.favoriteStops,
              style:  TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.02112676,
                fontWeight: FontWeight.bold,
              ),
            ),
             SizedBox(height: MediaQuery.of(context).size.height * 0.01877934),
            Form(
              key: formKey,
              child: OurTextFormField(
                  topPadding: MediaQuery.of(context).size.height * 0.02934272,
                  leftPadding: MediaQuery.of(context).size.height * 0.00586854,
                  rightPadding: MediaQuery.of(context).size.height * 0.00586854,
                  bottomPadding: MediaQuery.of(context).size.height * 0.02934272,
                  showCursor: true,
                  textAlign: TextAlign.center,
                  icon: Icons.location_on,
                  label: AppLocalizations.of(context)!.enterPointName,
                  // ignore: body_might_complete_normally_nullable
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return null;
                    }
                    final bool numberValid =
                        RegExp(r'^[a-z]*$').hasMatch(value.trim());

                    if (numberValid) {
                      return null;
                    } else {}
                  },
                  autocorrect: false,
                  enableSuggestions: false,
                  keyboardType: TextInputType.name,
                  maxLength: 20,
                  controller: favNameController),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RectangularElevatedButton(
                  width: MediaQuery.of(context).size.height * 0.11737089,
                  fontSize: MediaQuery.of(context).size.height * 0.01760563,
                  fontWeight: FontWeight.w300,
                  onPressed: () {
                    final newFav = FavoritePointCreateRequest(
                        name: favNameController.text,
                        lat: location.latitude,
                        long: location.longitude,
                        routeId: routeId);
                    sl<ApiService>()
                        .addFavoritePoint(newFav)
                        .then((value) => {
                              Navigator.pop(context),
                            })
                        // ignore: argument_type_not_assignable_to_error_handler, body_might_complete_normally_catch_error
                        .catchError(() {
                      showDialog(
                          context: context,
                          builder: (context) => Warning(
                              title: AppLocalizations.of(context)!.ops,
                              description:
                                  AppLocalizations.of(context)!.somthingWrong));
                    });
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
                    sl<ApiService>().addFavoritePoint(newFav).then((value) => {
                              Navigator.pop(context),
                            })
                        // ignore: argument_type_not_assignable_to_error_handler, body_might_complete_normally_catch_error
                        .catchError(() {
                      showDialog(
                          context: context,
                          builder: (context) => Warning(
                              title: AppLocalizations.of(context)!.ops,
                              description:
                                  AppLocalizations.of(context)!.somthingWrong));
                    });
                  },
                  child: Text(AppLocalizations.of(context)!.skip),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
