import 'package:flutter/material.dart';
import 'package:jbus_app/data/api/api_service.dart';
import 'package:jbus_app/data/models/friend_request.dart';
import 'package:jbus_app/services/service_locator.dart';
import 'package:jbus_app/widgets/buttons/rectangular_elevated_button.dart';
import 'package:jbus_app/widgets/warnings/warning.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FazaFriendRequestsPage extends StatefulWidget {
  const FazaFriendRequestsPage({super.key});

  @override
  State<FazaFriendRequestsPage> createState() => _FazaFriendRequestsPageState();
}

class _FazaFriendRequestsPageState extends State<FazaFriendRequestsPage> {
  late Future<List<FriendRequest>> friendRequests;

  @override
  void initState() {
    super.initState();
    friendRequests = sl<ApiService>().getFriendRequests();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    height: MediaQuery.of(context).size.height * 0.05868,
                    width: MediaQuery.of(context).size.height * 0.05868,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, border: Border.all(width: MediaQuery.of(context).size.height * 0.00058685)),
                    child: friend.passenger.profileImage != null
                        ? Image.asset('${friend.passenger.profileImage}')
                        : const Icon(Icons.person),
                  ),
                  title: Text('${AppLocalizations.of(context)!.userId}: ${friend.passenger.id}'),
                  subtitle: Text(friend.passenger.user.name ?? 'N/A'),
                  trailing: RectangularElevatedButton(
                    text: AppLocalizations.of(context)!.accept,
                    fontSize: MediaQuery.of(context).size.height * 0.0176563,
                    padding: MediaQuery.of(context).size.height * 0.00117371,
                    height: MediaQuery.of(context).size.height * 0.01760563,
                    width: MediaQuery.of(context).size.height * 0.11737089,
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
                                          title: AppLocalizations.of(context)!.great,
                                          description: AppLocalizations.of(context)!.youAreFriendsMsg),
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
