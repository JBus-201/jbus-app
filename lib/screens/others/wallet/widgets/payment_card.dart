import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PaymentCard extends StatelessWidget {
  const PaymentCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              Text(
                AppLocalizations.of(context)!.visa,
              ),
              Text(
                //'•••• 2974',
                AppLocalizations.of(context)!.error,

                style: const TextStyle(
                  color: Color.fromARGB(255, 30, 75, 124),
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 120.7,
          ),

          OutlinedButton(
            onPressed: () {},
            //  {
            //   showDialog(
            //     context: context,
            //     builder: (context) => const Warning(
            //         title: "Feature Not Implemented",
            //         description:
            //             "This feature is under development and will be available soon."),
            //   );
            // },
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Color.fromARGB(255, 183, 183, 183)),
            ),
            child: Text(
              AppLocalizations.of(context)!.edit,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 30, 75, 124),
              ),
            ),
          ),
          // ElevatedButton(
          //   style: ElevatedButton.styleFrom(
          //     backgroundColor: Colors.transparent,
          //     shadowColor: Colors.transparent,
          //     surfaceTintColor: Colors.transparent,
          //     fixedSize: const Size(80, 24),
          //     padding: EdgeInsets.zero,
          //     shape: const LinearBorder(),
          //   ),

          //   onPressed: () {},
          // ),
        ],
      ),
    );
  }
}
