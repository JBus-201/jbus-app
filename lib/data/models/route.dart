import 'package:json_annotation/json_annotation.dart';
import 'package:jbus_app/data/models/interest_point.dart';

part 'route.g.dart';

@JsonSerializable()
class Route {
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

  Route({
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

  factory Route.fromJson(Map<String, dynamic> json) => _$RouteFromJson(json);
  Map<String, dynamic> toJson() => _$RouteToJson(this);
}
