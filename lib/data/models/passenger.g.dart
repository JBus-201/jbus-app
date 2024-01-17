// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passenger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Passenger _$PassengerFromJson(Map<String, dynamic> json) => Passenger(
      id: json['id'] as int,
      profileImage: json['profileImage'] as String?,
      wallet: json['wallet'] != null? json['wallet'] as int : 0,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PassengerToJson(Passenger instance) => <String, dynamic>{
      'id': instance.id,
      'profileImage': instance.profileImage,
      'wallet': instance.wallet,
      'user': instance.user,
    };
