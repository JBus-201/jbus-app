import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:jbus_app/data/api/realtime-firebase/removers.dart';
import 'package:jbus_app/data/api/realtime-firebase/writers.dart';
import 'package:jbus_app/widgets/others/app_bar_title_logo.dart';

class FazaWaitingPage extends StatefulWidget {
  // final List<dynamic> going_waypoints;
  // final LatLng currentLocation;
  // final LatLng dropOff;

  const FazaWaitingPage({
    super.key,
    // required this.going_waypoints,
    // required this.currentLocation,
    // required this.dropOff
  });

  @override
  State<FazaWaitingPage> createState() => _FazaWaitingPageState();
}

class _FazaWaitingPageState extends State<FazaWaitingPage> {
  /// TO DO
  int myId = 1;
  int _secondsRemaining = 30;
  // ignore: unused_field
  late Timer _timer;
  int amountfaz = 0;
  bool done = false;
  late DatabaseReference _amountReference;

  @override
  void initState() {
    super.initState();
    _amountReference =
        FirebaseDatabase.instance.ref().child('Faza/$myId/totalAmount');

    // Start listening to changes in the amount
    _amountReference.onValue.listen((event) {
      final amount = event.snapshot.value as int?;
      if (amount != null) {
        setState(() {
          amountfaz = amount;
          print('amountfaz updated: $amountfaz');
          if (amountfaz == 0) {
            done = true;
            // Navigator.pushReplacement(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => Trip(
            //             going_waypoints: widget.going_waypoints,
            //             currentLocation: widget.currentLocation,
            //             dropOff: widget.dropOff)));
          }
        });
      }
    });

    _startTimer();
  }

  ///Body
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitleLogo(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'total amount neede: $amountfaz',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(
              height: 20,
            ),
            Text('Time remaining: $_secondsRemaining')
          ],
        ),
      ),
    );
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          timer.cancel();
          writeNeedFaza(myId, false);
          removeAllPayers(myId);
          // Navigator.of(context).pop();
          // Navigator.of(context).pop();
          // Navigator.of(context).pop();
        }
      });
    });
  }
}
