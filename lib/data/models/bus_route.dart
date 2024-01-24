import 'package:jbus_app/data/models/predefined_stops.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:jbus_app/data/models/interest_point.dart';

part 'bus_route.g.dart';

@JsonSerializable(
  explicitToJson: true,
  includeIfNull: false,
)
class BusRoute {
  final int id;
  final String? name;
  final int fee;
  final String? waypointsGoing;
  final String? waypointsReturning;
  final DateTime createdAt;
  final DateTime updatedAt;
  final InterestPoint startingPoint;
  final InterestPoint endingPoint;
  final PredefinedStops? predefinedStops;

  BusRoute({
    required this.id,
    this.name,
    required this.fee,
    required this.waypointsGoing,
    required this.waypointsReturning,
    required this.createdAt,
    required this.updatedAt,
    required this.startingPoint,
    required this.endingPoint,
    this.predefinedStops,
  });

  factory BusRoute.fromJson(Map<String, dynamic> json) =>
      _$BusRouteFromJson(json);
  Map<String, dynamic> toJson() => _$BusRouteToJson(this);
}
