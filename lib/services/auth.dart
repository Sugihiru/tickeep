import 'package:firebase_auth/firebase_auth.dart';

Future<String?> getCurrentUserUid() async {
  return FirebaseAuth.instance
      .signInAnonymously()
      .then((userCredentials) => userCredentials.user?.uid);
}
