import 'package:json_annotation/json_annotation.dart';
import 'package:jbus_app/data/models/interest_point.dart';

part 'bus_route.g.dart';

@JsonSerializable()
class BusRoute {
  final int id;
  final String? name;
  final String? waypointsGoing;
  final String? waypointsReturning;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int startingPointId;
  final InterestPoint startingPoint;
  final int endingPointId;
  final InterestPoint endingPoint;

  BusRoute({
    required this.id,
    this.name,
    this.waypointsGoing,
    this.waypointsReturning,
    required this.createdAt,
    required this.updatedAt,
    required this.startingPointId,
    required this.startingPoint,
    required this.endingPointId,
    required this.endingPoint,
  });

  factory BusRoute.fromJson(Map<String, dynamic> json) =>
      _$BusRouteFromJson(json);
  Map<String, dynamic> toJson() => _$BusRouteToJson(this);
}
