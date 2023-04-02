import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:tickeep/models/ticket_model.dart';

class FirestoreDatabase {
  static final _db = FirebaseFirestore.instance;

  static Stream<List<TicketModel>> getUserTickets(
      {required final String userId, final bool expired = false}) async* {
    Query query = _db.collection("/projects/tickeep/users/$userId/tickets");
    if (expired) {
      query = query.where("eventDate", isGreaterThanOrEqualTo: DateTime.now());
    }

    yield* query.snapshots().map((event) => event.docs
        .map((doc) => TicketModel.fromJson(doc.data() as Map<String, dynamic>))
        .toList());
  }
}
