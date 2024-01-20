import 'package:jbus_app/data/models/point.dart';
import 'package:json_annotation/json_annotation.dart';

part 'trip.g.dart';

@JsonSerializable()
class Trip {
  Trip({
    required this.id,
    required this.createdAt,
    required this.finishedAt,
    this.status,
    required this.passengerId,
    required this.paymentTransactionId,
    required this.pickUpPointId,
    required this.pickUpPoint,
    required this.dropOffPointId,
    required this.dropOffPoint,
  });

  factory Trip.fromJson(Map<String, dynamic> jsonMap) =>
      _$TripFromJson(jsonMap);

  @JsonKey(
    name: 'id',
    includeIfNull: false,
  )
  final int id;

  @JsonKey(
    name: 'createdAt',
    includeIfNull: false,
  )
  final DateTime createdAt;

  @JsonKey(
    name: 'finishedAt',
    includeIfNull: false,
  )
  final DateTime finishedAt;

  @JsonKey(name: 'status')
  final String? status;

  @JsonKey(
    name: 'passengerId',
    includeIfNull: false,
  )
  final int passengerId;

  @JsonKey(
    name: 'paymentTransactionId',
    includeIfNull: false,
  )
  final int paymentTransactionId;

  @JsonKey(
    name: 'pickUpPointId',
    includeIfNull: false,
  )
  final int pickUpPointId;

  @JsonKey(
    name: 'pickUpPoint',
    includeIfNull: false,
  )
  final Point pickUpPoint;

  @JsonKey(
    name: 'dropOffPointId',
    includeIfNull: false,
  )
  final int dropOffPointId;

  @JsonKey(
    name: 'dropOffPoint',
    includeIfNull: false,
  )
  final Point dropOffPoint;

  Map<String, dynamic> toJson() => _$TripToJson(this);
  @override
  String toString() => toJson().toString();
}
