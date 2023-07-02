import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:uuid/uuid.dart';

import 'package:tickeep/models/ticket_model.dart';

AndroidOptions _getAndroidOptions() => const AndroidOptions(
      encryptedSharedPreferences: true,
    );
final storage = FlutterSecureStorage(aOptions: _getAndroidOptions());

Future<void> writeTicketToLocalStorage(final TicketModel value) {
  return storage.write(
      key: const Uuid().v4(), value: jsonEncode(value.toJson()));
}

Future<Map<String, TicketModel>> getAllItemsInStorage() async {
  Map<String, String> rawItems = await storage.readAll();
  Map<String, TicketModel> items = {};
  for (var rawItem in rawItems.entries) {
    try {
      items[rawItem.key] = TicketModel.fromJson(jsonDecode(rawItem.value));
    } on FormatException {}
  }
  return items;
}
