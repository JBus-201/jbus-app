import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/widgets/buttons/favorite.dart';

class ViewLongPressDialog extends StatelessWidget {
  
  final int routeId;
  final LatLng location;

  const ViewLongPressDialog({
    super.key,
    
    required this.routeId,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      backgroundColor: ourWhite,
      child: Padding(
        padding:  EdgeInsets.all(MediaQuery.of(context).size.height * 0.02347),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            FavoriteButton(
                routeId: routeId, location: location, isFavorite: false),
             SizedBox(height: MediaQuery.of(context).size.height * 0.0187793),
          ],
        ),
      ),
    );
  }
}
