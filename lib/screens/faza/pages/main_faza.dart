import 'package:flutter/material.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/screens/faza/pages/addfriend.dart';
import 'package:jbus_app/screens/faza/pages/friend_request.dart';
import 'package:jbus_app/widgets/others/app_bar_title_logo.dart';

class FazaMainPage extends StatefulWidget {
  const FazaMainPage({super.key});

  @override
  State<FazaMainPage> createState() => _FazaMainPageState();
}

class _FazaMainPageState extends State<FazaMainPage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitleLogo(),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Friends',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_add_alt_1_rounded),
            label: 'Friend Requests',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group_add_outlined),
            label: 'Add Friends',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: ourBlue,
        onTap: _onItemTapped,
      ),
    );
  }

  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    FazaFriendRequestPage(),
    AddFriendForFaza()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
