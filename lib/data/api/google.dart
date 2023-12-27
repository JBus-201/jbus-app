import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsApi {
  final String apiKey = "AIzaSyBGSGYjRajQX1-0LksuNshClN1l8ORObJA";
  static LatLng curentLocation = const LatLng(0, 0);
  static bool permission = false;

  GoogleMapsApi() {
    setCurrentLocation();
  }
  String generateMapImageUrl(double latitude, double longitude, Color markerColor) {
    const int width = 247;
    const int height = 101;
    final String marker = 'markers=color:$markerColor|$latitude,$longitude';
    final String url =
        'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=15&size=${width}x$height&$marker&key=$apiKey';
    return url;
  }

  Widget getPointImage(double latitude, double longitude, Color markerColor) {
    return Image.network(
      generateMapImageUrl(latitude, longitude, markerColor),
      fit: BoxFit.cover,
    );
  }

  static void askForLocationPermission() async {
    try {
      final LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        final LocationPermission newPermission = await Geolocator.requestPermission();
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
        final LocationPermission newPermission = await Geolocator.requestPermission();
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

  Future<void> setCurrentLocation() async {
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
        print("Exception error: $e");
      }
    }
  }

  Future<String?> loadRoute(List<dynamic> waypoints) async {
    waypoints
        .map((waypointData) {
          final geometry = waypointData['Location'];
          //??
          // waypointData['Position'] ??
          // waypointData['Coordinates'] ??
          // waypointData['GeoData'] ??
          // waypointData['Place'] ??
          // waypointData['Positioning'] ??
          // waypointData['MapInfo'] ??
          // waypointData['GPS'] ??
          // waypointData['PlaceCoordinates'] ??
          // waypointData['Waypoint'];

          if (geometry != null) {
            final latitude = geometry['Latitude'];
            final longitude = geometry['Longitude'];
            return LatLng(latitude, longitude);
          }
          return null;
        })
        .whereType<LatLng>()
        .toList();

    if (waypoints.isEmpty) {
      return null;
    }

    final waypointsString = waypoints.map((point) {
      return "${point.latitude},${point.longitude}";
    }).join('|');

    final response = await http.get(Uri.parse(
      'https://maps.googleapis.com/maps/api/directions/json?origin=${waypoints.first.latitude},${waypoints.first.longitude}&destination=${waypoints.last.latitude},${waypoints.last.longitude}&waypoints=$waypointsString&key=$apiKey',
    ));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final routes = data['routes'] as List<dynamic>;
      if (routes.isNotEmpty) {
        final route = routes[0];
        final overviewPolyline = route['overview_polyline'];
        final points = overviewPolyline['points'];
        return points;
      }
    }
    return null;
  }

  void handleMapLongPress(LatLng tappedPoint) {}

  List<LatLng> decodePolyline(String polyline) {
    List<LatLng> points = [];
    for (var point in decodeEncodedPolyline(polyline)) {
      points.add(LatLng(point[0], point[1]));
    }
    return points;
  }

  List<List<double>> decodeEncodedPolyline(String encoded) {
    List<List<double>> poly = [];
    int index = 0;
    int len = encoded.length;
    int lat = 0;
    int lng = 0;

    while (index < len) {
      int b;
      int shift = 0;
      int result = 0;

      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);

      lat += ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));

      shift = 0;
      result = 0;

      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);

      lng += ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));

      poly.add([lat / 1E5, lng / 1E5]);
    }

    return poly;
  }
}
