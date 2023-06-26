import 'package:flutter_secure_storage/flutter_secure_storage.dart';

AndroidOptions _getAndroidOptions() => const AndroidOptions(
      encryptedSharedPreferences: true,
    );
final storage = FlutterSecureStorage(aOptions: _getAndroidOptions());

Future<void> writeTicketToLocalStorage(final String key, final String value) {
  return storage.write(key: key, value: value);
}

Future<Map<String, String>> getAllItemsInStorage() {
  return storage.readAll();
}
