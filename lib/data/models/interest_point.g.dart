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

Map<String, dynamic> _$InterestPointToJson(InterestPoint instance) {
  final val = <String, dynamic>{
    'id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('logo', instance.logo);
  val['updatedAt'] = instance.updatedAt.toIso8601String();
  val['locationId'] = instance.locationId;
  val['location'] = instance.location.toJson();
  return val;
}
