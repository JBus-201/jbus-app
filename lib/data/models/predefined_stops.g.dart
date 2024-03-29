// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'predefined_stops.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PredefinedStops _$PredefinedStopsFromJson(Map<String, dynamic> json) =>
    PredefinedStops(
      id: json['id'] as int,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      routeId: json['routeId'] as int?,
      points: (json['points'] as List<dynamic>?)
          ?.map((e) => Point.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PredefinedStopsToJson(PredefinedStops instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'createdAt': instance.createdAt.toIso8601String(),
    'updatedAt': instance.updatedAt.toIso8601String(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('routeId', instance.routeId);
  writeNotNull('points', instance.points?.map((e) => e.toJson()).toList());
  return val;
}
