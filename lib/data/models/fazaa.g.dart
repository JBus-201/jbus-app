// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fazaa.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Fazaa _$FazaaFromJson(Map<String, dynamic> json) => Fazaa(
      amount: (json['amount'] as num).toDouble(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      creditorId: json['creditorId'] as int,
      id: json['id'] as int,
      inDebtId: json['inDebtId'] as int,
      paid: json['paid'] as bool,
      returnedAt: DateTime.parse(json['returnedAt'] as String),
    );

Map<String, dynamic> _$FazaaToJson(Fazaa instance) => <String, dynamic>{
      'amount': instance.amount,
      'createdAt': instance.createdAt.toIso8601String(),
      'creditorId': instance.creditorId,
      'id': instance.id,
      'inDebtId': instance.inDebtId,
      'paid': instance.paid,
      'returnedAt': instance.returnedAt.toIso8601String(),
    };
