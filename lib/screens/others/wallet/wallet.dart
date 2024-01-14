import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jbus_app/screens/others/wallet/widgets/navey_wallet_container.dart';
import 'package:jbus_app/screens/others/wallet/widgets/payment_card.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const NaveyWalletContainer(),
            const SizedBox(
              height: 14,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      right: 8, top: 20.0, bottom: 20, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.cards,
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          //color: Color.fromARGB(255, 58, 58, 58),
                          color: Color.fromARGB(255, 30, 75, 124),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        //{
                        //   showDialog(
                        //     context: context,
                        //     builder: (context) => const Warning(
                        //         title: "Feature Not Implemented",
                        //         description:
                        //             "This feature is under development and will be available soon."),
                        //   );
                        // },
                        // style: TextButton.styleFrom(

                        // ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.add,
                              style: const TextStyle(
                                fontSize: 20,
                                //color: Color.fromARGB(255, 58, 58, 58),
                                color: Color.fromARGB(255, 30, 75, 124),
                              ),
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            const Icon(
                              Icons.add,
                              //color: Color.fromARGB(255, 58, 58, 58),
                              color: Color.fromARGB(255, 30, 75, 124),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                const PaymentCard(),

                const SizedBox(
                  height: 30,
                ),
                const Divider(
                  indent: 16,
                  endIndent: 16,
                  color: Color.fromARGB(255, 227, 227, 227),
                ),
                const SizedBox(
                  height: 65,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Icon(Icons.check),
                    Image.asset(
                      'assets/images/protected.png',
                      scale: 16,
                      color: const Color.fromARGB(255, 30, 75, 124),
                    ),

                    const SizedBox(
                      width: 14,
                    ),
                    Text(
                      AppLocalizations.of(context)!
                          .yourPaymentDataIsStoredSecurely,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 30, 75, 124),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
