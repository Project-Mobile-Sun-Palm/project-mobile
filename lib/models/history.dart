import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class History {
  late Timestamp _date;
  late String _name;
  late double _time;
  late double _calories;

  History(this._name, this._time, this._calories) {
    _date = Timestamp.now();
  }

  History.withAllData(Timestamp? date, String? name, double? time, double? calories) {
    date ?? _date;
    name ?? _name;
    time ?? _time;
    calories ?? _calories;
  }

  History.fromJson(Map<String, Object?> json) {
    _date = json['date'] as Timestamp;
    _name = json['name'] as String;

    if (json['time'].toString().contains(".")) {
      _time = json['time'] as double;
    } else {
      int number = json['time'] as int;
      _time = number * 1.0;
    }

    if (json['calories'].toString().contains(".")) {
      _calories = json['calories'] as double;
    } else {
      int number = json['calories'] as int;
      _calories = number * 1.0;
    }
  }

  History copyWith(Timestamp? date, String? name, double? time, double? calories) {
    return History.withAllData(
    date ?? _date,
    name ?? _name,
    time ?? _time,
    calories ?? _calories,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'date': _date,
      'name': _name,
      'time': _time,
      'calories': _calories,
    };
  }

  Timestamp getDate() {
    return _date;
  }

  String getName() {
    return _name;
  }

  double getTime() {
    return _time;
  }

  double getCalories() {
    return _calories;
  }

  void setDate(Timestamp date) {
    _date = date;
  }

  void setName(String name) {
    _name = name;
  }

  void setTime(double time){
    _time = time;
  }

  void setCalories(double calorires){
    _calories = calorires;
  }

}
