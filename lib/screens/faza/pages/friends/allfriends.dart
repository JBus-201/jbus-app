import 'package:flutter/material.dart';
import 'package:jbus_app/data/api/api_service.dart';
import 'package:jbus_app/data/models/passenger.dart';
import 'package:jbus_app/services/service_locator.dart';
import 'package:jbus_app/widgets/others/friendView.dart';

class AllFriendsPage extends StatefulWidget {
  const AllFriendsPage({super.key});

  @override
  _AllFriendsPageState createState() => _AllFriendsPageState();
}

class _AllFriendsPageState extends State<AllFriendsPage> {
  late Future<List<Passenger>> friendRequests;

  @override
  void initState() {
    super.initState();
    friendRequests = sl<ApiService>().getFriends();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Passenger>>(
        future: friendRequests,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            print('Error: ${snapshot.error}');
            return const Center(
                child: Text(
              'No friends,\nSorry, but you are lonely',
              textAlign: TextAlign.center,
            ));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
                child: Text('No friends,\nSorry, but you are lonely'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Passenger friend = snapshot.data![index];

                return ListTile(
                  leading: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, border: Border.all(width: 0.5)),
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
