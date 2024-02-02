import 'package:flutter/material.dart';
import 'package:jbus_app/screens/wallet/send_money/widgets/buttons/send_button_with_dialog.dart';
import 'package:jbus_app/screens/wallet/send_money/widgets/text_fields/account_number.dart';
import 'package:jbus_app/screens/wallet/send_money/widgets/text_fields/amount_of_money.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SendMoneyScreen extends StatelessWidget {
  const SendMoneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.sendMoney),
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
                              const AmmountOfMoneyTextField(),
                              const AccountNumberTextField(),
                              SendButtonWithDialog(formKey: formKey),
                            ],
                          ))),
                ),
              ))
            ]),
          )),
    );
  }
}
