// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fazaa_create_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FazaaCreateRequest _$FazaaCreateRequestFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['amount', 'creditorId'],
  );
  return FazaaCreateRequest(
    amount: json['amount'] as int,
    creditorId: json['creditorId'] as int,
  );
}

Map<String, dynamic> _$FazaaCreateRequestToJson(FazaaCreateRequest instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'creditorId': instance.creditorId,
    };
