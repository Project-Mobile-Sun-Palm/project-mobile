import 'package:flutter/material.dart';
import 'package:project/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project/main.dart';
import 'package:project/models/account.dart';

class SignUpController {
  // final _db = FirebaseFirestore.instanceFor(app: app);

  // Account account;
  // SignUpController(this.account);
  // final FirebaseAuth auth = FirebaseAuth.instanceFor(app: app);

  // Future<void> updateUserRecord() async {
  //   await _db.collection("User").doc("tZhrA3SxLGdJ3b7UaKok").get();
  // }
  var collection = FirebaseFirestore.instanceFor(app: app).collection("Admin");

  addUser() async {
    collection.add(
      {
        "username": "aquarat",
        "email": "aqr@gmail.com",
        "time": 45,
        "calories": 2000,
        "bmi": 20.00
      }
    );
  } 
}