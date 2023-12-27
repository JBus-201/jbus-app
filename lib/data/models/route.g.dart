// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Route _$RouteFromJson(Map<String, dynamic> json) => Route(
      id: json['id'] as int,
      name: json['name'] as String?,
      waypointsGoing: json['waypointsGoing'] as String?,
      waypointsReturning: json['waypointsReturning'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      startingPointId: json['startingPointId'] as int,
      startingPoint:
          InterestPoint.fromJson(json['startingPoint'] as Map<String, dynamic>),
      endingPointId: json['endingPointId'] as int,
      endingPoint:
          InterestPoint.fromJson(json['endingPoint'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RouteToJson(Route instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'waypointsGoing': instance.waypointsGoing,
      'waypointsReturning': instance.waypointsReturning,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'startingPointId': instance.startingPointId,
      'startingPoint': instance.startingPoint,
      'endingPointId': instance.endingPointId,
      'endingPoint': instance.endingPoint,
    };
