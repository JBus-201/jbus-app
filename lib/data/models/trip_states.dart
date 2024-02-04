import 'package:jbus_app/data/models/bus_route.dart';
import 'package:jbus_app/data/models/trip.dart';
import 'package:json_annotation/json_annotation.dart';

part 'trip_states.g.dart';

@JsonSerializable()
class TripStatus {
    @JsonKey(name: "status")
    int status;
    @JsonKey(name: "trip")
    Trip trip;
    @JsonKey(name: "route")
    BusRoute route;
    @JsonKey(name: "busId")
    int busId;

    TripStatus({
        required this.status,
        required this.trip,
        required this.route,
        required this.busId,
    });

    factory TripStatus.fromJson(Map<String, dynamic> json) => _$TripStatusFromJson(json);

    Map<String, dynamic> toJson() => _$TripStatusToJson(this);
}
