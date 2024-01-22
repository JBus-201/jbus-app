// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'predefined_stops_create.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PredefinedStopsCreate _$PredefinedStopsCreateFromJson(
        Map<String, dynamic> json) =>
    PredefinedStopsCreate(
      points: (json['points'] as List<dynamic>)
          .map((e) => PointCreateRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
      routeId: json['routeId'] as int,
    );

Map<String, dynamic> _$PredefinedStopsCreateToJson(
        PredefinedStopsCreate instance) =>
    <String, dynamic>{
      'points': instance.points.map((e) => e.toJson()).toList(),
      'routeId': instance.routeId,
    };
