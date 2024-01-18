import 'package:json_annotation/json_annotation.dart';

part 'fazaa.g.dart';

@JsonSerializable()
class Fazaa {
  double amount;
  DateTime createdAt;
  int creditorId;
  int id;
  int inDebtId;
  bool paid;
  DateTime returnedAt;

  Fazaa({
    required this.amount,
    required this.createdAt,
    required this.creditorId,
    required this.id,
    required this.inDebtId,
    required this.paid,
    required this.returnedAt,
  });

  factory Fazaa.fromJson(Map<String, dynamic> json) => _$FazaaFromJson(json);

  Map<String, dynamic> toJson() => _$FazaaToJson(this);
}
