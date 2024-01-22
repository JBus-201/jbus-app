// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bus.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bus _$BusFromJson(Map<String, dynamic> json) => Bus(
      busNumber: json['busNumber'] as String?,
      capacity: json['capacity'] as int?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      driverId: json['driverId'] as int?,
      going: json['going'] as String?,
      id: json['id'] as int?,
      routeId: json['routeId'] as int?,
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$BusToJson(Bus instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('busNumber', instance.busNumber);
  writeNotNull('capacity', instance.capacity);
  writeNotNull('createdAt', instance.createdAt?.toIso8601String());
  writeNotNull('driverId', instance.driverId);
  writeNotNull('going', instance.going);
  writeNotNull('id', instance.id);
  writeNotNull('routeId', instance.routeId);
  writeNotNull('updatedAt', instance.updatedAt?.toIso8601String());
  return val;
}
