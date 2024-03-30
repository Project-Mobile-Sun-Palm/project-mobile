import 'package:cloud_firestore/cloud_firestore.dart';

class Account {
  late String _username;
  late String _email;
  late String _password;
  late int _time;
  late int _calories;
  late double _bmi;

  Account(this._username, this._email, this._password) {
    this._time = 0;
    this._bmi = 0;
    this._calories = 0;
  }

  toJson() {
    return {
      "bmi": _bmi,
      "calories": _calories,
      "email": _email,
      "time": _time,
      "username": _username,
    };
  }

  factory Account.fromSnapshot(var documentSnapshot) {
    final data = documentSnapshot.data();
    return Account(
      data?["username"],
      data?["email"],
      data?["password"]
    );
  }
  
  String getUsername() {
    return _username;
  }

  String getEmail() {
    return _email;
  }

  int getTime() {
    return _time;
  }

  int getCalories() {
    return _calories;
  }

  double getBMI() {
    return _bmi;
  }

}
