import 'package:flutter/material.dart';
import 'package:jbus_app/screens/faza/pages/friends/addfriend.dart';
import 'package:jbus_app/screens/faza/pages/friends/allfriends.dart';
import 'package:jbus_app/screens/faza/pages/friends/friend_request.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jbus_app/widgets/others/app_bar_title_logo.dart';

class NotificationFazaFriendsPage extends StatelessWidget {
  const NotificationFazaFriendsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const JbusAppBarTitle(),
      ),
      body: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: TabBar(
            tabs: [
              Tab(
                icon: const Icon(Icons.group),
                text: AppLocalizations.of(context)!.allFriends,
              ),
              Tab(
                icon: const Icon(Icons.group_add_outlined),
                text: AppLocalizations.of(context)!.friendRequests,
              ),
              Tab(
                icon: const Icon(Icons.person_add_alt_1_rounded),
                text: AppLocalizations.of(context)!.addFriend,
              ),
            ],
          ),
          body: const TabBarView(
            children: [
              AllFriendsPage(),
              FazaFriendRequestsPage(),
              AddFriendForFaza(),
            ],
          ),
        ),
      ),
    );
  }
}
