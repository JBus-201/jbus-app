// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int,
      name: json['name'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      email: json['email'] as String?,
      userRole: json['userRole'] as String?,
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      lastActive: DateTime.parse(json['lastActive'] as String),
      userSex: json['userSex'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'userRole': instance.userRole,
      'updatedAt': instance.updatedAt.toIso8601String(),
      'lastActive': instance.lastActive.toIso8601String(),
      'userSex': instance.userSex,
    };
