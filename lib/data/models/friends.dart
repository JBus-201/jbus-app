import 'package:jbus_app/data/models/passenger.dart';
import 'package:json_annotation/json_annotation.dart';

part 'friends.g.dart';

@JsonSerializable()
class Friends {
  final int id;
  final Passenger friend;
  final Passenger passenger;

  Friends({
    required this.id,
    required this.friend,
    required this.passenger,
  });

  factory Friends.fromJson(Map<String, dynamic> json) =>
      _$FriendsFromJson(json);
  Map<String, dynamic> toJson() => _$FriendsToJson(this);
}
