import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final int id;
  final String? name;
  final String? phoneNumber;
  final String? email;
  final String? userRole;
  final DateTime updatedAt;
  final DateTime lastActive;
  final String? userSex;

  User({
    required this.id,
    this.name,
    this.phoneNumber,
    this.email,
    this.userRole,
    required this.updatedAt,
    required this.lastActive,
    this.userSex,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
