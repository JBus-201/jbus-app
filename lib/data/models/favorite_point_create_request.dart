import 'package:json_annotation/json_annotation.dart';

part 'favorite_point_create_request.g.dart';

@JsonSerializable()
class FavoritePointCreateRequest {
  final String name;
  final double lat;
  final double long;
  final int routeId;

  FavoritePointCreateRequest({
    required this.name,
    required this.lat,
    required this.long,
    required this.routeId,
  });

  factory FavoritePointCreateRequest.fromJson(Map<String, dynamic> json) =>
      _$FavoritePointCreateRequestFromJson(json);
  Map<String, dynamic> toJson() => _$FavoritePointCreateRequestToJson(this);
}
