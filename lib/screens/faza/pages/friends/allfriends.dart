import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jbus_app/data/api/api_service.dart';
import 'package:jbus_app/data/models/friends.dart';
import 'package:jbus_app/services/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AllFriendsPage extends StatefulWidget {
  const AllFriendsPage({super.key});

  @override
  State<AllFriendsPage> createState() => _AllFriendsPageState();
}

class _AllFriendsPageState extends State<AllFriendsPage> {
  late int myId;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadUserData();
    final Future<List<Friends>> friendsList = sl<ApiService>().getFriends();
  }

  void _loadUserData() async {
    final userRes = sl<SharedPreferences>().getString('user');
    Map<String, dynamic> res = json.decode(userRes!);
    setState(() {
      myId = res['id'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
