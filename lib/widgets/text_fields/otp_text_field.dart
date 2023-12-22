import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpTextField extends StatelessWidget {
  const OtpTextField({
    Key? key,
    this.first = false,
  }) : super(key: key);

  final bool first;

  @override
  Widget build(BuildContext context) {
    final TextEditingController digitController = TextEditingController();

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 100,
          child: TextFormField(
            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              }

              if (value.isEmpty && first == false) {
                FocusScope.of(context).previousFocus();
              }
            },
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              FilteringTextInputFormatter.digitsOnly
            ],
            showCursor: false,
            maxLength: 1,
            keyboardType: TextInputType.number,

            autocorrect: false,
            enableSuggestions: false,
            // validator: (value) {
            //   return null;
            // },
            autofocus: first == true ? true : false,
            controller: digitController,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              counterText: ' ',
              focusColor: Colors.amber,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22),
                borderSide: const BorderSide(color: Colors.amber),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
