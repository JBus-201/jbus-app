import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:jbus_app/constants/colors/gradients.dart';
import 'package:jbus_app/data/api/api_service.dart';
import 'package:jbus_app/data/api/realtime-firebase/writers.dart';
import 'package:jbus_app/data/models/bus_route.dart';
import 'package:jbus_app/data/models/friend.dart';
import 'package:jbus_app/screens/faza/pages/wating.dart';
import 'package:jbus_app/services/service_locator.dart';
import 'package:jbus_app/widgets/buttons/rectangular_elevated_button.dart';
import 'package:jbus_app/widgets/warnings/warning.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FazaRequestBT extends StatelessWidget {
  final int totalAmountNeeded;
  final BusRoute route;
  const FazaRequestBT({
    super.key,
    required this.totalAmountNeeded,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return RectangularElevatedButton(
        gradient: redButtonGradient,
        width: MediaQuery.of(context).size.height * 0.152582,
        text: AppLocalizations.of(context)!.fazaa,
        onPressed: () {
          sl<ApiService>().isPassengerFazaaAble().then((value) => {
                if (value.response.statusCode! == 200)
                  {
                    sl<ApiService>().getFriends().then((List<Friend> friends) {
                      if (friends.isNotEmpty) {
                        final userRes =
                            sl<SharedPreferences>().getString('user');
                        Map<String, dynamic> res = json.decode(userRes!);

                        int myId = res['id'];
                        sl<ApiService>()
                            .requestFazaa(totalAmountNeeded)
                            .then((value) => {
                                  if (value.response.statusCode == 200)
                                    {
                                      writeNeedFaza(myId, true).then((value) =>
                                          {
                                            if (value)
                                              {
                                                writeFazaTotalAmountNeeded(
                                                    myId, totalAmountNeeded),
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            FazaWaitingPage(
                                                                route: route)))
                                              }
                                            else
                                              {
                                                showDialog(
                                                  context: context,
                                                  builder: (context) => Warning(
                                                      isWarning: true,
                                                      title:
                                                          AppLocalizations.of(
                                                                  context)!
                                                              .ops,
                                                      description:
                                                          AppLocalizations.of(
                                                                  context)!
                                                              .somthingWrong),
                                                ).then((value) =>
                                                    Navigator.pop(context))
                                              }
                                          })
                                    }
                                });
                        print('Faza Request My ID: $myId');
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) => Warning(
                              isWarning: true,
                              title: AppLocalizations.of(context)!.ops,
                              description: AppLocalizations.of(context)!
                                  .fazaNoFriendMsg),
                        );
                      }
                    })
                  }
                else
                  {
                    showDialog(
                      context: context,
                      builder: (context) => Warning(
                          isWarning: true,
                          title: AppLocalizations.of(context)!.ops,
                          description:
                              AppLocalizations.of(context)!.somthingWrong),
                    ).then((value) => Navigator.pop(context))
                  }
              });
        });
  }
}
