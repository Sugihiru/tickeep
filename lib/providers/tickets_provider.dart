import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:tickeep/models/ticket_model.dart';
import 'package:tickeep/services/local_storage.dart';

part 'tickets_provider.g.dart';

@riverpod
Future<List<TicketModel>> getUserTickets(GetUserTicketsRef ref) async {
  Map<String, String> items = await getAllItemsInStorage();
  List<TicketModel> tickets = [];

  for (var item in items.entries) {
    tickets.add(TicketModel(item.key, DateTime.now(), DateTime.now()));
  }
  return tickets;
}
