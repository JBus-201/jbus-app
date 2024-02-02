import 'dart:async';
import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:jbus_app/data/api/realtime-firebase/removers.dart';
import 'package:jbus_app/data/api/realtime-firebase/writers.dart';
import 'package:jbus_app/data/models/bus_route.dart';
import 'package:jbus_app/screens/trip/tripSettup.dart';
import 'package:jbus_app/services/service_locator.dart';
import 'package:jbus_app/widgets/others/app_bar_title_logo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FazaWaitingPage extends StatefulWidget {
  final BusRoute route;

  const FazaWaitingPage({
    super.key,
    required this.route,
  });

  @override
  State<FazaWaitingPage> createState() => _FazaWaitingPageState();
}

class _FazaWaitingPageState extends State<FazaWaitingPage> {
  /// TO DO
  late int myId;
  int _secondsRemaining = 60;
  // ignore: unused_field
  late Timer _timer;
  int amountfaz = 0;
  bool done = false;
  late DatabaseReference _amountReference;

  @override
  void initState() {
    super.initState();
    _loadUserData();
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
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => TripSettup(route:widget.route)));
          }
        });
      }
    });

    _startTimer();
  }

  void _loadUserData() async {
    final userRes = sl<SharedPreferences>().getString('user');
    Map<String, dynamic> res = json.decode(userRes!);
    setState(() {
      myId = res['id'];
    });
  }

  ///Body
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const JbusAppBarTitle(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '${AppLocalizations.of(context)!.totalAmountNeeded}: $amountfaz',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(
              height: 20,
            ),
            Text('${AppLocalizations.of(context)!.timeRemaining}: $_secondsRemaining')
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
          writeFazaTimer(myId, _secondsRemaining);
        } else {
          timer.cancel();
          writeNeedFaza(myId, false);
          writeFazaTotalAmountNeeded(myId, -1);
          removeAllPayers(myId);
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        }
      });
    });
  }
}
