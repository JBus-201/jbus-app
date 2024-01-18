// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_point_create_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoritePointCreateRequest _$FavoritePointCreateRequestFromJson(
        Map<String, dynamic> json) =>
    FavoritePointCreateRequest(
      name: json['name'] as String,
      lat: (json['lat'] as num).toDouble(),
      long: (json['long'] as num).toDouble(),
      routeId: json['routeId'] as int,
    );

Map<String, dynamic> _$FavoritePointCreateRequestToJson(
        FavoritePointCreateRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'lat': instance.lat,
      'long': instance.long,
      'routeId': instance.routeId,
    };
