import 'package:jbus_app/data/models/point_create_request.dart';
import 'package:json_annotation/json_annotation.dart';

part 'trip_create_request.g.dart';

@JsonSerializable()
class TripCreateRequest {
  @JsonKey(name: "dropOffPoint", includeIfNull: false)
  final PointCreateRequest? dropOffPoint;
  @JsonKey(name: "finishedAt", includeIfNull: false)
  final DateTime? finishedAt;
  @JsonKey(name: "paymentTransactionId", includeIfNull: false)
  final int? paymentTransactionId;
  @JsonKey(name: "pickUpPoint")
  final PointCreateRequest pickUpPoint;
  @JsonKey(name: "startedAt")
  final DateTime startedAt;
  @JsonKey(name: "status")
  final String status;

  TripCreateRequest({
    this.dropOffPoint,
    this.finishedAt,
    this.paymentTransactionId,
    required this.pickUpPoint,
    required this.startedAt,
    required this.status,
  });

  TripCreateRequest copyWith({
    PointCreateRequest? dropOffPoint,
    DateTime? finishedAt,
    int? paymentTransactionId,
    PointCreateRequest? pickUpPoint,
    DateTime? startedAt,
    String? status,
  }) =>
      TripCreateRequest(
        dropOffPoint: dropOffPoint ?? this.dropOffPoint,
        finishedAt: finishedAt ?? this.finishedAt,
        paymentTransactionId: paymentTransactionId ?? this.paymentTransactionId,
        pickUpPoint: pickUpPoint ?? this.pickUpPoint,
        startedAt: startedAt ?? this.startedAt,
        status: status ?? this.status,
      );

  factory TripCreateRequest.fromJson(Map<String, dynamic> json) =>
      _$TripCreateRequestFromJson(json);

  Map<String, dynamic> toJson() => _$TripCreateRequestToJson(this);
}
