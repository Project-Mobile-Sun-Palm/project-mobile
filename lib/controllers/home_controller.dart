import 'package:project/services/database_users.dart';

class HomeController {
  String _username;
  double _training_time;
  double _bmi;
  double _calories;

  var auth;
 
  HomeController(
      this._username, this._training_time, this._bmi, this._calories,this.auth) {
    DatabaseUser()
        .getUsername(auth.currentUser!.uid)
        .then((value) => {_username = value ?? "No user Name"});

    DatabaseUser()
        .getBmi(auth.currentUser!.uid)
        .then((value) => {_bmi = value ?? 0});

    DatabaseUser()
        .getCalories(auth.currentUser!.uid)
        .then((value) => {_calories = value ?? 0});

    DatabaseUser()
        .getTime(auth.currentUser!.uid)
        .then((value) => {_training_time = value ?? 0});
  }

  String getUsername() {
    return _username;
  }

  double getTraining() {
    return _training_time;
  }

  double getBMI() {
    return _bmi;
  }

  double getCalories() {
    return _calories;
  }
}
