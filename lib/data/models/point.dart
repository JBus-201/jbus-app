import 'package:json_annotation/json_annotation.dart';

part 'point.g.dart';

@JsonSerializable()
class Point {
  final int id;
  final String? name;
  final double latitude;
  final double longitude;
  final DateTime createdAt;

  Point({
    required this.id,
    this.name,
    required this.latitude,
    required this.longitude,
    required this.createdAt,
  });

  factory Point.fromJson(Map<String, dynamic> json) => _$PointFromJson(json);
  Map<String, dynamic> toJson() => _$PointToJson(this);
}
