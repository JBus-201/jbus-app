import 'package:flutter/material.dart';

class JbusAppBarTitle extends StatelessWidget {
  const JbusAppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 12,
        ),
        Image.asset(
          'assets/logos/jbus-logo.png',
          scale: 20,
        ),
      ],
    );
  }
}
