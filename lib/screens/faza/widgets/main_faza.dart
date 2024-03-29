import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:jbus_app/screens/faza/pages/history/history.dart';
import 'package:jbus_app/screens/faza/widgets/friends.dart';
import 'package:jbus_app/services/service_locator.dart';
import 'package:jbus_app/widgets/others/app_bar_title_logo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FazaMainPage extends StatefulWidget {
  const FazaMainPage({super.key});

  @override
  State<FazaMainPage> createState() => _FazaMainPageState();
}

class _FazaMainPageState extends State<FazaMainPage> {
  int _selectedIndex = 0;
  late int myId;

  @override
  void initState() {
    super.initState();
    _loadUserData();
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
    return Scaffold(
      appBar: AppBar(
        title: const JbusAppBarTitle(),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.group),
            label: AppLocalizations.of(context)!.friends,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.history),
            label: AppLocalizations.of(context)!.fazaHisrory,
          ),
        
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  List<Widget> get _widgetOptions {
    return [
      const FazaFriendsPage(),
      const FazaHistoryPage(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
