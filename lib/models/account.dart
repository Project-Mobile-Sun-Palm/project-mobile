class Account {
  late String _username;
  late String _email;
  late double _time;
  late double _calories;
  late double _bmi;
  late String _imagePath;
  late String _historyKey;

  Account(this._username, this._email) {
    this._time = 0;
    this._bmi = 0;
    this._calories = 0;
    this._imagePath = "";
    this._historyKey = "";
  }

  Account.withAllData(String? username, String? email, double? time,
      double? bmi, double? calories, String ? impagePath, String ? historyKey) {
    username ?? _username;
    email ?? _email;
    time ?? _time;
    bmi ?? _bmi;
    calories ?? _calories;
    impagePath ?? _imagePath;
    historyKey ?? _historyKey;
  }

  Account.fromJson(Map<String, Object?> json) {
    _username = json['username'] as String;
    _email = json['email'] as String;
    _imagePath = json['imagePath'] as String;
    _historyKey = json['historyKey'] as String;
 
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

    if (json['bmi'].toString().contains(".")) {
      _bmi = json['bmi'] as double;
    } else {
      int number = json['bmi'] as int;
      _bmi = number * 1.0;
    }
    
  }

  Account copyWith(String? username, String? email, double? time, double? bmi,
      double? calories, String? imagePath, String? historyKey) {
    return Account.withAllData(username ?? _username, email ?? _email,
        time ?? _time, bmi ?? _bmi, calories ?? _calories, imagePath ?? _imagePath, historyKey ?? _historyKey);
  }

  Map<String, Object?> toJson() {
    return {
      'username': _username,
      'email': _email,
      'time': _time,
      'calories': _calories,
      'bmi': _bmi,
      'imagePath': _imagePath,
      'historyKey': _historyKey
    };
  }

  String getUsername() {
    return _username;
  }

  String getEmail() {
    return _email;
  }

  double getTime() {
    return _time;
  }

  double getCalories() {
    return _calories;
  }

  void setCalories(double? calorires){
    _calories += calorires ?? 0;
  }

  double getBmi() {
    return _bmi;
  }

  String getImagePath() {
    return _imagePath;
  }

  String getHistoryKey() {
    return _historyKey;
  }

  void setUsername(String username) {
    _username = username;
  }

  void setBMI(double bmi) {
    _bmi = bmi;
  }

  void setTime(double? time){
    _time += time ?? 0;
  }
  
  void setImage(String image) {
    _imagePath = image;
  }

  void setHistoryKey(String historyKey) {
    _historyKey = historyKey;
  }

}
