import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project/main.dart';

class SignUpController {
  var collection = FirebaseFirestore.instanceFor(app: app).collection("User");
  var data;

  addData(String username, String email, double bmi, double time, double calories, String imagePath, String historyKey) async {
    final data1 = <String, dynamic>{
      "username": username,
      "email": email,
      "bmi": bmi,
      "time":  time,
      "calories": calories,
      "imagePath": imagePath,
      "historyKey": historyKey
    };
    collection.doc(auth.currentUser!.uid).set(data1);
  }
}
