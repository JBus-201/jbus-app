import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/screens/faza/buttons/accept.dart';
import 'package:jbus_app/screens/faza/buttons/reject.dart';

class FazaFriendRequestPage extends StatefulWidget {
  /// TO DO
  final int myId = 1;

  const FazaFriendRequestPage({super.key});

  @override
  State<FazaFriendRequestPage> createState() => _FazaFriendRequestPageState();
}

class _FazaFriendRequestPageState extends State<FazaFriendRequestPage> {
  Widget listItem({required Map<Object?, Object?> requesters}) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        color: ourLightGray50,
      ),
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            requesters['key'].toString(),
            textAlign: TextAlign.center,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AcceptRequest(
                myId: widget.myId,
                requesterId: int.parse(requesters['key'].toString()),
              ),
              RejectRequest(
                myId: widget.myId,
                requesterId: int.parse(requesters['key'].toString()),
              ),
            ],
          ),
        ],
      ),
    );
  }

  late Query dbRef;

  @override
  void initState() {
    super.initState();
    setQuery(widget.myId);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      child: FirebaseAnimatedList(
        query: dbRef,
        itemBuilder: (BuildContext context, DataSnapshot snapshot,
            Animation<double> animation, int index) {
          Map<Object?, Object?> requesters =
              snapshot.value as Map<Object?, Object?>;
          requesters['key'] = snapshot.key;
          print('req:$requesters');

          return listItem(requesters: requesters);
        },
      ),
    );
  }

  void setQuery(int myId) {
    dbRef = FirebaseDatabase.instance
        .ref()
        .child("ReqForFaza/Responder/$myId/Requester");
  }
}
