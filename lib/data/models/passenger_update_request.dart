import 'package:json_annotation/json_annotation.dart';
import 'package:jbus_app/data/models/user.dart';

part 'passenger_update_request.g.dart';

@JsonSerializable(
  explicitToJson: true,
  includeIfNull: false,
)
class PassengerUpdateRequest {
  final String? profileImage;
  final double wallet;
  final DateTime updatedAt;
  final User user;

  PassengerUpdateRequest({
    this.profileImage,
    required this.wallet,
    required this.updatedAt,
    required this.user,
  });

  factory PassengerUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$PassengerUpdateRequestFromJson(json);
  Map<String, dynamic> toJson() => _$PassengerUpdateRequestToJson(this);
}
