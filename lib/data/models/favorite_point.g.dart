// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_point.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoritePoint _$FavoritePointFromJson(Map<String, dynamic> json) =>
    FavoritePoint(
      id: json['id'] as int,
      createdAt: DateTime.parse(json['createdAt'] as String),
      point: Point.fromJson(json['point'] as Map<String, dynamic>),
      route: BusRoute.fromJson(json['route'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FavoritePointToJson(FavoritePoint instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'point': instance.point.toJson(),
      'route': instance.route.toJson(),
    };
