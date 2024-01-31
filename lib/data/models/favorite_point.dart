import 'package:jbus_app/data/models/bus_route.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:jbus_app/data/models/point.dart';

part 'favorite_point.g.dart';

@JsonSerializable(
  explicitToJson: true,
  includeIfNull: false,
)
class FavoritePoint {
  final int id;
  final DateTime createdAt;
  final Point point;
  final BusRoute route;

  FavoritePoint({
    required this.id,
    required this.createdAt,
    required this.point,
    required this.route,
  });

  factory FavoritePoint.fromJson(Map<String, dynamic> json) =>
      _$FavoritePointFromJson(json);
  Map<String, dynamic> toJson() => _$FavoritePointToJson(this);
}
