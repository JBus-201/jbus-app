import 'package:flutter/material.dart';
import 'package:jbus_app/data/models/bus_route.dart';

class TripSettup extends StatefulWidget {
  final BusRoute route;
  const TripSettup({
    super.key,
    required this.route,
  });

  @override
  State<TripSettup> createState() => _TripSettupState();
}

class _TripSettupState extends State<TripSettup> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
