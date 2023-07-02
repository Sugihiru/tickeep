import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:tickeep/models/ticket_model.dart';
import 'package:tickeep/services/local_storage.dart';

part 'tickets_provider.g.dart';

@riverpod
Future<Map<String, TicketModel>> getUserTickets(GetUserTicketsRef ref) {
  return getAllItemsInStorage();
}
