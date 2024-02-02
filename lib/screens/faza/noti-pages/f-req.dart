import 'package:flutter/material.dart';
import 'package:jbus_app/data/api/api_service.dart';
import 'package:jbus_app/data/models/friend_request.dart';
import 'package:jbus_app/services/service_locator.dart';
import 'package:jbus_app/widgets/buttons/rectangular_elevated_button.dart';
import 'package:jbus_app/widgets/others/app_bar_title_logo.dart';
import 'package:jbus_app/widgets/warnings/warning.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NotificationFazaFriendRequestsPage extends StatefulWidget {
  const NotificationFazaFriendRequestsPage({super.key});

  @override
  State<NotificationFazaFriendRequestsPage> createState() => _NotificationFazaFriendRequestsPageState();
}

class _NotificationFazaFriendRequestsPageState extends State<NotificationFazaFriendRequestsPage> {
  late Future<List<FriendRequest>> friendRequests;

  @override
  void initState() {
    super.initState();
    friendRequests = sl<ApiService>().getFriendRequests();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const JbusAppBarTitle(),
      ),
      body: FutureBuilder<List<FriendRequest>>(
        future: friendRequests,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            print('Error: ${snapshot.error}');
            return Center(
                child: Text(
              AppLocalizations.of(context)!.noFriendReqMsg,
              textAlign: TextAlign.center,
            ));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
                child: Text(AppLocalizations.of(context)!.noFriendReqMsg,
                    textAlign: TextAlign.center));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                FriendRequest friend = snapshot.data![index];

                return ListTile(
                  leading: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, border: Border.all(width: 0.5)),
                    child: friend.passenger.profileImage != null
                        ? Image.asset('${friend.passenger.profileImage}')
                        : const Icon(Icons.person),
                  ),
                  title: Text(
                      '${AppLocalizations.of(context)!.userId}: ${friend.passenger.id}'),
                  subtitle: Text(friend.passenger.user.name ?? 'N/A'),
                  trailing: RectangularElevatedButton(
                    text: AppLocalizations.of(context)!.accept,
                    fontSize: 15,
                    padding: 1,
                    height: 15,
                    width: 100,
                    onPressed: () {
                      print('Request Id: ${friend.id}');
                      sl<ApiService>()
                          .confirmFriendRequest(friend.passenger.id)
                          .then((value) => {
                                print(
                                    'state code : ${value.response.statusCode}'),
                                if (value.response.statusCode! < 300)
                                  {
                                    showDialog(
                                      context: context,
                                      builder: (context) => Warning(
                                          isWarning: false,
                                          title: AppLocalizations.of(context)!
                                              .great,
                                          description:
                                              AppLocalizations.of(context)!
                                                  .youAreFriendsMsg),
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
                            description:
                                AppLocalizations.of(context)!.somthingWrong,
                          ),
                        );
                      });
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
