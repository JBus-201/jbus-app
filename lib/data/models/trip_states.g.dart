// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_states.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TripStatus _$TripStatusFromJson(Map<String, dynamic> json) => TripStatus(
      status: json['status'] as int,
      trip: json['trip'] == null
          ? null
          : Trip.fromJson(json['trip'] as Map<String, dynamic>),
      route: json['route'] == null
          ? null
          : BusRoute.fromJson(json['route'] as Map<String, dynamic>),
      bus: json['bus'] == null
          ? null
          : Bus.fromJson(json['bus'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TripStatusToJson(TripStatus instance) =>
    <String, dynamic>{
      'status': instance.status,
      'trip': instance.trip,
      'route': instance.route,
      'bus': instance.bus,
    };
