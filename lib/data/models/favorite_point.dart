import 'package:json_annotation/json_annotation.dart';
import 'package:jbus_app/data/models/point.dart';

part 'favorite_point.g.dart';

@JsonSerializable()
class FavoritePoint {
  final int id;
  final DateTime createdAt;
  final int pointId;
  final Point point;
  final int routeId;

  FavoritePoint({
    required this.id,
    required this.createdAt,
    required this.pointId,
    required this.point,
    required this.routeId,
  });

  factory FavoritePoint.fromJson(Map<String, dynamic> json) =>
      _$FavoritePointFromJson(json);
  Map<String, dynamic> toJson() => _$FavoritePointToJson(this);
}
