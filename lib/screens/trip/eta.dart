import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/data/api/google_service.dart';
import 'package:jbus_app/themes/bloc/theme_bloc.dart';
import 'package:jbus_app/widgets/buttons/rectangular_elevated_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ETAViewDialog extends StatelessWidget {
  final dynamic Function()? onPress;
  final LatLng first;
  final LatLng second;
  const ETAViewDialog({
    super.key,
    required this.onPress,
    required this.first,
    required this.second,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, themeState) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        child: Padding(
          padding:  EdgeInsets.all(MediaQuery.of(context).size.height * 0.02347418),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
               Icon(
                Icons.directions_bus_rounded,
                size: MediaQuery.of(context).size.height * 0.05633803,
                color: ourOrange,
              ),
               SizedBox(height: MediaQuery.of(context).size.height * 0.018779),
              FutureBuilder<Duration>(
                  future: GoogleMapsApi().calculateDrivingEta(first, second),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      print('Error: ${snapshot.error}');
                      return const Center(
                          child: Text(
                        'No data',
                        textAlign: TextAlign.center,
                      ));
                    } else {
                      return Text(snapshot.data!.toString(),
                          style:  TextStyle(
                            fontSize: MediaQuery.of(context).size.height * 0.02112676,
                            fontWeight: FontWeight.bold,
                          ));
                    }
                  }),
               SizedBox(height: MediaQuery.of(context).size.height * 0.01877934),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RectangularElevatedButton(
                    width: MediaQuery.of(context).size.height * 0.17605634,
                    onPressed: onPress,
                    text: AppLocalizations.of(context)!.selectBus,
                  ),

                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
