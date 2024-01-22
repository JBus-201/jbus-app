// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      name: json['name'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      email: json['email'] as String?,
      role: json['role'] as String?,
      sex: json['sex'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('phoneNumber', instance.phoneNumber);
  writeNotNull('email', instance.email);
  writeNotNull('role', instance.role);
  writeNotNull('sex', instance.sex);
  return val;
}
