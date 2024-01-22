import 'package:jbus_app/data/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'friend.g.dart';

@JsonSerializable(
  explicitToJson: true,
  includeIfNull: false,
)
class Friend {
  final int id;
  final String? profileImage;
  final User user;

  Friend({
    required this.id,
    this.profileImage,
    required this.user,
  });

  factory Friend.fromJson(Map<String, dynamic> json) => _$FriendFromJson(json);
  Map<String, dynamic> toJson() => _$FriendToJson(this);
}
