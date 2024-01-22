// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friend_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FriendRequest _$FriendRequestFromJson(Map<String, dynamic> json) =>
    FriendRequest(
      id: json['id'] as int,
      friend: Friend.fromJson(json['friend'] as Map<String, dynamic>),
      passenger: Friend.fromJson(json['passenger'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
      confirmedAt: json['confirmedAt'] == null
          ? null
          : DateTime.parse(json['confirmedAt'] as String),
    );

Map<String, dynamic> _$FriendRequestToJson(FriendRequest instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'friend': instance.friend.toJson(),
    'passenger': instance.passenger.toJson(),
    'createdAt': instance.createdAt.toIso8601String(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('confirmedAt', instance.confirmedAt?.toIso8601String());
  return val;
}
