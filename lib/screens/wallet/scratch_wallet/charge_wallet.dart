import 'package:flutter/material.dart';
import 'package:jbus_app/screens/wallet/scratch_wallet/widgets/buttons/charge_button_with_dialog.dart';
import 'package:jbus_app/screens/wallet/scratch_wallet/widgets/text_fields/amount_of_charge_money.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ScratshCarkWallet extends StatelessWidget {
  const ScratshCarkWallet({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.scratchCard),
          ),
          body: SafeArea(
            child: CustomScrollView(slivers: [

              SliverList(
                  delegate: SliverChildBuilderDelegate(
                childCount: 1,
                (context, index) => Padding(
                  padding: const EdgeInsets.all(12),
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
