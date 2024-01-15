// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bus_route.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusRoute _$BusRouteFromJson(Map<String, dynamic> json) => BusRoute(
      id: json['id'] as int,
      name: json['name'] as String?,
      fee: json['fee'] as int,
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

Map<String, dynamic> _$BusRouteToJson(BusRoute instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'fee' : instance.fee,
      'waypointsGoing': instance.waypointsGoing,
      'waypointsReturning': instance.waypointsReturning,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'startingPointId': instance.startingPointId,
      'startingPoint': instance.startingPoint,
      'endingPointId': instance.endingPointId,
      'endingPoint': instance.endingPoint,
    };
