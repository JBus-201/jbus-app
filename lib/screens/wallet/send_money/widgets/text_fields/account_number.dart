
import 'package:flutter/material.dart';
import 'package:jbus_app/widgets/text_fields/text_form_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class AccountNumberTextField extends StatelessWidget {
  const AccountNumberTextField({
    super.key,
  });

static final TextEditingController accountNumberCotroller =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return OurTextFormField(
      counterText: '',
      textInputAction: TextInputAction.next,
      label:
          AppLocalizations.of(context)!.accountNumber,
      icon: Icons.numbers_rounded,
      autocorrect: false,
      enableSuggestions: false,
      keyboardType: TextInputType.number,
      maxLength: 6,
      controller: accountNumberCotroller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return AppLocalizations.of(context)!
              .sorryPleaseEnterAnAccountNumberToSendMoney;
        }
        final bool accountNumber =
            RegExp(r'^\d{6}$').hasMatch(value.trim());
    
        if (accountNumber) {
          return null;
        } else {
          return AppLocalizations.of(context)!
              .sorryPleaseEnterAValidAmountOfMoney;
        }
      },
    );
  }
}
