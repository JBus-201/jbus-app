import 'dart:developer';

import 'package:json_annotation/json_annotation.dart';
import 'package:jbus_app/data/models/user.dart';

part 'passenger.g.dart';

@JsonSerializable(
  explicitToJson: true,
  includeIfNull: false,
)
class Passenger {
  final int id;
  final String? profileImage;
  final int wallet;
  final User user;
  final int? rewardPoints;

  Passenger({
    required this.id,
    this.profileImage,
    required this.wallet,
    required this.user,
    this.rewardPoints,
  });

  factory Passenger.fromJson(Map<String, dynamic> json) {
    log('Passenger.fromJson: $json');
    try {
      final res = _$PassengerFromJson(json);
      return res;
    } catch (e) {
      log('Passenger.fromJson: $e');
    }
    return _$PassengerFromJson(json);
  }
  Map<String, dynamic> toJson() => _$PassengerToJson(this);
}
