// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friends_create_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FriendsCreateRequest _$FriendsCreateRequestFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['friendId'],
  );
  return FriendsCreateRequest(
    friendId: json['friendId'] as int,
  );
}

Map<String, dynamic> _$FriendsCreateRequestToJson(
        FriendsCreateRequest instance) =>
    <String, dynamic>{
      'friendId': instance.friendId,
    };
