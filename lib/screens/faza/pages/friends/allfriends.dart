import 'package:flutter/material.dart';
import 'package:jbus_app/data/api/api_service.dart';
import 'package:jbus_app/data/models/friend.dart';
import 'package:jbus_app/services/service_locator.dart';
import 'package:jbus_app/widgets/others/friendView.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AllFriendsPage extends StatefulWidget {
  const AllFriendsPage({super.key});

  @override
  State<AllFriendsPage> createState() => _AllFriendsPageState();
}

class _AllFriendsPageState extends State<AllFriendsPage> {
  late Future<List<Friend>> friendRequests;

  @override
  void initState() {
    super.initState();
    friendRequests = sl<ApiService>().getFriends();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Friend>>(
        future: friendRequests,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            print('Error: ${snapshot.error}');
            return Center(
                child: Text(
              AppLocalizations.of(context)!.noFriendsMsg,
              textAlign: TextAlign.center,
            ));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
                child: Text(
              AppLocalizations.of(context)!.noFriendsMsg,
              textAlign: TextAlign.center,
            ));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Friend friend = snapshot.data![index];

                return ListTile(
                  leading: Container(
                    height: MediaQuery.of(context).size.height * 0.05868,
                    width: MediaQuery.of(context).size.height * 0.05868,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, border: Border.all(width: MediaQuery.of(context).size.height * 0.00058685)),
                    child: friend.profileImage != null
                        ? Image.asset('${friend.profileImage}')
                        : const Icon(Icons.person),
                  ),
                  title: Text('${friend.user.name}'),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => FriendViewDialog(
                              id: friend.id,
                              name: friend.user.name,
                              profileImage: friend.profileImage,
                            ));
                  },
                  // subtitle:
                  //     Text('${friend.passenger.user.name ?? 'N/A'}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
