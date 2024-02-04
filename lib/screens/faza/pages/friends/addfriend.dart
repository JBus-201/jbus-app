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
          Text(AppLocalizations.of(context)!.enterId),
          Form(
            key: formKey,
            child: OurTextFormField(
                topPadding: MediaQuery.of(context).size.height * 0.0586545,
                leftPadding: MediaQuery.of(context).size.height * 0.08215962,
                rightPadding: MediaQuery.of(context).size.height * 0.08215962,
                bottomPadding: MediaQuery.of(context).size.height * 0.0586545,
                showCursor: true,
                textAlign: TextAlign.center,
                icon: Icons.person,
                label: AppLocalizations.of(context)!.id,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return null;
                  }
                  final bool numberValid =
                      RegExp('^[0-9]+\$').hasMatch(value.trim());

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
            text: AppLocalizations.of(context)!.sendRequest,
            width: MediaQuery.of(context).size.height * 0.29342723,
            onPressed: () {
              if (formKey.currentState!.validate()) {
                int friendId = int.parse(friendIdController.text);
                FriendsCreateRequest fr =
                    FriendsCreateRequest(friendId: friendId);
                final res = sl<ApiService>().sendFriendRequest(fr);
                print("Friend's Respons: $res");
                res
                    .then((value) => {
                          print('state code : ${value.response.statusCode}'),
                          if (value.response.statusCode == 201)
                            {
                              showDialog(
                                context: context,
                                builder: (context) => Warning(
                                    isWarning: false,
                                    title: AppLocalizations.of(context)!.great,
                                    description: AppLocalizations.of(context)!
                                        .requestSentSuccesfuly),
                              ),
                            }
                        })
                    // ignore: body_might_complete_normally_catch_error
                    .catchError((error) {
                  showDialog(
                    context: context,
                    builder: (context) => Warning(
                      isWarning: true,
                      title: AppLocalizations.of(context)!.ops,
                      description: AppLocalizations.of(context)!.somthingWrong,
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
