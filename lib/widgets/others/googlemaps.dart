import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jbus_app/data/api/google/google-service.dart';
import 'package:jbus_app/themes/bloc/theme_bloc.dart';

class JBusGoogleMaps extends StatefulWidget {
  const JBusGoogleMaps({super.key});

  @override
  State<JBusGoogleMaps> createState() => _JBusGoogleMapsState();
}

class _JBusGoogleMapsState extends State<JBusGoogleMaps> {
  late GoogleMapController _mapController;
  final GoogleMapsApi googleService = GoogleMapsApi();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, themeState) {
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
            if(themeState.thememode == ThemeMode.dark){
              _mapController.setMapStyle(GoogleMapsApi.darkMapString);
            }
            googleService.moveToCurrentLocation(_mapController);
          },
          
          initialCameraPosition: CameraPosition(
            target: GoogleMapsApi
                .curentLocation, // Initial camera position, it will be overridden later
            zoom: 15.0,
          ),
        );});
  }
}