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
    PassengerUpdateRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('profileImage', instance.profileImage);
  val['wallet'] = instance.wallet;
  val['updatedAt'] = instance.updatedAt.toIso8601String();
  val['user'] = instance.user.toJson();
  return val;
}
