import 'package:flutter/material.dart';
import 'package:jbus_app/data/api/realtime-firebase/writers.dart';
import 'package:jbus_app/screens/faza/pages/wating.dart';
import 'package:jbus_app/widgets/buttons/rectangular_elevated_button.dart';
import 'package:jbus_app/widgets/warnings/warning.dart';

class MyWidget extends StatelessWidget {
  final int totalAmountNeeded;
  const MyWidget({super.key, required this.totalAmountNeeded});

  @override
  Widget build(BuildContext context) {
    return RectangularElevatedButton(
        text: "Faza'a?",
        onPressed: () {
          /// TO DO
          int myId = 1;
          writeNeedFaza(myId, true).then((value) => {
                if (value)
                  {
                    showDialog(
                      context: context,
                      builder: (context) => const Warning(
                          isWarning: false,
                          title: "Request Sent Succesfuly",
                          description: ""),
                    ),
                    writeFazaTotalAmountNeeded(myId, totalAmountNeeded),
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FazaWaitingPage()))
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
