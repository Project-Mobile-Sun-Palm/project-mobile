class BmiController {
  late double _bmi;
  late String _health;

  BmiController(double bmi) {
    this._bmi = bmi;
    this._health = "Normal";

    if (bmi > 40)
      _health = "Morbid Obesity";
    else if (bmi > 30)
      _health = "Obesity";
    else if (bmi > 24)
      _health = "Overweight";
    else if (bmi > 18.5)
      _health = "Normal Weight";
    else
      _health = "Under Weight";
  }

  double getBMI() {
    return _bmi;
  }

  String getHealth() {
    return _health;
  }
}
