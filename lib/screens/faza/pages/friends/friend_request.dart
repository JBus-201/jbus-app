import 'package:flutter/material.dart';
import 'package:jbus_app/data/api/api_service.dart';
import 'package:jbus_app/data/models/friend_request.dart';
import 'package:jbus_app/services/service_locator.dart';
import 'package:jbus_app/widgets/buttons/rectangular_elevated_button.dart';
import 'package:jbus_app/widgets/warnings/warning.dart';

class FazaFriendRequestsPage extends StatefulWidget {
  const FazaFriendRequestsPage({super.key});

  @override
  _FazaFriendRequestsPageState createState() => _FazaFriendRequestsPageState();
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
            return const Center(
                child: Text(
              'No friend requests,\nSorry, but no one loves you',
              textAlign: TextAlign.center,
            ));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
                child:
                    Text('No friend requests,\nSorry, but no one loves you'));
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
                  title: Text('User ID: ${friend.passenger.id}'),
                  subtitle:
                      Text('User Name: ${friend.passenger.user.name ?? 'N/A'}'),
                  trailing: RectangularElevatedButton(
                    text: 'Accept',
                    padding: 1,
                    height: 15,
                    width: 100,
                    onPressed: () {
                      print('Request Id: ${friend.id}');
                      sl<ApiService>()
                          .confirmFriendRequest(friend.id)
                          .then((value) => {
                                print(
                                    'state code : ${value.response.statusCode}'),
                                if (value.response.statusCode! < 300)
                                  {
                                    showDialog(
                                      context: context,
                                      builder: (context) => const Warning(
                                          isWarning: false,
                                          title: "Great",
                                          description: "You are friends now"),
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
