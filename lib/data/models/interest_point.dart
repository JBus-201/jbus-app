import 'package:json_annotation/json_annotation.dart';
import 'package:jbus_app/data/models/point.dart';

part 'interest_point.g.dart';

@JsonSerializable(
  explicitToJson: true,
  includeIfNull: false,
)
class InterestPoint {
  final int id;
  final String? name;
  final String? logo;
  final DateTime updatedAt;
  final Point location;

  InterestPoint({
    required this.id,
    this.name,
    this.logo,
    required this.updatedAt,
    required this.location,
  });

  factory InterestPoint.fromJson(Map<String, dynamic> json) =>
      _$InterestPointFromJson(json);
  Map<String, dynamic> toJson() => _$InterestPointToJson(this);
}
