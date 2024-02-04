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
        borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height * 0.01173709),
      ),
      elevation: 5,
      backgroundColor: Colors.white,
      child: Padding(
        padding:  EdgeInsets.all(MediaQuery.of(context).size.height * 0.02347418),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.11737089,
              width: MediaQuery.of(context).size.height * 0.11737089,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, border: Border.all(width: 0.00058685)),
              child: profileImage != null
                  ? Image.asset('$profileImage')
                  : const Icon(Icons.person),
            ), SizedBox(height: MediaQuery.of(context).size.height * 0.01877934),
            Text('User Id: $id',textAlign: TextAlign.center,),
             SizedBox(height: MediaQuery.of(context).size.height * 0.01173709),
            Text('$name',textAlign: TextAlign.center,),
             SizedBox(height: MediaQuery.of(context).size.height * 0.01877934),
            RectangularElevatedButton(
              width: MediaQuery.of(context).size.height * 0.17605634,
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
