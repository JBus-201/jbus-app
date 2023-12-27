// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passenger_update_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PassengerUpdateRequest _$PassengerUpdateRequestFromJson(
        Map<String, dynamic> json) =>
    PassengerUpdateRequest(
      profileImage: json['profileImage'] as String?,
      wallet: (json['wallet'] as num).toDouble(),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PassengerUpdateRequestToJson(
        PassengerUpdateRequest instance) =>
    <String, dynamic>{
      'profileImage': instance.profileImage,
      'wallet': instance.wallet,
      'updatedAt': instance.updatedAt.toIso8601String(),
      'user': instance.user,
    };
