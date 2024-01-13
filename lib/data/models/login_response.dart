import 'package:json_annotation/json_annotation.dart';
import 'package:jbus_app/data/models/passenger.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  final Passenger passengerDto;
  final String token;

  LoginResponse({
    required this.passengerDto,
    required this.token,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
