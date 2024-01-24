// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterRequest _$RegisterRequestFromJson(Map<String, dynamic> json) =>
    RegisterRequest(
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String?,
      email: json['email'] as String,
      password: json['password'] as String,
      fcmToken: json['fcmToken'] as String?,
    );

Map<String, dynamic> _$RegisterRequestToJson(RegisterRequest instance) {
  final val = <String, dynamic>{
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('phoneNumber', instance.phoneNumber);
  val['email'] = instance.email;
  val['password'] = instance.password;
  writeNotNull('fcmToken', instance.fcmToken);
  return val;
}
