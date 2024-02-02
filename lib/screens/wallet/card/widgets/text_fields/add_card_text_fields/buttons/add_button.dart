import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/screens/wallet/card/bloc/card_bloc.dart';
import 'package:jbus_app/screens/wallet/card/widgets/text_fields/add_card_text_fields/text_fields/card_holder_name_text_field.dart';
import 'package:jbus_app/screens/wallet/card/widgets/text_fields/add_card_text_fields/text_fields/card_number_text_field.dart';
import 'package:jbus_app/screens/wallet/card/widgets/text_fields/add_card_text_fields/text_fields/cvv_text_field.dart';
import 'package:jbus_app/screens/wallet/card/widgets/text_fields/add_card_text_fields/text_fields/mm_text_field.dart';
import 'package:jbus_app/screens/wallet/card/widgets/text_fields/add_card_text_fields/text_fields/yy_text_field.dart';
import 'package:jbus_app/screens/wallet/wallet/bloc/wallet_bloc.dart';
import 'package:jbus_app/screens/wallet/wallet/wallet.dart';
import 'package:jbus_app/screens/wallet/wallet/widgets/payment_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    super.key,
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          final walletBloc = BlocProvider.of<WalletBloc>(context);
          walletBloc.add(AddCardEvent(
              paymentCard: PaymentCard(
                  cardNumber: CardNumberTextField.cardNumberController.text,
                  cardHolderName:
                      CardHolderNameTextField.cardHolderNameContorller.text,
                  cvv: CVVTextField.cvvController.text,
                  mm: MMTextField.mmController.text,
                  yy: YYTextField.yyController.text)));

          CardNumberTextField.cardNumberController.text = '';

          CardHolderNameTextField.cardHolderNameContorller.text = '';

          CVVTextField.cvvController.text = '';

          MMTextField.mmController.text = '';

          YYTextField.yyController.text = '';

          final cardBloc = BlocProvider.of<CardBloc>(context);

          cardBloc.add(const ChangeCardHolderNameEvent(cardHolderName: ''));
          cardBloc.add(const ChangeCardNumberEvent(cardNumber: ''));
          cardBloc.add(const ChangeCVVEvent(cvv: ''));
          cardBloc.add(const ChangeMMEvent(mm: ''));
          cardBloc.add(const ChangeYYEvent(yy: ''));

          Navigator.pop(
            context,
            MaterialPageRoute(
              builder: (context) => const WalletScreen(),
            ),
          );
        }
      },
      style: OutlinedButton.styleFrom(
          backgroundColor: ourNavey,
          fixedSize: const Size(111, 35),
          side: const BorderSide(
            color: ourNavey,
          )),
      child: Text(
        AppLocalizations.of(context)!.add,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: ourWhite,
        ),
      ),
    );
  }
}
