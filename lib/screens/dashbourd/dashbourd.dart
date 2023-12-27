import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/data/api/google-service.dart';
import 'package:jbus_app/screens/dashbourd/buttons/drawer.dart';
import 'package:jbus_app/screens/dashbourd/buttons/end_drawer.dart';
import 'package:jbus_app/screens/dashbourd/widgets/bottomsheet.dart';
import 'package:jbus_app/screens/drawer/main_drawer/main_drawer.dart';
import 'package:jbus_app/screens/drawer_notification/notification_drawer.dart';
import 'package:jbus_app/themes/appbar_style.dart';
import 'package:jbus_app/themes/bloc/theme_bloc.dart';
import 'package:jbus_app/widgets/others/app_bar_title_logo.dart';
import 'package:jbus_app/widgets/others/googlemaps.dart';

class Dashbourd extends StatefulWidget {
  const Dashbourd({super.key});

  @override
  State<Dashbourd> createState() => _DashbourdState();
}

class _DashbourdState extends State<Dashbourd> {
  late GoogleMapController _mapController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GoogleMapsApi googleService = GoogleMapsApi();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(115.0),
        child: AppBar(
          elevation: 0,
          backgroundColor: ourBlack.withOpacity(0),
          title: const AppBarTitleLogo(),
          flexibleSpace: const AppBarStyle(),
          leading: CustomEndDrawerButton(
            onTap: () {
              _scaffoldKey.currentState!.openDrawer();
            },
          ),
          actions: [
            CustomDrawerButton(onTap: () {
              _scaffoldKey.currentState!.openEndDrawer();
            })
          ],
        ),
      ),
      drawerEnableOpenDragGesture: true,
      endDrawerEnableOpenDragGesture: true,
      drawer: const NotificationsDrawer(),
      endDrawer: const MainDrawer(),
      body: const Stack(children: [
        JBusGoogleMaps(),
        BottomSearchSheet()
      ]),
      floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          child: const Icon(Icons.location_searching_rounded),
          onPressed: () {
            // final themeBloc = BlocProvider.of<ThemeBloc>(context);
            // final currentTheme =
            //     BlocProvider.of<ThemeBloc>(context).state.thememode;
            // currentTheme == ThemeMode.light
            //     ? themeBloc.add(SwitchToDarkThemeEvent())
            //     : themeBloc.add(SwitchToLightThemeEvent());
            googleService.moveToCurrentLocation(_mapController);
          }),
    );
  }
}
