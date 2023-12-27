// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_point.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoritePoint _$FavoritePointFromJson(Map<String, dynamic> json) =>
    FavoritePoint(
      id: json['id'] as int,
      createdAt: DateTime.parse(json['createdAt'] as String),
      pointId: json['pointId'] as int,
      point: Point.fromJson(json['point'] as Map<String, dynamic>),
      routeId: json['routeId'] as int,
    );

Map<String, dynamic> _$FavoritePointToJson(FavoritePoint instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'pointId': instance.pointId,
      'point': instance.point,
      'routeId': instance.routeId,
    };
