// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friends.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Friends _$FriendsFromJson(Map<String, dynamic> json) => Friends(
      id: json['id'] as int,
      friend: Passenger.fromJson(json['friend'] as Map<String, dynamic>),
      passenger: Passenger.fromJson(json['passenger'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FriendsToJson(Friends instance) => <String, dynamic>{
      'id': instance.id,
      'friend': instance.friend,
      'passenger': instance.passenger,
    };
