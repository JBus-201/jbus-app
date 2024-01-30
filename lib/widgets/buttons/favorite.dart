import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/data/api/api_service.dart';
import 'package:jbus_app/services/service_locator.dart';
import 'package:jbus_app/widgets/others/textDialog.dart';

class FavoriteButton extends StatefulWidget {
  final bool isFavorite;
  final String name;
  final int routeId;
  final LatLng location;
  final int? pointId;

  const FavoriteButton(
      {super.key,
      this.isFavorite = false,
      required this.routeId,
      required this.location,
      this.name = "N/A",
      this.pointId});

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  late bool isFavorite;
  final TextEditingController pointNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    isFavorite = widget.isFavorite;
  }

  void removePoint() {
    sl<ApiService>().deleteFavoritePoint(widget.pointId!);
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  void addPoint() {
    showDialog(
        context: context,
        builder: (context) =>
            TextDialog(routeId: widget.routeId, location: widget.location));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isFavorite ? removePoint : addPoint,
      child: Icon(
        isFavorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
        color: isFavorite ? ourRed : ourGray,
        size: 35,
      ),
    );
  }
}
