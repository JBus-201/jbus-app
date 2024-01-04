import 'package:jbus_app/data/models/point.dart';
import 'package:json_annotation/json_annotation.dart';

part 'predefined_stops.g.dart';

@JsonSerializable()
class PredefinedStops {
  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int? routeId;
  final List<Point>? points;

  PredefinedStops({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.routeId,
    this.points,
  });

  factory PredefinedStops.fromJson(Map<String, dynamic> json) =>
      _$PredefinedStopsFromJson(json);
  Map<String, dynamic> toJson() => _$PredefinedStopsToJson(this);
}
