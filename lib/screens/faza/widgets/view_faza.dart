import 'package:flutter/material.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/data/models/fazaa.dart';
import 'package:jbus_app/widgets/buttons/rectangular_elevated_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class FazaInfoViewDialog extends StatelessWidget {
  final Fazaa fazaa;
  final int myId;
  const FazaInfoViewDialog({
    super.key,
    required this.fazaa,
    required this.myId,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("${AppLocalizations.of(context)!.amount}: ${fazaa.amount}",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: fazaa.paid ? ourGreen : ourRed,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            Text('${AppLocalizations.of(context)!.date}: ${fazaa.createdAt.toString().substring(0, 11)}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 15, fontWeight: FontWeight.normal)),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(AppLocalizations.of(context)!.creditor),
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 0.5)),
                      child: fazaa.creditor.profileImage != null
                          ? Image.asset('${fazaa.creditor.profileImage}')
                          : const Icon(Icons.person),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '${AppLocalizations.of(context)!.userId}: ${fazaa.creditor.id}',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '${fazaa.creditor.id != myId ? fazaa.creditor.user.name : AppLocalizations.of(context)!.you}',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
                Column(children: [
                  Text(AppLocalizations.of(context)!.inDebt),
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, border: Border.all(width: 0.5)),
                    child: fazaa.inDebt.profileImage != null
                        ? Image.asset('${fazaa.inDebt.profileImage}')
                        : const Icon(Icons.person),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '${AppLocalizations.of(context)!.userId}: ${fazaa.inDebt.id}',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '${fazaa.inDebt.id != myId ? fazaa.inDebt.user.name : AppLocalizations.of(context)!.you}',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                ]),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            RectangularElevatedButton(
              width: 150,
              onPressed: () {
                Navigator.of(context).pop();
              },
              text: AppLocalizations.of(context)!.ok,
            ),
          ],
        ),
      ),
    );
  }
}
