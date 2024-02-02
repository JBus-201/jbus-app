import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/screens/wallet/card/bloc/card_bloc.dart';
import 'package:jbus_app/widgets/text/our_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CardContainerForAdding extends StatelessWidget {
  const CardContainerForAdding({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            ourLightBlue,
            ourBlack,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        image: DecorationImage(
          image: const AssetImage(
            'assets/images/visa_background.png',
          ),
          fit: BoxFit.fill,
          colorFilter: ColorFilter.mode(
            ourLightBlue50.withOpacity(0.08),
            BlendMode.srcOver,
          ),
        ),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Card(
        color: Colors.transparent,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 16.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
          side: BorderSide.none,
        ),
        margin: const EdgeInsets.all(6.0),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: BlocBuilder<CardBloc, CardState>(
            builder: (context, state) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OurText(
                    AppLocalizations.of(context)!.visaGold,
                    color: ourWhite,
                    fontSize: 35,
                    fontWeight: FontWeight.w700,
                    fontFamily: "PTSerif",
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 6,
                      ),
                      Image.asset(
                        'assets/images/chip.png',
                        scale: 4.5,
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Image.asset(
                        'assets/images/wifi.png',
                        scale: 3,
                      ),
                      const SizedBox(
                        width: 190,
                      ),
                      Image.asset(
                        'assets/images/map.png',
                        scale: 3.2,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  OurText(
                    state.cardNumber,
                    color: ourWhite,
                    fontSize: 28,
                    //fontFamily: "PTSerif",
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 60,
                      ),
                      OurText(
                        '${state.mm}/${state.yy}',
                        color: ourWhite,
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      OurText(
                        state.cvv,
                        color: ourWhite,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OurText(
                        state.cardHolderName,
                        color: ourWhite,
                        fontFamily: "PTSerif",
                      ),
                      Image.asset(
                        'assets/images/visa_text.png',
                        scale: 3,
                      ),
                    ],
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}