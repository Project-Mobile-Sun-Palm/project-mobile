class Exercise{
  late String _name;
  late String _description;
  late int _restTime;

  Exercise(this._name, this._description, this._restTime);

  Exercise.fromJson(Map<String, Object?> json){
    _name = json['name'] as String;
    _description = json['description'] as String;
    _restTime = json['restTime'] as int;
  }

  Exercise copyWith(String? name, String? description, int? restTime){
    return Exercise(
      name ?? _name,
      description ?? _description,
      restTime ?? _restTime
    );
  }

  Map<String, Object?> toJson() {
    return {
      'name': _name,
      'description': _description,
      'restTime': _restTime
    };
  }

  String getName(){
    return _name;
  }

  void setName(String? name){
    _name = name ?? _name;
  }

  String getDescription(){
    return _description;
  }

  void setDescription(String? description){
    _description = description ?? _description;
  }

  String getRestTime(){
    return "Rest $_restTime seconds";
  }

  void setRestTime(int? restTime){
    _restTime = restTime ?? _restTime;
  }
}