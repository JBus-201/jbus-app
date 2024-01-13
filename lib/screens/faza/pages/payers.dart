import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/constants/colors/gradients.dart';
import 'package:jbus_app/data/api/realtime-firebase/removers.dart';
import 'package:jbus_app/data/api/realtime-firebase/writers.dart';
import 'package:jbus_app/widgets/buttons/rectangular_elevated_button.dart';
import 'package:jbus_app/widgets/others/app_bar_title_logo.dart';
import 'package:jbus_app/widgets/warnings/confirm.dart';

class FazaPayersPage extends StatefulWidget {
  const FazaPayersPage({
    super.key,
  });

  @override
  State<FazaPayersPage> createState() => _FazaPayersPageState();
}

class _FazaPayersPageState extends State<FazaPayersPage> {
  /// TO DO
  int myId = 1;
  int _secondsRemaining = 30;
  // ignore: unused_field
  late Timer _timer;
  int amountfaz = 0;
  bool done = false;
  late DatabaseReference _amountReference;
  late DatabaseReference _timerReference;

  @override
  void initState() {
    super.initState();
    _amountReference =
        FirebaseDatabase.instance.ref().child('Faza/$myId/totalAmount');
    _timerReference = FirebaseDatabase.instance.ref().child('Faza/$myId/timer');
    // Start listening to changes in the amount
    _amountReference.onValue.listen((event) {
      final amount = event.snapshot.value as int?;
      if (amount != null) {
        setState(() {
          amountfaz = amount;
          print('amountfaz updated: $amountfaz');
          if (amountfaz == 0) {
            done = true;
            // Navigator.pop(context);
          }
        });
      }
    });
    // Start listening to changes in the Timer
    _timerReference.onValue.listen((event) {
      final currentimer = event.snapshot.value as int?;
      if (currentimer != null) {
        setState(() {
          _secondsRemaining = currentimer;
          print('current timer: $currentimer');
          if (_secondsRemaining == 0) {
            // Navigator.pop(context);
          }
        });
      }
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'total amount neede: $amountfaz',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(
              height: 20,
            ),
            Text('Time remaining: $_secondsRemaining',
                style: TextStyle(
                    color: _secondsRemaining <= 15
                        ? _secondsRemaining < 5
                            ? ourRed
                            : ourOrange
                        : ourGreen)),
            const SizedBox(
              height: 50,
            ),
            RectangularElevatedButton(
              text: "pay: 0.05",
              width: 250,
              onPressed: () {
                if (amountfaz > 0) {
                  showDialog(
                      context: context,
                      builder: (context) => ConfirmationDialog(
                          title: "Faza'a",
                          description: "Are you sure to pay\nthis amount: 0.05",
                          onConfirm: () {
                            Navigator.pop(context);
                            if (amountfaz > 0 && amountfaz - 5 >= 0) {
                              writeFazaPayers(1, 2, 5);
                            } else if (amountfaz > 0 && amountfaz - 5 < 0) {
                              // showDialog(
                              //     context: context,
                              //     builder: (context) => Warning(
                              //         title: "Faza'a",
                              //         description:
                              //             "Total Amount needed is lower than: 0.05\nYour Faza'a was: $amountfaz"));
                              writeFazaPayers(1, 2, amountfaz);
                            }
                          }));
                }
              },
            ),
            RectangularElevatedButton(
              text: "pay: 0.10",
              width: 250,
              onPressed: () {
                if (amountfaz > 0) {
                  showDialog(
                      context: context,
                      builder: (context) => ConfirmationDialog(
                          title: "Faza'a",
                          description: "Are you sure to pay\nthis amount: 0.10",
                          onConfirm: () {
                            Navigator.pop(context);
                            if (amountfaz > 0 && amountfaz - 10 >= 0) {
                              writeFazaPayers(1, 2, 10);
                            } else if (amountfaz > 0 && amountfaz - 10 < 0) {
                              // showDialog(
                              //     context: context,
                              //     builder: (context) => Warning(
                              //         title: "Faza'a",
                              //         description:
                              //             "Total Amount needed is lower than: 0.10\nYour Faza'a was: $amountfaz"));
                              writeFazaPayers(1, 2, amountfaz);
                            }
                          }));
                }
              },
            ),
            RectangularElevatedButton(
              text: "pay: 0.25",
              width: 250,
              onPressed: () {
                if (amountfaz > 0) {
                  showDialog(
                      context: context,
                      builder: (context) => ConfirmationDialog(
                          title: "Faza'a",
                          description: "Are you sure to pay\nthis amount: 0.25",
                          onConfirm: () {
                            Navigator.pop(context);
                            if (amountfaz > 0 && amountfaz - 25 >= 0) {
                              writeFazaPayers(1, 2, 25);
                            } else if (amountfaz > 0 && amountfaz - 25 < 0) {
                              // showDialog(
                              //     context: context,
                              //     builder: (context) => Warning(
                              //         title: "Faza'a",
                              //         description:
                              //             "Total Amount needed is lower than: 0.25\nYour Faza'a was: $amountfaz"));
                              writeFazaPayers(1, 2, amountfaz);
                            }
                          }));
                }
              },
            ),
            RectangularElevatedButton(
              text: "pay: $amountfaz",
              width: 250,
              onPressed: () {
                if (amountfaz > 0) {
                  showDialog(
                      context: context,
                      builder: (context) => ConfirmationDialog(
                          title: "Faza'a",
                          description:
                              "Are you sure to pay\nthis amount: $amountfaz",
                          onConfirm: () {
                            writeFazaPayers(1, 2, amountfaz);
                            Navigator.pop(context);
                          }));
                }
              },
              gradient: goldButtonGradient,
              gradientForDark: goldButtonGradient,
              padding: 50,
            )
          ],
        ),
      ),
    );
  }
}
