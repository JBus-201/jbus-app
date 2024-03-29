import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/screens/wallet/card/bloc/card_bloc.dart';
import 'package:jbus_app/screens/wallet/card/edit_card.dart';
import 'package:jbus_app/screens/wallet/card/widgets/text_fields/edit_card_text_fields/text_fields/card_holder_name_text_field.dart';
import 'package:jbus_app/screens/wallet/card/widgets/text_fields/edit_card_text_fields/text_fields/card_number_text_field.dart';
import 'package:jbus_app/screens/wallet/card/widgets/text_fields/edit_card_text_fields/text_fields/cvv_text_field.dart';
import 'package:jbus_app/screens/wallet/card/widgets/text_fields/edit_card_text_fields/text_fields/mm_text_field.dart';
import 'package:jbus_app/screens/wallet/card/widgets/text_fields/edit_card_text_fields/text_fields/yy_text_field.dart';
import 'package:jbus_app/screens/wallet/wallet/bloc/wallet_bloc.dart';

import 'package:jbus_app/widgets/text/our_text.dart';

// ignore: must_be_immutable
class PaymentCard extends StatelessWidget implements Equatable {
  PaymentCard(
      {super.key,
      required this.cardNumber,
      required this.cardHolderName,
      required this.cvv,
      required this.mm,
      required this.yy,
      this.icon = Icons.check_box_outline_blank_outlined});

  String cardNumber;
  String cardHolderName;
  String cvv;
  String mm;
  String yy;
  IconData icon;

  factory PaymentCard.fromJson(Map<String, dynamic> json) {
    return PaymentCard(
      cardNumber: json['cardNumber'],
      cardHolderName: json['cardHolderName'],
      cvv: json['cvv'],
      mm: json['mm'],
      yy: json['yy'],
    );
  }

  Map<String, dynamic> toJson() => {
        'cardNumber': cardNumber,
        'cardHolderName': cardHolderName,
        'cvv': cvv,
        'mm': mm,
        'yy': yy,
      };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.028169, left: MediaQuery.of(context).size.height * 0.028169, right: MediaQuery.of(context).size.height * 0.028169, bottom: 0),
      //child: InkWell(
        //onTap: () {},
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/images/visa.png',
                      scale: MediaQuery.of(context).size.height * 0.01408451,
                    ),
                     SizedBox(
                      width: MediaQuery.of(context).size.height * 0.03521127,
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
                          fontSize: MediaQuery.of(context).size.height * 0.01643192,
                        ),
                        OurText(
                          '$mm/$yy    ${AppLocalizations.of(context)!.cvvc} $cvv',
                          color: ourGray,
                          fontSize: MediaQuery.of(context).size.height * 0.01643192,
                        ),
                        OurText(
                          cardHolderName,
                          color: ourGray,
                          fontSize: MediaQuery.of(context).size.height * 0.01643192,
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
                    style:  TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.01995305,
                      fontWeight: FontWeight.w500,
                      color: ourNavey,
                    ),
                  ),
                ),
              ],
            ),
             SizedBox(
              height: MediaQuery.of(context).size.height * 0.02816901,
            ),
             Divider(
              indent: MediaQuery.of(context).size.height * 0.01877934,
              endIndent: MediaQuery.of(context).size.height * 0.01877934,
              color: ourLightGray,
            ),
          ],
        //),
      ),
    );
  }

  @override
  List<Object?> get props => [cardNumber, cardHolderName, cvv, mm, yy];

  @override
  bool? get stringify => true;
}
