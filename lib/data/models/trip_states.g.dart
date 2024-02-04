// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_states.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TripStatus _$TripStatusFromJson(Map<String, dynamic> json) => TripStatus(
      status: json['status'] as int,
      trip: Trip.fromJson(json['trip'] as Map<String, dynamic>),
      route: BusRoute.fromJson(json['route'] as Map<String, dynamic>),
      busId: json['busId'] as int,
    );

Map<String, dynamic> _$TripStatusToJson(TripStatus instance) =>
    <String, dynamic>{
      'status': instance.status,
      'trip': instance.trip,
      'route': instance.route,
      'busId': instance.busId,
    };
