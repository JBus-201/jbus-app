import 'package:json_annotation/json_annotation.dart';

part 'fazaa_create_request.g.dart';

@JsonSerializable()
class FazaaCreateRequest {
  @JsonKey(required: true)
  final double amount;

  @JsonKey(required: true)
  final int creditorId;

  FazaaCreateRequest({
    required this.amount,
    required this.creditorId,
  });

  factory FazaaCreateRequest.fromJson(Map<String, dynamic> json) =>
      _$FazaaCreateRequestFromJson(json);
  Map<String, dynamic> toJson() => _$FazaaCreateRequestToJson(this);
}
