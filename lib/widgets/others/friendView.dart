import 'package:flutter/material.dart';
import 'package:jbus_app/widgets/buttons/rectangular_elevated_button.dart';

class FriendViewDialog extends StatelessWidget {
  final int id;
  final String? name;
  final String? profileImage;
  const FriendViewDialog(
      {super.key,
      required this.id,
      required this.name,
      required this.profileImage});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, border: Border.all(width: 0.5)),
              child: profileImage != null
                  ? Image.asset('$profileImage')
                  : const Icon(Icons.person),
            ),const SizedBox(height: 16),
            Text('User Id: $id',textAlign: TextAlign.center,),
            const SizedBox(height: 10),
            Text('$name',textAlign: TextAlign.center,),
            const SizedBox(height: 16),
            RectangularElevatedButton(
              width: 150,
              onPressed: () {
                Navigator.of(context).pop();
              },
              text: "OK",
            ),
          ],
        ),
      ),
    );
  }
}
