import 'package:json_annotation/json_annotation.dart';

part 'register_request.g.dart';

@JsonSerializable()
class RegisterRequest {
  final String name;
  final String phoneNumber;
  final String email;
  final String password;
  final int otp;

  RegisterRequest({
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.password,
    required this.otp,
  });

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}
