import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/screens/wallet/card/edit_card.dart';
import 'package:jbus_app/screens/wallet/card/widgets/text_fields/add_card_text_fields/card_number_text_field.dart';
import 'package:jbus_app/screens/wallet/card/widgets/text_fields/edit_card_text_fields/card_holder_name_text_field.dart';
import 'package:jbus_app/screens/wallet/card/widgets/text_fields/edit_card_text_fields/card_number_text_field.dart';
import 'package:jbus_app/screens/wallet/card/widgets/text_fields/edit_card_text_fields/cvv_text_field.dart';
import 'package:jbus_app/screens/wallet/card/widgets/text_fields/edit_card_text_fields/mm_text_field.dart';
import 'package:jbus_app/screens/wallet/card/widgets/text_fields/edit_card_text_fields/yy_text_field.dart';
import 'package:jbus_app/widgets/text/our_text.dart';

// ignore: must_be_immutable
class PaymentCard extends StatelessWidget {
  PaymentCard({
    super.key,
    required this.cardNumber,
    required this.cardHolderName,
    required this.cvv,
    required this.mm,
    required this.yy,
  });

  String cardNumber;
  String cardHolderName;
  String cvv;
  String mm;
  String yy;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0, left: 24, right: 24, bottom: 0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/images/visa.png',
                    scale: 12,
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OurText(
                        AppLocalizations.of(context)!.visa,
                        color: ourNavey,
                        fontWeight: FontWeight.w600,
                      ),
                      OurText(
                        cardNumber,
                        color: ourGray,
                        fontSize: 14,
                      ),
                      OurText(
                        '$mm/$yy    cvv: $cvv',
                        color: ourGray,
                        fontSize: 14,
                      ),
                      OurText(
                        cardHolderName,
                        color: ourGray,
                        fontSize: 14,
                      ),
                    ],
                  ),
                ],
              ),
              OutlinedButton(
                onPressed: () {
                  EditCardHolderNameTextField.cardHolderNameContorller.text =
                      cardHolderName;

                  EditCardNumberTextField.cardNumberController.text =
                      cardNumber;

                  EditCardHolderNameTextField.cardHolderNameContorller.text =
                      cardHolderName;

                  EditCVVTextField.cvvController.text = cvv;
                  EditMMTextField.mmController.text = mm;
                  EditYYTextField.yyController.text = yy;

                  //CardNumberTextField.cardNumberController.text = '5';

                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return EditCardScreen(
                          cardHolderName: cardHolderName,
                          cardNumber: cardNumber,
                          mm: mm,
                          yy: yy,
                          cvv: cvv,
                        );
                      },
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        const begin = Offset(0.0, 1.0);
                        const end = Offset.zero;
                        const curve = Curves.easeInOut;
                        var tween = Tween(begin: begin, end: end)
                            .chain(CurveTween(curve: curve));
                        var offsetAnimation = animation.drive(tween);

                        return SlideTransition(
                          position: offsetAnimation,
                          child: child,
                        );
                      },
                      transitionDuration: const Duration(milliseconds: 500),
                    ),
                  );
                },
                style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: ourNavey)),
                child: Text(
                  AppLocalizations.of(context)!.edit,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: ourNavey,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          const Divider(
            indent: 16,
            endIndent: 16,
            color: ourLightGray,
          ),
        ],
      ),
    );
  }
}
