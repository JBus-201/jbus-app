import 'package:flutter/material.dart';
import 'package:jbus_app/data/api/api_service.dart';
import 'package:jbus_app/data/api/google_service.dart';
import 'package:jbus_app/data/api/realtime-firebase/writers.dart';
import 'package:jbus_app/data/models/friends_create_request.dart';
import 'package:jbus_app/services/service_locator.dart';
import 'package:jbus_app/widgets/buttons/rectangular_elevated_button.dart';
import 'package:jbus_app/widgets/text_fields/text_form_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jbus_app/widgets/warnings/warning.dart';

class AddFriendForFaza extends StatelessWidget {
  const AddFriendForFaza({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final TextEditingController friendIdController = TextEditingController();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Enter your Friend's Id number"),
          Form(
            key: formKey,
            child: OurTextFormField(
                topPadding: 50,
                leftPadding: 70,
                rightPadding: 70,
                bottomPadding: 50,
                showCursor: true,
                textAlign: TextAlign.center,
                icon: Icons.person,
                label: "ID",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return null;
                  }
                  final bool numberValid =
                      RegExp('^[0-9]\$').hasMatch(value.trim());

                  if (numberValid) {
                    return null;
                  } else {
                    return AppLocalizations.of(context)!
                        .sorryPleaseEnterAValidNumberStartsWith07;
                  }
                },
                autocorrect: false,
                enableSuggestions: false,
                keyboardType: const TextInputType.numberWithOptions(),
                maxLength: 5,
                controller: friendIdController),
          ),
          RectangularElevatedButton(
            text: "Send Request",
            onPressed: () {
              if (formKey.currentState!.validate()) {
                //get User id for now 1

                int responderId = 1;
                int friendId = int.parse(friendIdController.text);
                FriendsCreateRequest fr = FriendsCreateRequest(friendId: friendId);
                final res = sl<ApiService>().sendFriendRequest(fr);
                print("Friend's ID as int: $res");
                // writeFazaReqState('p', responderId, friendId).then((value) => {
                //       if (value)
                //         {
                //           showDialog(
                //             context: context,
                //             builder: (context) => const Warning(
                //                 isWarning: false,
                //                 title: "Request Sent Succesfuly",
                //                 description: ""),
                //           ),
                //         }
                //       else
                //         {
                //           showDialog(
                //             context: context,
                //             builder: (context) => const Warning(
                //                 isWarning: true,
                //                 title: "Ops!",
                //                 description: "Somthing went wrong"),
                //           )
                //         }
                //     });
              }
            },
            width: 250,
          )
        ],
      ),
    );
  }
}
