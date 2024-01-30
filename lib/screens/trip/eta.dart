import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/data/api/google_service.dart';
import 'package:jbus_app/widgets/buttons/rectangular_elevated_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ETAViewDialog extends StatelessWidget {
  final dynamic Function()? onPress;
  final LatLng first;
  final LatLng second;
  const ETAViewDialog(
      {super.key,
      required this.onPress,
      required this.first,
      required this.second,
      });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Icon(
              Icons.directions_bus_rounded,
              size: 48,
              color: ourOrange,
            ),
            const SizedBox(height: 16),
            FutureBuilder<Duration>(future: GoogleMapsApi().calculateDrivingEta(first, second), builder: (context, snapshot){
                if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if(snapshot.hasError){
            print('Error: ${snapshot.error}');
            return const Center(
                child: Text(
              'No data',
              textAlign: TextAlign.center,
            ));
          }
          else{
            return Text(snapshot.data!.toString(),style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,));
          }
        
              }),
            
            const SizedBox(height: 16),
            Row(crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RectangularElevatedButton(
                  width: 150,
                  onPressed: onPress,
                  text:  AppLocalizations.of(context)!.selectBus,
                ),
                // TextButton(
                //   onPressed: () {
                //     Navigator.of(context).pop();
                //   },
                //   child: const Text("Cancel"),
                // ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
