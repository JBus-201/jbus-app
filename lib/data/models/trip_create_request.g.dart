// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_create_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TripCreateRequest _$TripCreateRequestFromJson(Map<String, dynamic> json) =>
    TripCreateRequest(
      dropOffPoint: json['dropOffPoint'] == null
          ? null
          : PointCreateRequest.fromJson(
              json['dropOffPoint'] as Map<String, dynamic>),
      finishedAt: json['finishedAt'] == null
          ? null
          : DateTime.parse(json['finishedAt'] as String),
      paymentTransactionId: json['paymentTransactionId'] as int?,
      pickUpPoint: PointCreateRequest.fromJson(
          json['pickUpPoint'] as Map<String, dynamic>),
      // startedAt: DateTime.parse(json['startedAt'] as String),
      // status: json['status'] as String,
    );

Map<String, dynamic> _$TripCreateRequestToJson(TripCreateRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('dropOffPoint', instance.dropOffPoint?.toJson());
  writeNotNull('finishedAt', instance.finishedAt?.toIso8601String());
  writeNotNull('paymentTransactionId', instance.paymentTransactionId);
  val['pickUpPoint'] = instance.pickUpPoint.toJson();
  // val['startedAt'] = instance.startedAt!.toIso8601String();
  // val['status'] = instance.status;
  return val;
}
