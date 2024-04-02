class MaxCalories{
  late double _maxCal;

  MaxCalories(this._maxCal);

  MaxCalories.fromJson(Map<String, Object?> json){
    if (json['maxCalories'].toString().contains(".")) {
      _maxCal = json['maxCalories'] as double;
    } else {
      int maxCal = json['maxCalories'] as int;
      _maxCal = maxCal * 1.0;
    }
  }

  MaxCalories copyWith(double? maxCal){
    return MaxCalories(
      maxCal ?? _maxCal,
      
    );
  }

  Map<String, Object?> toJson() {
    return {
      'maxCalories': _maxCal,
    };
  }

  double getMaxCalories() {
    return _maxCal;
  }
}