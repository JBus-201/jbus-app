// ignore_for_file: avoid_print

import 'package:firebase_database/firebase_database.dart';
import 'package:geolocator/geolocator.dart';
import 'package:jbus_app/data/api/realtime-firebase/writers.dart';

final databaseReference = FirebaseDatabase.instance.ref();
void startListeningToLocation(int routeId, int busId, bool isGoing) {
  Geolocator.getPositionStream(
    locationSettings: const LocationSettings(
      accuracy: LocationAccuracy.best,
    ),
  ).listen((Position position) {
    // Handle location updates here
    double latitude = position.latitude;
    double longitude = position.longitude;

    // Write the location data to the Realtime Database
    writeLocationToDatabase(latitude, longitude, routeId, busId, isGoing);
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
Future<int?> getCapacity(int routeId,int busId,bool isGoing) async {
  try {
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
      int capacity = busData?['capacity'] as int? ?? 0;
      
      return capacity;
    } else {
      print('Invalid bus data for Bus $busId. Data is not a map.');
    }
  } catch (error) {
    print('Error updating currentPassNum: $error');
  }
  return null;
}

Future<int?> getTotalAmount(int requesterId) async {
  try {
    // Create a reference to the "Faza" node in the Realtime Database
    final fazaReference = FirebaseDatabase.instance.ref('Faza/$requesterId');

    // Retrieve the data at the specified location
    DatabaseEvent totalEvent = await fazaReference.once();
    DataSnapshot dataSnapshot = totalEvent.snapshot;

    // Check if the data contains the 'totalAmount' field
    if (dataSnapshot.value is Map<Object?, Object?>) {
      Map<Object?, Object?>? totalData =
          dataSnapshot.value as Map<Object?, Object?>?;

      // Check if 'totalAmount' is not null before casting
      if (totalData?['totalAmount'] != null) {
        print('TotalAmount: ${totalData?['totalAmount']}');
        return totalData?['totalAmount'] as int;
      }
    }
  } catch (error) {
    // Handle errors, e.g., print an error message
    print("Error retrieving totalAmount: $error");
  }

  // Return null if there is an error or 'totalAmount' is null
  return null;
}

Future<int> getTotalPayed(int requesterId, int payerId) async {
  try {
    // Create a reference to the "Faza" node in the Realtime Database
    final fazaReference =
        FirebaseDatabase.instance.ref('Faza/$requesterId/payers/$payerId/');

    // Retrieve the data at the specified location
    DatabaseEvent totalEvent = await fazaReference.once();
    DataSnapshot dataSnapshot = totalEvent.snapshot;

    // Check if the data contains the 'totalPayed' field
    if (dataSnapshot.value is Map<Object?, Object?>) {
      Map<Object?, Object?>? totalData =
          dataSnapshot.value as Map<Object?, Object?>?;

      // Check if 'totalPayed' is not null before casting
      if (totalData?['totalPayed'] != null) {
        print('totalPayed: ${totalData?['totalPayed']}');
        return totalData?['totalPayed'] as int;
      }
    }
  } catch (error) {
    // Handle errors, e.g., print an error message
    print("Error retrieving totalPayed: $error");
  }

  // Return null if there is an error or 'totalPayed' is null
  return 0;
}
