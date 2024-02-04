import 'package:flutter/material.dart';

class JbusAppBarTitle extends StatelessWidget {
  const JbusAppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         SizedBox(
          height: MediaQuery.of(context).size.height * 0.01408451,
        ),
        Image.asset(
          'assets/logos/jbus-logo.png',
          scale: MediaQuery.of(context).size.height * 0.02347418,
        ),
      ],
    );
  }
}
