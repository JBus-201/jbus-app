import 'dart:async';
import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/constants/colors/gradients.dart';
import 'package:jbus_app/data/api/api_service.dart';
import 'package:jbus_app/data/api/realtime-firebase/lestiners.dart';
import 'package:jbus_app/data/api/realtime-firebase/writers.dart';
import 'package:jbus_app/data/models/fazaa_create_request.dart';
import 'package:jbus_app/services/service_locator.dart';
import 'package:jbus_app/widgets/buttons/rectangular_elevated_button.dart';
import 'package:jbus_app/widgets/others/app_bar_title_logo.dart';
import 'package:jbus_app/widgets/warnings/confirm.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FazaPayersPage extends StatefulWidget {
  final int requestorId;
  const FazaPayersPage({
    super.key,
    required this.requestorId,
  });

  @override
  State<FazaPayersPage> createState() => _FazaPayersPageState();
}

class _FazaPayersPageState extends State<FazaPayersPage> {
  late int myId;
  late int wallet;
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
    _amountReference = FirebaseDatabase.instance
        .ref()
        .child('Faza/${widget.requestorId}/totalAmount');
    _timerReference = FirebaseDatabase.instance
        .ref()
        .child('Faza/${widget.requestorId}/timer');
    // Start listening to changes in the amount
    _amountReference.onValue.listen((event) {
      final amount = event.snapshot.value as int?;
      if (amount != null) {
        setState(() {
          amountfaz = amount;
          print('amountfaz updated: $amountfaz');
          if (amountfaz == 0) {
            done = true;
            getTotalPayed(widget.requestorId, myId);
            FazaaCreateRequest fz = FazaaCreateRequest(
                amount: getTotalPayed(widget.requestorId, myId) as int,
                creditorId: myId);
            sl<ApiService>().storeFazaas(fz);
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
            Navigator.pop(context);
          }
        });
      }
    });
    final userRes = sl<SharedPreferences>().getString('user');
    Map<String, dynamic> res = json.decode(userRes!);
    setState(() {
      myId = res['id'];
      wallet = res['wallet'];
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
              '${AppLocalizations.of(context)!.totalAmountNeeded}: $amountfaz',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(
              height: 20,
            ),
            Text('${AppLocalizations.of(context)!.timeRemaining}: $_secondsRemaining',
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
              text: "${AppLocalizations.of(context)!.pay}: ${0.05}",
              width: 250,
              onPressed: () {
                if (wallet > 5) {
                  if (amountfaz > 0) {
                    showDialog(
                        context: context,
                        builder: (context) => ConfirmationDialog(
                            title: AppLocalizations.of(context)!.fazaa,
                            description:
                                "${AppLocalizations.of(context)!.sureToPay}: ${0.05}",
                            onConfirm: () {
                              Navigator.pop(context);
                              if (amountfaz > 0 && amountfaz - 5 >= 0) {
                                writeFazaPayers(widget.requestorId, myId, 5);
                              } else if (amountfaz > 0 && amountfaz - 5 < 0) {
                                // showDialog(
                                //     context: context,
                                //     builder: (context) => Warning(
                                //         title: "Faza'a",
                                //         description:
                                //             "Total Amount needed is lower than: 0.05\nYour Faza'a was: $amountfaz"));
                                writeFazaPayers(
                                    widget.requestorId, myId, amountfaz);
                              }
                            }));
                  }
                }
              },
            ),
            RectangularElevatedButton(
              text: AppLocalizations.of(context)!.payTen,
              width: 250,
              onPressed: () {
                if (amountfaz > 0) {
                  showDialog(
                      context: context,
                      builder: (context) => ConfirmationDialog(
                          title: AppLocalizations.of(context)!.fazaa,
                          description: "${AppLocalizations.of(context)!.sureToPay}: ${0.10}",
                          onConfirm: () {
                            Navigator.pop(context);
                            if (amountfaz > 0 && amountfaz - 10 >= 0) {
                              writeFazaPayers(widget.requestorId, myId, 10);
                            } else if (amountfaz > 0 && amountfaz - 10 < 0) {
                              // showDialog(
                              //     context: context,
                              //     builder: (context) => Warning(
                              //         title: "Faza'a",
                              //         description:
                              //             "Total Amount needed is lower than: 0.10\nYour Faza'a was: $amountfaz"));
                              writeFazaPayers(
                                  widget.requestorId, myId, amountfaz);
                            }
                          }));
                }
              },
            ),
            RectangularElevatedButton(
              text: AppLocalizations.of(context)!.payTwoFive,
              width: 250,
              onPressed: () {
                if (amountfaz > 0) {
                  showDialog(
                      context: context,
                      builder: (context) => ConfirmationDialog(
                          title: AppLocalizations.of(context)!.fazaa,
                          description: "${AppLocalizations.of(context)!.sureToPay}: ${0.25}",
                          onConfirm: () {
                            Navigator.pop(context);
                            if (amountfaz > 0 && amountfaz - 25 >= 0) {
                              writeFazaPayers(widget.requestorId, myId, 25);
                            } else if (amountfaz > 0 && amountfaz - 25 < 0) {
                              // showDialog(
                              //     context: context,
                              //     builder: (context) => Warning(
                              //         title: "Faza'a",
                              //         description:
                              //             "Total Amount needed is lower than: 0.25\nYour Faza'a was: $amountfaz"));
                              writeFazaPayers(
                                  widget.requestorId, myId, amountfaz);
                            }
                          }));
                }
              },
            ),
            RectangularElevatedButton(
              text: "${AppLocalizations.of(context)!.pay}: $amountfaz",
              width: 250,
              onPressed: () {
                if (amountfaz > 0) {
                  showDialog(
                      context: context,
                      builder: (context) => ConfirmationDialog(
                          title: AppLocalizations.of(context)!.fazaa,
                          description:
                              "${AppLocalizations.of(context)!.sureToPay}: $amountfaz",
                          onConfirm: () {
                            writeFazaPayers(
                                widget.requestorId, myId, amountfaz);
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
