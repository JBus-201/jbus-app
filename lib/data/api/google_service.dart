// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image/image.dart' as img;

class GoogleMapsApi {
  final String apiKey = "AIzaSyBGSGYjRajQX1-0LksuNshClN1l8ORObJA";
  static LatLng curentLocation = const LatLng(0, 0);
  static bool permission = false;
  BitmapDescriptor? customBusIcon;
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
    loadCustomBusIcon();
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
      if (kDebugMode) {}
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

  Future<String> calculateETA(LatLng origin, LatLng destination) async {
    print('start: $origin');
    print('start: $destination');
    try {
      final String apiUrl =
          'https://maps.googleapis.com/maps/api/directions/json?origin=${origin.latitude},${origin.longitude}&destination=${destination.latitude},${destination.longitude}&mode=driving&traffic_mode=optimistic&key=$apiKey';

      final response = await http.get(Uri.parse(apiUrl));
      print('Respons ETa:${response.body}');
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final status = data['status'] as String;

        if (status == 'OK') {
          final routes = data['routes'] as List<dynamic>;

          if (routes.isNotEmpty) {
            final leg = routes[0]['legs'][0];
            final duration = leg['duration']['text'] as String;
            return duration;
          } else {
            // Handle no route found
            return 'N/A';
          }
        } else {
          // Handle other status codes
          throw Exception('Failed to load ETA. Status: $status');
        }
      }
    } catch (error) {
      print('Error geting ETA: $error');
    }
    return "N/a";
  }

  Future<Duration> calculateDrivingEta(
      LatLng origin, LatLng destination) async {
    const apiUrl = 'https://maps.googleapis.com/maps/api/distancematrix/json';

    final response = await http.get(
      Uri.parse(
        '$apiUrl?origins=${origin.latitude},${origin.longitude}'
        '&destinations=${destination.latitude},${destination.longitude}'
        '&mode=traveling'
        '&key=$apiKey',
      ),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print('ETA: $data');
      if (data['status'] == 'OK') {
        final element = data['rows'][0]['elements'][0];
        final durationInSeconds = element['duration']['value'];
        return Duration(seconds: durationInSeconds);
      } else {
        throw Exception(
            'Failed to retrieve Distance Matrix results. Status: ${data['status']}');
      }
    } else {
      throw Exception(
          'Failed to retrieve Distance Matrix results. Status Code: ${response.statusCode}');
    }
  }

  Future<void> loadCustomBusIcon() async {
    final ByteData data = await rootBundle.load('assets/images/bus-icon.png');
    final Uint8List bytes = data.buffer.asUint8List();

    // Load the icon as an image using the image package
    final img.Image image = img.decodeImage(Uint8List.fromList(bytes))!;

    const double targetWidth = 130.0; // Set your desired width here
    const double targetHeight = 130.0; // Set your desired height here

    // Resize the image
    final img.Image resizedImage = img.copyResize(
      image,
      width: targetWidth.toInt(),
      height: targetHeight.toInt(),
    );

    // Encode the resized image as bytes
    final Uint8List resizedBytes =
        Uint8List.fromList(img.encodePng(resizedImage));

    customBusIcon = BitmapDescriptor.fromBytes(resizedBytes);
  }
}
