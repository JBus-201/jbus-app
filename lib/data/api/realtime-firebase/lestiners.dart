// ignore_for_file: avoid_print

import 'package:firebase_database/firebase_database.dart';
import 'package:geolocator/geolocator.dart';
import 'package:jbus_app/data/api/realtime-firebase/removers.dart';
import 'package:jbus_app/data/api/realtime-firebase/writers.dart';

final databaseReference = FirebaseDatabase.instance.ref();
void startListeningToLocation(int routeId, int busId) {
  Geolocator.getPositionStream(
    locationSettings: const LocationSettings(
      accuracy: LocationAccuracy.best,
    ),
  ).listen((Position position) {
    // Handle location updates here
    double latitude = position.latitude;
    double longitude = position.longitude;

    // Write the location data to the Realtime Database
    writeLocationToDatabase(latitude, longitude, routeId, busId);
  });
}

void listenFazaReqState(int responderId, int requesterId) {
  String locationPath =
      "ReqForFaza/Responder/$responderId/Requester/$requesterId";

  // Create a reference to the specified location in the Realtime Database
  DatabaseReference reqReference = databaseReference.child(locationPath);

  // Listen for changes in the data
  reqReference.onValue.listen((event) {
    // Check if the event snapshot exists and contains data
    if (event.snapshot.value != null) {
      // Perform a more robust type check
      if (event.snapshot.value is Map<Object?, Object?>) {
        // Explicitly cast the value to a Map<Object?, Object?>
        Map<Object?, Object?> data =
            event.snapshot.value as Map<Object?, Object?>;

        // Check if the 'requestState' field exists and is a string
        if (data.containsKey('requestState') &&
            data['requestState'] is String) {
          // Get the value of the 'requestState' field
          String requestState = data['requestState'] as String;

          // Check if the value is 'r'
          if (requestState == 'r') {
            print('Request state is "r"');
            removeFazaReq(responderId, requesterId);
          } else if (requestState == 'a') {
            print('Request state is not "a"');
            // To do
            // Send id to backend
          }
        } else {
          print('Invalid data format: Missing or invalid "requestState" field');
        }
      } else {
        print('Invalid data format: Expected a Map<Object?, Object?>');
      }
    } else {
      print('Snapshot is null or does not contain data');
    }
  }, onError: (Object error) {
    print('Error listening for changes: $error');
  });
}

void listenFazaNeed(int requesterId) {
  String locationPath = "Faza/$requesterId";

  // Create a reference to the specified location in the Realtime Database
  DatabaseReference reqReference = databaseReference.child(locationPath);

  // Listen for changes in the data
  reqReference.onValue.listen((event) {
    // Check if the event snapshot exists and contains data
    if (event.snapshot.value != null) {
      // Perform a more robust type check
      if (event.snapshot.value is Map<Object?, Object?>) {
        // Explicitly cast the value to a Map<Object?, Object?>
        Map<Object?, Object?> data =
            event.snapshot.value as Map<Object?, Object?>;

        // Check if the 'needFaza' field exists and is a string
        if (data.containsKey('needFaza') && data['needFaza'] is bool) {
          // Get the value of the 'needFaza' field
          bool needFaza = data['needFaza'] as bool;

          // Check if the value is 'true'
          if (needFaza == true) {
            print('I need fazaa');
            // show fazza page
          }
        } else {
          print('Invalid data format: Missing or invalid "needFaza" field');
        }
      } else {
        print('Invalid data format: Expected a Map<Object?, Object?>');
      }
    } else {
      print('Snapshot is null or does not contain data');
    }
  }, onError: (Object error) {
    print('Error listening for changes: $error');
  });
}
