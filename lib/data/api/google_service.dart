// ignore_for_file: unused_local_variable

import 'package:flutter/foundation.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsApi {
  final String apiKey = "AIzaSyBGSGYjRajQX1-0LksuNshClN1l8ORObJA";
  static LatLng curentLocation = const LatLng(0, 0);
  static bool permission = false;
  static const String darkMapString = '''[
  {
    "featureType": "administrative",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#3C4E3E"
      }
    ]
  },
  {
    "featureType": "landscape",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#25253C"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#000000"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#5B5969"  
      }
    ]
  }
]
''';

  GoogleMapsApi() {
    _setCurrentLocation();
  }
  String _generateMapImageUrl(
      double latitude, double longitude, Color markerColor) {
    const int width = 247;
    const int height = 101;
    final String marker = 'markers=color:$markerColor|$latitude,$longitude';
    final String url =
        'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=15&size=${width}x$height&$marker&key=$apiKey';
    return url;
  }

  Widget getPointImage(double latitude, double longitude, Color markerColor) {
    return Image.network(
      _generateMapImageUrl(latitude, longitude, markerColor),
      fit: BoxFit.cover,
    );
  }

  static void askForLocationPermission() async {
    try {
      final LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        final LocationPermission permission =
            await Geolocator.requestPermission();
      }
    } catch (e) {
      if (kDebugMode) {
        print("exiption error: $e");
      }
    }
  }

  static Future<bool> checkLocationPermission() async {
    try {
      final LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        final LocationPermission newPermission =
            await Geolocator.requestPermission();
        if (newPermission == LocationPermission.denied) {
          return false;
        } else {
          return true;
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("exiption error: $e");
      }
    }
    return false;
  }

  Future<void> _setCurrentLocation() async {
    // Check if the app has permission to access the device's location
    try {
      askForLocationPermission();

      // Get the current location
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      LatLng crntLocation = LatLng(position.latitude, position.longitude);
      curentLocation = crntLocation;
      if (kDebugMode) {
        print("i am here");
      }
      permission = true;
    } catch (e) {
      if (kDebugMode) {
        print("exiption error: $e");
      }
    }
  }

  Future<void> moveToCurrentLocation(GoogleMapController mapController) async {
    try {
      // Get the current location
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      LatLng currentLocation = LatLng(position.latitude, position.longitude);

      // Animate the camera to the user's current location
      mapController.animateCamera(CameraUpdate.newLatLng(currentLocation));
    } catch (e) {
      if (kDebugMode) {
        print("Moving Map Exception error: $e");
      }
    }
  }

  Future<void> moveToLocation(
      GoogleMapController mapController, LatLng location) async {
    try {
      mapController.animateCamera(CameraUpdate.newLatLng(location));
    } catch (e) {
      if (kDebugMode) {
        print("Moving Map Exception error: $e");
      }
    }
  }

  void handleMapLongPress(LatLng tappedPoint) {}

  List<LatLng> decodePolyline(String polyline) {
    return PolylinePoints()
        .decodePolyline(polyline)
        .map((point) => LatLng(point.latitude, point.longitude))
        .toList();
  }
}
