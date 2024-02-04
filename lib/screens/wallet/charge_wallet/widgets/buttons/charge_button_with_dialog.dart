import 'package:flutter/material.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/data/api/api_service.dart';
import 'package:jbus_app/screens/wallet/charge_wallet/widgets/buttons/no_button_for_charge.dart';
import 'package:jbus_app/screens/wallet/charge_wallet/widgets/buttons/yes_button_for_charge.dart';
import 'package:jbus_app/screens/wallet/charge_wallet/widgets/text_fields/amount_of_charge_money.dart';
import 'package:jbus_app/services/service_locator.dart';
import 'package:jbus_app/widgets/buttons/rectangular_elevated_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jbus_app/widgets/text/our_text.dart';

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
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return Theme(
                  data: Theme.of(context)
                      .copyWith(dialogBackgroundColor: ourWhite),
                  child: AlertDialog(
                    iconColor: ourWhite,
                    surfaceTintColor: ourWhite,
                    title: Align(
                      alignment: Alignment.center,
                      child: OurText(
                        AppLocalizations.of(context)!.confirmation,
                        color: ourNavey,
                        fontSize: MediaQuery.of(context).size.height * 0.02816901,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    content: Container(
                      constraints:  BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.093896),
                      child: Align(
                        alignment: Alignment.center,
                        child: OurText(
                          '${AppLocalizations.of(context)!.youAreAboutToCharge} ${AmmountOfChargeMoneyTextField.amountOfChargeMoneyController.text} ${AppLocalizations.of(context)!.jod} ${AppLocalizations.of(context)!.to} ${AppLocalizations.of(context)!.yourAccount} ${AppLocalizations.of(context)!.areYouSure}',
                        ),
                      ),
                    ),
                    actions: [
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            YesButtonForCharging(
                              onPressed: () async {
                                sl<ApiService>().chargeWallet({
                                  "paymentMethod": "VISA",
                                  "amount": double.parse(
                                    AmmountOfChargeMoneyTextField
                                        .amountOfChargeMoneyController.text,
                                  ),
                                  "cardNumber": 1234123412341234,
                                  "cvc": "123",
                                  "expirationDate": "2025-01-01"
                                });
                              },
                            ),
                            const NoButtonForCharging(),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              });
        }
      },
    );
  }
}
