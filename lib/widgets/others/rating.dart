import 'package:flutter/material.dart';
import 'package:jbus_app/constants/colors/colors.dart';

class RatingWidget extends StatefulWidget {
  final int initialRating;
  final ValueChanged<int> onRatingChanged;

  const RatingWidget({
    super.key,
    required this.initialRating,
    required this.onRatingChanged,
  });

  @override
  State<RatingWidget> createState() => _RatingWidgetState();
}

class _RatingWidgetState extends State<RatingWidget> {
  late int _rating;

  @override
  void initState() {
    super.initState();
    _rating = widget.initialRating;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _rating = index + 1;
              widget.onRatingChanged(_rating);
            });
          },
          child: SizedBox(
            width: 40,
            height: 40,
            child: Icon(
              index < _rating ? Icons.star : Icons.star_border,
              color: index < _rating ? ourYellow : ourGray,
              size: 40,
            ),
          ),
        );
      }),
    );
  }
}
