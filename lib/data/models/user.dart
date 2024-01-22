import 'dart:developer';

import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(
  explicitToJson: true,
  includeIfNull: false,
)
class User {
  final String? name;
  final String? phoneNumber;
  final String? email;
  final String? role;
  final String? sex;

  User({
    this.name,
    this.phoneNumber,
    this.email,
    this.role,
    this.sex,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    log('User.fromJson: $json');
    return _$UserFromJson(json);
  }
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
