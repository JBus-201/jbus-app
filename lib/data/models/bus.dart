import 'package:json_annotation/json_annotation.dart';

part 'bus.g.dart';

@JsonSerializable(
  explicitToJson: true,
  includeIfNull: false,
)
class Bus {
  @JsonKey(name: "busNumber")
  final String? busNumber;
  @JsonKey(name: "capacity")
  final int? capacity;
  @JsonKey(name: "createdAt")
  final DateTime? createdAt;
  @JsonKey(name: "driverId")
  final int? driverId;
  @JsonKey(name: "going")
  final String? going;
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "routeId")
  final int? routeId;
  @JsonKey(name: "updatedAt")
  final DateTime? updatedAt;

  Bus({
    this.busNumber,
    this.capacity,
    this.createdAt,
    this.driverId,
    this.going,
    this.id,
    this.routeId,
    this.updatedAt,
  });

  factory Bus.fromJson(Map<String, dynamic> json) => _$BusFromJson(json);

  Map<String, dynamic> toJson() => _$BusToJson(this);
}
