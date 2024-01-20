import 'package:flutter/material.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/data/api/api_service.dart';
import 'package:jbus_app/data/models/fazaa.dart';
import 'package:jbus_app/data/models/friend.dart';
import 'package:jbus_app/services/service_locator.dart';
import 'package:jbus_app/widgets/others/friendView.dart';

class FazaHistoryPage extends StatefulWidget {
  const FazaHistoryPage({super.key});

  @override
  State<FazaHistoryPage> createState() => _FazaHistoryPageState();
}

class _FazaHistoryPageState extends State<FazaHistoryPage> {
  late Future<List<Fazaa>> fazaHistoryList;

  @override
  void initState() {
    super.initState();
    fazaHistoryList = sl<ApiService>().getFazaas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Fazaa>>(
        future: fazaHistoryList,
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
                  Fazaa fazaa = snapshot.data![index];

                  return FutureBuilder<Friend>(
                    future: sl<ApiService>().getFriendById(fazaa.creditorId),
                    builder: (context, snapshot) {
                      Friend friend = snapshot.data!;
                      if (snapshot.data == null) {
                        return const Center(
                          child: Text("There is no faza's"),
                        );
                      } else {
                        return ListTile(
                          leading: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(width: 0.5)),
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
                          trailing: Text(
                            'Amount\n${fazaa.amount}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: fazaa.paid ? ourGreen : ourRed),
                          ),
                          // subtitle:
                          //     Text('${friend.passenger.user.name ?? 'N/A'}'),
                        );
                      }
                    },
                  );
                });
          }
        },
      ),
    );
  }
}
