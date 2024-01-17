import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jbus_app/constants/colors/gradients.dart';
import 'package:jbus_app/data/api/realtime-firebase/writers.dart';
import 'package:jbus_app/data/models/bus_route.dart';
import 'package:jbus_app/screens/faza/pages/wating.dart';
import 'package:jbus_app/services/service_locator.dart';
import 'package:jbus_app/widgets/buttons/rectangular_elevated_button.dart';
import 'package:jbus_app/widgets/warnings/warning.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FazaRequestBT extends StatelessWidget {
  final int totalAmountNeeded;
  final BusRoute route;
  const FazaRequestBT({
    super.key,
    required this.totalAmountNeeded,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return RectangularElevatedButton(
        gradient: redButtonGradient,
        width: 100,
        text: "Faza'a?",
        onPressed: () {
          /// TO DO
          final userRes = sl<SharedPreferences>().getString('user');
          Map<String, dynamic> res = json.decode(userRes!);

          int myId = res['id'];
          print('Faza Request My ID: $myId');
          writeNeedFaza(myId, true).then((value) => {
                if (value)
                  {
                    writeFazaTotalAmountNeeded(myId, totalAmountNeeded),
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                FazaWaitingPage(route: route)))
                  }
                else
                  {
                    showDialog(
                      context: context,
                      builder: (context) => const Warning(
                          isWarning: true,
                          title: "Ops!",
                          description: "Somthing went wrong"),
                    )
                  }
              });
        });
  }
}
