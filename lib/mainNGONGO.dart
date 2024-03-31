import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

late final FirebaseApp app;
late final FirebaseAuth auth;
late final FirebaseFirestore fireStore;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  auth = FirebaseAuth.instanceFor(app: app);
  // fireStore = FirebaseFirestore.instanceFor(app: app);
  // fireStore.settings = const Settings(
  //   persistenceEnabled: true,
  // );

  // fireStore.collection("Admin").add({
  //       "username": "aquarat",
  //       "email": "aqr@gmail.com",
  //       "time": 45,
  //       "calories": 2000,
  //       "bmi": 20.00
  //     });

}
