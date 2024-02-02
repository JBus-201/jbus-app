
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jbus_app/widgets/text_fields/text_form_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AmmountOfChargeMoneyTextField extends StatelessWidget {
  const AmmountOfChargeMoneyTextField({
    super.key,
    
  });

    static final TextEditingController amountOfChargeMoneyController =
      TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return OurTextFormField(
      counterText: '',
      textInputAction: TextInputAction.next,
      label:
          AppLocalizations.of(context)!.amountOfMoney,
      icon: Icons.attach_money_rounded,
      autocorrect: false,
      enableSuggestions: false,
      keyboardType: TextInputType.number,
      maxLength: 6,
      controller: amountOfChargeMoneyController,
      inputFormatters: [
        FilteringTextInputFormatter.allow(
          RegExp(r'^\d+\.?\d{0,2}'),
        ),
      ],
      validator: (value) {
        if (value == null || value.isEmpty) {
          return AppLocalizations.of(context)!
              .sorryPleaseEnterTheAmountOfMoneyToBeCharged;
        }
        final bool amountOfMoney =
            RegExp(r'^\d+(\.\d{0,2})?$')
                .hasMatch(value.trim());
    
        if (amountOfMoney) {
          return null;
        } else {
          return AppLocalizations.of(context)!
              .sorryPleaseEnterAValidAmountOfMoney;
        }
      },
    );
  }
}
