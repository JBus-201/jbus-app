import 'package:flutter/material.dart';
import 'package:jbus_app/screens/wallet/charge_wallet/widgets/buttons/charge_button_with_dialog.dart';
import 'package:jbus_app/screens/wallet/charge_wallet/widgets/text_fields/amount_of_charge_money.dart';
import 'package:jbus_app/screens/wallet/send_money/widgets/buttons/send_button_with_dialog.dart';
import 'package:jbus_app/screens/wallet/send_money/widgets/text_fields/account_number.dart';
import 'package:jbus_app/screens/wallet/send_money/widgets/text_fields/amount_of_money.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChargeWalletScreen extends StatelessWidget {
  const ChargeWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.chargeWallet),
          ),
          body: SafeArea(
            child: CustomScrollView(slivers: [

              SliverList(
                  delegate: SliverChildBuilderDelegate(
                childCount: 1,
                (context, index) => Padding(
                  padding:  EdgeInsets.all(MediaQuery.of(context).size.height * 0.0140845),
                  child: Center(
                      child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              const AmmountOfChargeMoneyTextField(),
                              //const CardToBeSelected(),
                              ChargeButtonWithDialog(formKey: formKey),
                            ],
                          ))),
                ),
              ))
            ]),
          )),
    );
  }
}
