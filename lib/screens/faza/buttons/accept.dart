import 'package:flutter/material.dart';
import 'package:jbus_app/constants/colors/gradients.dart';
import 'package:jbus_app/data/api/realtime-firebase/writers.dart';
import 'package:jbus_app/widgets/buttons/rectangular_elevated_button.dart';

class AcceptRequest extends StatelessWidget {
  final int myId;
  final int requesterId;
  const AcceptRequest(
      {super.key, required this.myId, required this.requesterId});

  @override
  Widget build(BuildContext context) {
    return RectangularElevatedButton(
        text: "Accept",
        width: 150,
        height: 10,
        gradient: greenButtonGradient,
        onPressed: () {
          writeFazaReqState('a', myId, requesterId);
        });
  }
}
