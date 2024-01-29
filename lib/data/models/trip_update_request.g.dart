// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_update_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TripUpdateRequest _$TripUpdateRequestFromJson(Map<String, dynamic> json) =>
    TripUpdateRequest(
      dropOffPoint: json['dropOffPoint'] == null
          ? null
          : PointCreateRequest.fromJson(
              json['dropOffPoint'] as Map<String, dynamic>),
      // finishedAt: json['finishedAt'] == null
      //     ? null
      //     : DateTime.parse(json['finishedAt'] as String),
      paymentTransactionId: json['paymentTransactionId'] as int?,
      pickUpPoint: json['pickUpPoint'] == null
          ? null
          : PointCreateRequest.fromJson(
              json['pickUpPoint'] as Map<String, dynamic>),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$TripUpdateRequestToJson(TripUpdateRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('dropOffPoint', instance.dropOffPoint?.toJson());
  // writeNotNull('finishedAt', instance.finishedAt?.toIso8601String());
  writeNotNull('paymentTransactionId', instance.paymentTransactionId);
  writeNotNull('pickUpPoint', instance.pickUpPoint?.toJson());
  writeNotNull('status', instance.status);
  return val;
}
