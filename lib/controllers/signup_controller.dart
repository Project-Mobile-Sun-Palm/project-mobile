import 'package:flutter/material.dart';
import 'package:project/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project/main.dart';
import 'package:project/models/account.dart';

class SignUpController {
  var collection = FirebaseFirestore.instanceFor(app: app).collection("User");
  var data;

  addData(String username, String email, double bmi, double time, double calories) async {
    final data1 = <String, dynamic>{
      "username": username,
      "email": email,
      "bmi": bmi,
      "time":  time,
      "calories": calories,
    };
    collection.doc(auth.currentUser!.uid).set(data1);
  }
}