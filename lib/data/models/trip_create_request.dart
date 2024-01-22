import 'package:jbus_app/data/models/point_create_request.dart';
import 'package:json_annotation/json_annotation.dart';

part 'trip_create_request.g.dart';

@JsonSerializable(
  explicitToJson: true,
  includeIfNull: false,
)
class TripCreateRequest {
  final PointCreateRequest? dropOffPoint;
  final DateTime? finishedAt;
  final int? paymentTransactionId;
  final PointCreateRequest pickUpPoint;
  final DateTime startedAt;
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
