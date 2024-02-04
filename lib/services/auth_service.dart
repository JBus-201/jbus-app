import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:jbus_app/constants/strings.dart';
import 'package:jbus_app/data/models/trip_states.dart';
import 'package:jbus_app/services/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AuthService {
  static const String tokenKey = 'auth_token';
  final SharedPreferences prefs;

  TripStatus? data;

  AuthService(this.prefs);

  Future<UserStatus> getApiStatus() async {
    final authToken = prefs.getString(tokenKey);

    if (authToken == null) {
      return UserStatus.notLoggedIn;
    }

    var response = await sl<Dio>().get('$baseUrl/PassengerAccount/status');

    if (response.statusCode! != 200) {
      return UserStatus.notLoggedIn;
    }

    var status = TripStatus.fromJson(response.data);

    data = status;

    switch (status.status) {
      case 0:
        return UserStatus.notLoggedIn;
      case 1:
        return UserStatus.loggedIn;
      case 2:
        return UserStatus.inTrip;
      default:
        throw Exception('Unexpected status from API');
    }
  }

  // Set the authentication state to logged in
  Future<void> setLoggedIn(String token) async {
    await prefs.setString(tokenKey, token);
  }

  // Set the authentication state to unauthenticated
  Future<void> setLoggedOut() async {
    FirebaseMessaging.instance.deleteToken();
    await prefs.remove(tokenKey);
  }
}

enum UserStatus {
  notLoggedIn,
  loggedIn,
  inTrip,
}
