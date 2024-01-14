import 'package:flutter/material.dart';
import 'package:jbus_app/screens/faza/widgets/friends.dart';
import 'package:jbus_app/widgets/others/app_bar_title_logo.dart';

class FazaMainPage extends StatefulWidget {
  const FazaMainPage({super.key});

  @override
  State<FazaMainPage> createState() => _FazaMainPageState();
}

class _FazaMainPageState extends State<FazaMainPage> {
  int _selectedIndex = 0;
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
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Friends',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on_outlined),
            label: 'Dians',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  static const List<Widget> _widgetOptions = <Widget>[
    FazaFriendsPage(),
    Text('history'),
    Text('dain')
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
