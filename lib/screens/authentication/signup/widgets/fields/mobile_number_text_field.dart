import 'package:flutter/material.dart';
import 'package:jbus_app/generated/l10n.dart';
import 'package:jbus_app/widgets/fields/text_form_field.dart';

class MobileNumberTextField extends StatelessWidget {
  const MobileNumberTextField({super.key});
  static final TextEditingController phoneNumberController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return OurTextFormField(
        label: '${S.of(context).mobileNumber} ${S.of(context).optional}',
        icon: Icons.phone_iphone,
        textInputAction: TextInputAction.next,
        controller: phoneNumberController,
        keyboardType: TextInputType.phone,
        autocorrect: false,
        enableSuggestions: false,
        maxLength: 10,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return null;
          }
          final bool numberValid =
              RegExp('^07[789][0-9]{7}\$').hasMatch(value.trim());

          if (numberValid) {
            return null;
          } else {
            return S.of(context).sorryPleaseEnterAValidNumberStartsWith07;
          }
        });
  }
}
