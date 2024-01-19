import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:jbus_app/data/api/api_service.dart';
import 'package:jbus_app/data/models/friends_create_request.dart';
import 'package:jbus_app/services/service_locator.dart';
import 'package:jbus_app/widgets/buttons/rectangular_elevated_button.dart';
import 'package:jbus_app/widgets/text_fields/text_form_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jbus_app/widgets/warnings/warning.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddFriendForFaza extends StatefulWidget {
  const AddFriendForFaza({super.key});

  @override
  State<AddFriendForFaza> createState() => _AddFriendForFazaState();
}

class _AddFriendForFazaState extends State<AddFriendForFaza> {
  late int myId;
  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  void _loadUserData() async {
    final userRes = sl<SharedPreferences>().getString('user');
    Map<String, dynamic> res = json.decode(userRes!);
    setState(() {
      myId = res['id'];
    });
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final TextEditingController friendIdController = TextEditingController();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Enter your Friend's Id number"),
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
            width: 250,
            onPressed: () {
              if (formKey.currentState!.validate()) {
                int friendId = int.parse(friendIdController.text);
                FriendsCreateRequest fr =
                    FriendsCreateRequest(friendId: friendId);
                final res = sl<ApiService>().sendFriendRequest(fr);
                print("Friend's Respons: ${res}");
                res
                    .then((value) => {
                          print('state code : ${value.response.statusCode}'),
                          if (value.response.statusCode == 201)
                            {
                              showDialog(
                                context: context,
                                builder: (context) => const Warning(
                                    isWarning: false,
                                    title: "Great",
                                    description: "Request Sent Succesfuly"),
                              ),
                            }
                        })
                    // ignore: body_might_complete_normally_catch_error
                    .catchError((error) {
                  showDialog(
                    context: context,
                    builder: (context) => const Warning(
                      isWarning: true,
                      title: "Ops!",
                      description:
                          'An error occurred while processing your request',
                    ),
                  );
                });
              }
            },
          )
        ],
      ),
    );
  }
}
