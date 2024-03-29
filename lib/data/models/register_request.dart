import 'package:json_annotation/json_annotation.dart';

part 'register_request.g.dart';

@JsonSerializable(
  explicitToJson: true,
  includeIfNull: false,
)
class RegisterRequest {
  final String name;
  final String? phoneNumber;
  final String email;
  final String password;
  final String? fcmToken;

  RegisterRequest({
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.password,
    this.fcmToken,
  });

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}
