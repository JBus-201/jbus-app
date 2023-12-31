import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const String _tokenKey = 'auth_token';
  final SharedPreferences prefs;

  AuthService(this.prefs);

  // Check if the user is logged in
  bool isLoggedIn() {
    final String? token = prefs.getString(_tokenKey);

    return token != null && token.isNotEmpty;
  }

  // Set the authentication state to logged in
  Future<void> setLoggedIn(String token) async {
    await prefs.setString(_tokenKey, token);
  }

  // Set the authentication state to unauthenticated
  Future<void> setLoggedOut() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }
}
