// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'point_create_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PointCreateRequest _$PointCreateRequestFromJson(Map<String, dynamic> json) =>
    PointCreateRequest(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$PointCreateRequestToJson(PointCreateRequest instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'name': instance.name,
    };
