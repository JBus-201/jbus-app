import 'package:flutter/material.dart';
import 'package:jbus_app/screens/faza/pages/addfriend.dart';
import 'package:jbus_app/screens/faza/pages/friend_request.dart';
import 'package:jbus_app/screens/faza/pages/payers.dart';

class FazaFriendsPage extends StatelessWidget {
  const FazaFriendsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: TabBar(
          tabs: [
            Tab(
              icon: Icon(Icons.group),
              text: "All",
            ),
            Tab(
              icon: Icon(Icons.group_add_outlined),
              text: "Requests",
            ),
            Tab(
              icon: Icon(Icons.person_add_alt_1_rounded),
              text: "Add",
            ),
          ],
        ),
        body: TabBarView(
          children: [
            FazaPayersPage(),
            FazaFriendRequestPage(),
            AddFriendForFaza(),
          ],
        ),
      ),
    );
  }
}
