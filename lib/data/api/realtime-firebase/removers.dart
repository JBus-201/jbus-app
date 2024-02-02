import 'package:firebase_database/firebase_database.dart';

final databaseReference = FirebaseDatabase.instance.ref();

removeFazaReq(int responderId, int requesterId) {
  databaseReference
      .child('ReqForFaza/Responder/$responderId/Requester/$requesterId')
      .remove();
}

removeRoute(int routeId) {
  databaseReference.child('Route/$routeId').remove();
}

removeBus(
  int routeId,
  int busId,
  bool isGoing
) {
  databaseReference.child('Route/$routeId${isGoing ? "going" : "returning"}/Bus/$busId').remove();
}

removeCurrentLocountion(
  int routeId,
  int busId,
) {
  databaseReference.child('Route/$routeId/Bus/$busId/currentLocation').remove();
}

removeCurrentPassNum(
  int routeId,
  int busId,
) {
  databaseReference.child('Route/$routeId/Bus/$busId/currentPassNum').remove();
}

removeDropOff(int routeId, int busId, int userId) {
  databaseReference
      .child('Route/$routeId/Bus/$busId/dropoffs/$userId')
      .remove();
}

removePickup(int routeId, int busId, int userId) {
  databaseReference.child('Route/$routeId/Bus/$busId/pickups/$userId').remove();
}

removePayer(int requesterId, int payerId) {
  databaseReference.child('Faza/$requesterId/payers/$payerId').remove();
}

removeAllPayers(int requesterId) {
  databaseReference.child('Faza/$requesterId/payers').remove();
}
removeFaza(int requesterId) {
  databaseReference.child('Faza/$requesterId').remove();
}
