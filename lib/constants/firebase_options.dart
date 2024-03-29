// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBjNf0Vp14uUtp8ucbeF4f8_ovY-z4n0P8',
    appId: '1:161058040222:android:0dffe6e7b3e6a5465d4e8f',
    messagingSenderId: '161058040222',
    projectId: 'jbus-8f9bf',
    databaseURL:
        'https://jbus-8f9bf-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'jbus-8f9bf.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAY-2iHBnIctUyzmkmM8btqfZV0DKcPM_0',
    appId: '1:161058040222:ios:4fcdb76a5afe31725d4e8f',
    messagingSenderId: '161058040222',
    projectId: 'jbus-8f9bf',
    databaseURL:
        'https://jbus-8f9bf-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'jbus-8f9bf.appspot.com',
    iosClientId:
        '161058040222-9mt33mf2uooc9cslvmtjo5k3vvodbk83.apps.googleusercontent.com',
    iosBundleId: 'com.example.jbusApp',
  );
}
