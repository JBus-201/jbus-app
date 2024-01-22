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

Map<String, dynamic> _$BusRouteToJson(BusRoute instance) {
  final val = <String, dynamic>{
    'id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  val['fee'] = instance.fee;
  writeNotNull('waypointsGoing', instance.waypointsGoing);
  writeNotNull('waypointsReturning', instance.waypointsReturning);
  val['createdAt'] = instance.createdAt.toIso8601String();
  val['updatedAt'] = instance.updatedAt.toIso8601String();
  val['startingPointId'] = instance.startingPointId;
  val['startingPoint'] = instance.startingPoint.toJson();
  val['endingPointId'] = instance.endingPointId;
  val['endingPoint'] = instance.endingPoint.toJson();
  return val;
}
