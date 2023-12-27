// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interest_point.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InterestPoint _$InterestPointFromJson(Map<String, dynamic> json) =>
    InterestPoint(
      id: json['id'] as int,
      name: json['name'] as String?,
      logo: json['logo'] as String?,
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      locationId: json['locationId'] as int,
      location: Point.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InterestPointToJson(InterestPoint instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo': instance.logo,
      'updatedAt': instance.updatedAt.toIso8601String(),
      'locationId': instance.locationId,
      'location': instance.location,
    };
