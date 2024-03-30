class User {
  late int _userId;
  late String _username;
  late String _email;
  late String _password;
  late int _time;
  late int _calories;
  late int _bmi;

  User(this._userId, this._username, this._email, this._password) {
    this._time = 0;
    this._bmi = 0;
    this._calories = 0;
  }

  int getUserId() {
    return _userId;
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

  int getBMI() {
    return _bmi;
  }

}
