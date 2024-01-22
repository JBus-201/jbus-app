import 'package:jbus_app/data/models/point_create_request.dart';
import 'package:json_annotation/json_annotation.dart';
part 'predefined_stops_create.g.dart';

@JsonSerializable(
  explicitToJson: true,
  includeIfNull: false,
)
class PredefinedStopsCreate {
  @JsonKey(name: "points")
  final List<PointCreateRequest> points;
  @JsonKey(name: "routeId")
  final int routeId;

  PredefinedStopsCreate({
    required this.points,
    required this.routeId,
  });

  factory PredefinedStopsCreate.fromJson(Map<String, dynamic> json) =>
      _$PredefinedStopsCreateFromJson(json);

  Map<String, dynamic> toJson() => _$PredefinedStopsCreateToJson(this);
}
