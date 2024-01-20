import 'package:json_annotation/json_annotation.dart';

part 'point_create_request.g.dart';

@JsonSerializable()
class PointCreateRequest {
  @JsonKey(name: "latitude")
  final double latitude;
  @JsonKey(name: "longitude")
  final double longitude;
  @JsonKey(name: "name")
  final String name;

  PointCreateRequest({
    required this.latitude,
    required this.longitude,
    required this.name,
  });

  PointCreateRequest copyWith({
    double? latitude,
    double? longitude,
    String? name,
  }) =>
      PointCreateRequest(
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        name: name ?? this.name,
      );

  factory PointCreateRequest.fromJson(Map<String, dynamic> json) =>
      _$PointCreateRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PointCreateRequestToJson(this);
}
