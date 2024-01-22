import 'package:jbus_app/data/models/friend.dart';
import 'package:json_annotation/json_annotation.dart';

part 'friend_request.g.dart';

@JsonSerializable(
  explicitToJson: true,
  includeIfNull: false,
)
class FriendRequest {
  final int id;
  final Friend friend;
  final Friend passenger;
  final DateTime createdAt;
  final DateTime? confirmedAt;

  FriendRequest({
    required this.id,
    required this.friend,
    required this.passenger,
    required this.createdAt,
    this.confirmedAt,
  });

  factory FriendRequest.fromJson(Map<String, dynamic> json) =>
      _$FriendRequestFromJson(json);

  Map<String, dynamic> toJson() => _$FriendRequestToJson(this);
}
