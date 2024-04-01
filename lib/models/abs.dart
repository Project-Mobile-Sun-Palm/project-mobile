class Abs{
  late String _name;
  late int _todo;
  late int _set;
  late int _restTime;
  late String _imageKey;

  Abs(this._name, this._todo, this._set, this._restTime);
  Abs.withKey(this._name, this._todo, this._set, this._restTime, this._imageKey);

  Abs.fromJson(Map<String, Object?> json){
    _name = json['name'] as String;
    _todo = json['todo'] as int;
    _set = json['set'] as int;
    _restTime = json['restTime'] as int;
    _imageKey = json['imageKey'] as String;
  }

  Abs copyWith(String? name, int? todo, int? set, int? restTime){
    return Abs(
      name ?? _name,
      todo ?? _todo,
      set ?? _set,
      restTime ?? _restTime,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'name': _name,
      'todo': _todo,
      'set': _set,
      'restTime': _restTime,
      'imageKey': _imageKey,
    };
  }

  String getName(){
    return _name;
  }

  void setName(String? name){
    _name = name ?? _name;
  }

  String getRestTimeAsString(){
    return "Rest $_restTime seconds";
  }

  int getRestTime(){
    return _restTime;
  }

  void setRestTime(int? restTime){
    _restTime = restTime ?? _restTime;
  }

  String getworkoutTimeAsString(){
    return "Rest $_restTime seconds";
  }

  int getSet(){
    return _set;
  }

  void setSet(int? set){
    _set = set ?? _set;
  }

  int getToDo(){
    return _todo;
  }

  void setToDo(int? todo){
    _todo = todo ?? _todo;
  }

  String getImageKey(){
    return _imageKey;
  }

  String getDescription(){
    return "do $_todo times/$_set sets";
  }
}