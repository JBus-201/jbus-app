import 'dart:developer';

import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final int id;
  final String? name;
  final String? phoneNumber;
  final String? email;
  final String? role;
  final DateTime updatedAt;
  final DateTime lastActive;
  final String? sex;

  User({
    required this.id,
    this.name,
    this.phoneNumber,
    this.email,
    this.role,
    required this.updatedAt,
    required this.lastActive,
    this.sex,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    log('User.fromJson: $json');
    return _$UserFromJson(json);
  }
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
