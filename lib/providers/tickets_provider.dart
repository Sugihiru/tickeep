import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:tickeep/models/ticket_model.dart';
import 'package:tickeep/services/auth.dart';
import 'package:tickeep/services/database.dart';

part 'tickets_provider.g.dart';

@riverpod
Stream<List<TicketModel>> getUserTickets(GetUserTicketsRef ref,
    {bool expired = false}) async* {
  final String? userId = await getCurrentUserUid();

  if (userId == null) {
    yield* const Stream.empty();
  } else {
    yield* FirestoreDatabase.getUserTickets(userId: userId);
  }
}
