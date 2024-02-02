import 'package:flutter/material.dart';
import 'package:jbus_app/data/api/api_service.dart';
import 'package:jbus_app/screens/wallet/scratch_wallet/widgets/text_fields/amount_of_charge_money.dart';
import 'package:jbus_app/services/service_locator.dart';
import 'package:jbus_app/widgets/buttons/rectangular_elevated_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jbus_app/widgets/warnings/warning.dart';

class ChargeButtonWithDialog extends StatelessWidget {
  const ChargeButtonWithDialog({
    super.key,
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return RectangularElevatedButton(
      text: AppLocalizations.of(context)!.charge,
      onPressed: () {
        if (formKey.currentState!.validate()) {
          print(
              'Code:::${AmmountOfChargeMoneyTextField.amountOfChargeMoneyController.text}');
          sl<ApiService>()
              .chargeUsingSC(int.parse(AmmountOfChargeMoneyTextField
                  .amountOfChargeMoneyController.text))
              .then((value) => {
                    if (value.response.statusCode == 200)
                      {
                        showDialog(
                            context: context,
                            builder: (context) => Warning(
                                title: AppLocalizations.of(context)!.great,
                                description: "Wallet charged succefuly"))
                      }
                  })
              // ignore: body_might_complete_normally_catch_error
              .catchError((error) {
            showDialog(
                context: context,
                builder: (context) => Warning(
                    title: AppLocalizations.of(context)!.ops,
                    description: error.toString()));
          });
        }
      },
    );
  }
}
