import 'package:flutter/material.dart';
import 'package:jbus_app/constants/colors/gradients.dart';
import 'package:jbus_app/data/api/realtime-firebase/writers.dart';
import 'package:jbus_app/widgets/buttons/rectangular_elevated_button.dart';

class RejectRequest extends StatelessWidget {
  final int myId;
  final int requesterId;
  const RejectRequest(
      {super.key, required this.myId, required this.requesterId});

  @override
  Widget build(BuildContext context) {
    return RectangularElevatedButton(
        text: "Reject",
        width: 150,
        height: 10,
        gradient: redButtonGradient,
        onPressed: () {
          writeFazaReqState('r', myId, requesterId);
        });
  }
}
