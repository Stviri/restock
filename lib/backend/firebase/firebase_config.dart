import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDDXtmzdH6zNef-3Iiqm74zXhlSofWEPh4",
            authDomain: "re-s-t-o-c-k-k6vb3e.firebaseapp.com",
            projectId: "re-s-t-o-c-k-k6vb3e",
            storageBucket: "re-s-t-o-c-k-k6vb3e.firebasestorage.app",
            messagingSenderId: "159090184312",
            appId: "1:159090184312:web:b988db477b100c2561dd8d",
            measurementId: "G-SS8EERX1YE"));
  } else {
    await Firebase.initializeApp();
  }
}
