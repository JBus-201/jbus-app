import 'package:json_annotation/json_annotation.dart';

part 'friends_create_request.g.dart';

@JsonSerializable(
  explicitToJson: true,
  includeIfNull: false,
)
class FriendsCreateRequest {
  @JsonKey(required: true)
  final int friendId;

  FriendsCreateRequest({
    required this.friendId,
  });

  factory FriendsCreateRequest.fromJson(Map<String, dynamic> json) =>
      _$FriendsCreateRequestFromJson(json);
  Map<String, dynamic> toJson() => _$FriendsCreateRequestToJson(this);
}
