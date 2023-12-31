import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/data/api/google_service.dart';
import 'package:jbus_app/data/api/realtime-firebase/lestiners.dart';
import 'package:jbus_app/data/api/realtime-firebase/writers.dart';
import 'package:jbus_app/screens/dashbourd/buttons/drawer.dart';
import 'package:jbus_app/screens/dashbourd/buttons/end_drawer.dart';
import 'package:jbus_app/screens/dashbourd/widgets/bottomsheet.dart';
import 'package:jbus_app/screens/drawer/main_drawer/main_drawer.dart';
import 'package:jbus_app/screens/drawer_notification/notification_drawer.dart';
import 'package:jbus_app/themes/appbar_style.dart';
import 'package:jbus_app/themes/bloc/theme_bloc.dart';
import 'package:jbus_app/widgets/others/app_bar_title_logo.dart';

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
    listenFazaReqState(1, 2);
    listenFazaNeed(1);
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
      body: Stack(children: [
        BlocBuilder<ThemeBloc, ThemeState>(builder: (context, themeState) {
          return GoogleMap(
            trafficEnabled: true,
            buildingsEnabled: true,
            myLocationEnabled: true,
            rotateGesturesEnabled: true,
            zoomControlsEnabled: false,
            myLocationButtonEnabled: false,
            onMapCreated: (controller) {
              _mapController = controller;
              // ignore: unrelated_type_equality_checks
              if (themeState.thememode == ThemeMode.dark) {
                _mapController.setMapStyle(GoogleMapsApi.darkMapString);
              }
              googleService.moveToCurrentLocation(_mapController);
            },
            initialCameraPosition: CameraPosition(
              target: GoogleMapsApi
                  .curentLocation, // Initial camera position, it will be overridden later
              zoom: 15.0,
            ),
          );
        }),
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
            // googleService.moveToCurrentLocation(_mapController);
          }),
    );
  }
}
