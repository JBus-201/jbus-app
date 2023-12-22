import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/screens/dashbourd/buttons/drawer.dart';
import 'package:jbus_app/screens/dashbourd/buttons/end_drawer.dart';
import 'package:jbus_app/screens/drawer/main_drawer/main_drawer.dart';
import 'package:jbus_app/screens/drawer_notification/notification_drawer.dart';
import 'package:jbus_app/themes/appbar_style.dart';
import 'package:jbus_app/themes/bloc/theme_bloc.dart';

class Dashbourd extends StatefulWidget {
  const Dashbourd({super.key});

  @override
  State<Dashbourd> createState() => _DashbourdState();
}

class _DashbourdState extends State<Dashbourd> {
  late GoogleMapController mapController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>(); 
  final LatLng _center = const LatLng(37.7749, -122.4194);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ourBlack.withOpacity(0),
        title: Text("JBus"),
        flexibleSpace: const AppBarStyle(),leading: endDrawerButton(onTap:() {
              _scaffoldKey.currentState!.openDrawer();
            } ,),
        actions: [
          drawerButton(onTap: () {
              _scaffoldKey.currentState!.openEndDrawer();
            })
        ],
      ),
      drawerEnableOpenDragGesture: true,
      endDrawerEnableOpenDragGesture: true,
      drawer: const NotificationsDrawer(),


      endDrawer:const MainDrawer(),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(target: _center, zoom: 11.0)),
          floatingActionButton: FloatingActionButton(onPressed:() {
                  final themeBloc = BlocProvider.of<ThemeBloc>(context);
                  final currentTheme = BlocProvider.of<ThemeBloc>(context).state.thememode;
                  currentTheme == ThemeMode.light ? themeBloc.add(SwitchToDarkThemeEvent()) : themeBloc.add(SwitchToLightThemeEvent());
          }),
    );
  }
}
