import 'package:json_annotation/json_annotation.dart';
import 'package:jbus_app/data/models/user.dart';

part 'passenger.g.dart';

@JsonSerializable()
class Passenger {
  final int id;
  final String? profileImage;
  final int wallet;
  final DateTime createdAt;
  final DateTime updatedAt;
  final User user;

  Passenger({
    required this.id,
    this.profileImage,
    required this.wallet,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });

  factory Passenger.fromJson(Map<String, dynamic> json) =>
      _$PassengerFromJson(json);
  Map<String, dynamic> toJson() => _$PassengerToJson(this);
}
