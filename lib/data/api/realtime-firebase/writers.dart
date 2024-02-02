// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables

import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jbus_app/data/api/realtime-firebase/lestiners.dart';
import 'package:jbus_app/screens/faza/pages/payers.dart';

final databaseReference = FirebaseDatabase.instance.ref();
void writeLocationToDatabase(
    double latitude, double longitude, int routeId, int busId, bool isGoing) {
  String locationPath =
      "Route/$routeId/${isGoing ? "going" : "returning"}/Bus/$busId/currentLocation";

  // Write the location data to the database
  databaseReference.child(locationPath).update({
    "latitude": latitude,
    "longitude": longitude,
  }).then((_) {
    print(
        "Driver Location data written successfully!\nRoute:$routeId\tBusId:$busId \n--- $latitude --- $longitude");
  }).catchError((error) {
    print("Error writing location data: $error");
  });
}

void incrementCurrentPassNum(int routeId, bool isGoing, int busId) async {
  try {
    // Reference to the specific bus's node in the Realtime Database
    DatabaseReference busReference = databaseReference
        .child('Route/$routeId/${isGoing ? "going" : "returning"}/Bus')
        .child('$busId');

    // Fetch the current value of currentPassNum
    DatabaseEvent busEvent = await busReference.once();
    DataSnapshot busSnapshot = busEvent.snapshot;

    // Check if the bus data exists and is a map
    if (busSnapshot.value is Map<Object?, Object?>) {
      Map<Object?, Object?>? busData =
          busSnapshot.value as Map<Object?, Object?>?;

      // Get the current value of "currentPassNum" or set it to 0 if not present
      int currentPassNum = busData?['currentPassNum'] as int? ?? 0;

      // Increment currentPassNum by 1
      int updatedPassNum = currentPassNum + 1;

      // Update the value in the Realtime Database
      await busReference.update({'currentPassNum': updatedPassNum});
      print(
          'currentPassNum updated successfully for Bus $busId. New value: $updatedPassNum');
    } else {
      print('Invalid bus data for Bus $busId. Data is not a map.');
    }
  } catch (error) {
    print('Error updating currentPassNum: $error');
  }
}

// Function to write the latitude and longitude for a drop-off
Future<void> writeDropoffLocation(
    LatLng location, int routeId, int busId, int userId, bool isGoing) async {
  try {
    DatabaseReference busReference = databaseReference
        .child('Route/$routeId/${isGoing ? "going" : "returning"}/Bus')
        .child('$busId');

    // Fetch the current bus data
    DatabaseEvent busEvent = await busReference.once();
    DataSnapshot busSnapshot = busEvent.snapshot;

    // Check if the bus data exists and is a map
    if (busSnapshot.value is Map<Object?, Object?>) {
      Map<Object?, Object?>? busData =
          busSnapshot.value as Map<Object?, Object?>?;

      // Check if the bus data contains "dropoffs"
      if (busData?.containsKey('dropoffs') == true) {
        // Generate a new drop-off ID
        int dropoffId = userId;

        // Write the latitude and longitude to the drop-off node
        await busReference.child('dropoffs').child('$dropoffId').set({
          'latitude': location.latitude,
          'longitude': location.longitude,
        });

        print(
            'Drop-off location written successfully for Bus $busId. Drop-off ID: $dropoffId');
      } else {
        // If "dropoffs" doesn't exist, create it and set the first drop-off
        int dropoffId = userId;

        await busReference.child('dropoffs').set({
          dropoffId: {
            'latitude': location.latitude,
            'longitude': location.longitude,
          },
        });

        print(
            'Drop-off location written successfully for Bus $busId. Drop-off ID: $dropoffId');
      }
    } else {
      print('Invalid bus data for Bus $busId. Data is not a map.');
    }
  } catch (error) {
    print('Error writing drop-off location: $error');
  }
}

Future<void> writePickupLocation(
    LatLng location, int routeId, int busId, int userId, bool isGoing) async {
  try {
    DatabaseReference busReference = databaseReference
        .child('Route/$routeId/${isGoing ? "going" : "returning"}/Bus')
        .child('$busId');

    // Fetch the current bus data
    DatabaseEvent busEvent = await busReference.once();
    DataSnapshot busSnapshot = busEvent.snapshot;

    // Check if the bus data exists and is a map
    if (busSnapshot.value is Map<Object?, Object?>) {
      Map<Object?, Object?>? busData =
          busSnapshot.value as Map<Object?, Object?>?;

      // Check if the bus data contains "pickups"
      if (busData?.containsKey('pickups') == true) {
        // Generate a new drop-off ID
        int dropoffId = userId;

        // Write the latitude and longitude to the drop-off node
        await busReference.child('pickups').child('$dropoffId').set({
          'latitude': location.latitude,
          'longitude': location.longitude,
        });

        print(
            'Drop-off location written successfully for Bus $busId. Drop-off ID: $dropoffId');
      } else {
        // If "pickups" doesn't exist, create it and set the first drop-off
        int dropoffId = userId;

        await busReference.child('pickups').set({
          dropoffId: {
            'latitude': location.latitude,
            'longitude': location.longitude,
          },
        });

        print(
            'Drop-off location written successfully for Bus $busId. Drop-off ID: $dropoffId');
      }
    } else {
      print('Invalid bus data for Bus $busId. Data is not a map.');
    }
  } catch (error) {
    print('Error writing drop-off location: $error');
  }
}

Future<bool> writeNeedFaza(int requesterId, bool state) async {
  String locationPath = "Faza/$requesterId";

  try {
    await databaseReference.child(locationPath).update({
      "needFaza": state,
    });
    print("NeedFaza written successfully!\nState:$state");
    return true;
  } catch (error) {
    print("Error writing NeedFaza: $error");
    return false;
  }
}

void writeFazaPayers(int requesterId, int payerId, int amount) async {
  String locationPath = "Faza/$requesterId/payers/$payerId/";
  int totalPayed = amount;
  databaseReference.child(locationPath).update({
    "totalPayed": totalPayed,
  }).then((_) {
    print("totalPayed written successfully!\nAmount:$amount");
    
  }).catchError((error) {
    print("Error writing NeedFaza: $error");
  });
}

void writeUpdatedTotalAmountNeeded(
    int requesterId, int payerId, int amount) async {
  String locationPath = "Faza/$requesterId/";
  int? totalAmount = await getTotalAmount(requesterId);
  totalAmount = (totalAmount! - amount);
  databaseReference.child(locationPath).update({
    "totalAmount": totalAmount,
  }).then((_) {
    print("totalAmount written successfully!\ntotalAmount:$amount");
  }).catchError((error) {
    print("Error writing totalAmount: $error");
  });
}

void writeFazaTotalAmountNeeded(int requesterId, int amount) {
  String locationPath = "Faza/$requesterId/";

  databaseReference.child(locationPath).update({
    "totalAmount": amount,
  }).then((_) {
    print("totalAmount written successfully!\ntotalAmount:$amount");
  }).catchError((error) {
    print("Error writing totalAmount: $error");
  });
}

void writeFazaTimer(int requesterId, int timer) {
  String locationPath = "Faza/$requesterId/";

  databaseReference.child(locationPath).update({
    "timer": timer,
  }).then((_) {
    print("timer written successfully!\ntimer:$timer");
  }).catchError((error) {
    print("Error writing timer: $error");
  });
}
