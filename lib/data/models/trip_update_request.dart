import 'package:jbus_app/data/models/point_create_request.dart';
import 'package:json_annotation/json_annotation.dart';

part 'trip_update_request.g.dart';

@JsonSerializable()
class TripUpdateRequest {
  @JsonKey(name: "dropOffPoint", includeIfNull: false)
  final PointCreateRequest? dropOffPoint;
  @JsonKey(name: "finishedAt", includeIfNull: false)
  final DateTime? finishedAt;
  @JsonKey(name: "paymentTransactionId", includeIfNull: false)
  final int? paymentTransactionId;
  @JsonKey(name: "pickUpPoint", includeIfNull: false)
  final PointCreateRequest? pickUpPoint;
  @JsonKey(name: "status", includeIfNull: false)
  final String? status;

  TripUpdateRequest({
    this.dropOffPoint,
    this.finishedAt,
    this.paymentTransactionId,
    this.pickUpPoint,
    this.status,
  });

  TripUpdateRequest copyWith({
    PointCreateRequest? dropOffPoint,
    DateTime? finishedAt,
    int? paymentTransactionId,
    PointCreateRequest? pickUpPoint,
    String? status,
  }) =>
      TripUpdateRequest(
        dropOffPoint: dropOffPoint ?? this.dropOffPoint,
        finishedAt: finishedAt ?? this.finishedAt,
        paymentTransactionId: paymentTransactionId ?? this.paymentTransactionId,
        pickUpPoint: pickUpPoint ?? this.pickUpPoint,
        status: status ?? this.status,
      );

  factory TripUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$TripUpdateRequestFromJson(json);

  Map<String, dynamic> toJson() => _$TripUpdateRequestToJson(this);
}
