// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'point.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Point _$PointFromJson(Map<String, dynamic> json) => Point(
      id: json['id'] as int,
      name: json['name'] as String?,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$PointToJson(Point instance) {
  final val = <String, dynamic>{
    'id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  val['latitude'] = instance.latitude;
  val['longitude'] = instance.longitude;
  val['createdAt'] = instance.createdAt.toIso8601String();
  return val;
}
