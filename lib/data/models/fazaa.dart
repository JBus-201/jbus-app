import 'package:jbus_app/data/models/passenger.dart';
import 'package:json_annotation/json_annotation.dart';

part 'fazaa.g.dart';

@JsonSerializable(
  explicitToJson: true,
  includeIfNull: false,
)
class Fazaa {
  double amount;
  DateTime createdAt;
  Passenger creditor;
  int id;
  Passenger inDebt;
  bool paid;
  DateTime returnedAt;

  Fazaa({
    required this.amount,
    required this.createdAt,
    required this.id,
    required this.inDebt,
    required this.paid,
    required this.returnedAt,
    required this.creditor,
  });

  factory Fazaa.fromJson(Map<String, dynamic> json) => _$FazaaFromJson(json);

  Map<String, dynamic> toJson() => _$FazaaToJson(this);
}
