import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project/main.dart';

class HistoryController {
  var collection = FirebaseFirestore.instanceFor(app: app).collection("History");
  var data;

  addData(Timestamp date, String name, double time, double calories) async {
    final data1 = <String, dynamic>{
      "date": date,
      "name": name,
      "time": time,
      "calories": calories
    };
    collection.doc(auth.currentUser!.uid).set(data1);
  }
}
