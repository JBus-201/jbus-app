import 'package:json_annotation/json_annotation.dart';

part 'login_request.g.dart';

@JsonSerializable(
  explicitToJson: true,
  includeIfNull: false,
)
class LoginRequest {
  final String email;
  final String password;
  @JsonKey(name: 'FcmToken')
  final String? fcmToken;

  LoginRequest({
    required this.email,
    required this.password,
    this.fcmToken,
  });

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);
  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}
