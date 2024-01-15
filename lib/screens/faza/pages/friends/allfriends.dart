import 'package:flutter/material.dart';
import 'package:jbus_app/data/api/api_service.dart';
import 'package:jbus_app/data/models/friends.dart';
import 'package:jbus_app/services/service_locator.dart';

class AllFriendsPage extends StatefulWidget {
  const AllFriendsPage({super.key});

  @override
  _AllFriendsPageState createState() => _AllFriendsPageState();
}

class _AllFriendsPageState extends State<AllFriendsPage> {
  late Future<List<Friends>> friendRequests;

  @override
  void initState() {
    super.initState();
    friendRequests = sl<ApiService>().getFriends();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Friends>>(
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
                child:
                    Text('No friends,\nSorry, but you are lonely'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Friends friend = snapshot.data![index];

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
                  title: Text('${friend.passenger.user.name}'),
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
