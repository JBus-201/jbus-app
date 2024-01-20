// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Trip _$TripFromJson(Map<String, dynamic> json) => Trip(
      id: json['id'] as int,
      createdAt: DateTime.parse(json['createdAt'] as String),
      finishedAt: DateTime.parse(json['finishedAt'] as String),
      status: json['status'] as String?,
      passengerId: json['passengerId'] as int,
      paymentTransactionId: json['paymentTransactionId'] as int,
      pickUpPointId: json['pickUpPointId'] as int,
      pickUpPoint: Point.fromJson(json['pickUpPoint'] as Map<String, dynamic>),
      dropOffPointId: json['dropOffPointId'] as int,
      dropOffPoint:
          Point.fromJson(json['dropOffPoint'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TripToJson(Trip instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'finishedAt': instance.finishedAt.toIso8601String(),
      'status': instance.status,
      'passengerId': instance.passengerId,
      'paymentTransactionId': instance.paymentTransactionId,
      'pickUpPointId': instance.pickUpPointId,
      'pickUpPoint': instance.pickUpPoint.toJson(),
      'dropOffPointId': instance.dropOffPointId,
      'dropOffPoint': instance.dropOffPoint.toJson(),
    };
