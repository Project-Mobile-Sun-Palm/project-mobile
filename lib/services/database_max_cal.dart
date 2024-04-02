import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:project/models/max_calories.dart';
import 'package:project/main.dart';

const String MAXCAL_COLLECTION_REF = "MaxCalories";

class DatabaseMaxCal {
  final _firestore = FirebaseFirestore.instanceFor(app: app);
  // final _storage = FirebaseStorage.instanceFor(app: app);

  late final CollectionReference _MaxCalRef;

  DatabaseMaxCal() {
    _MaxCalRef =
        _firestore.collection(MAXCAL_COLLECTION_REF).withConverter<MaxCalories>(
            fromFirestore: (snapshots, _) => MaxCalories.fromJson(
                  snapshots.data()!,
                ),
            toFirestore: (MaxCal, _) => MaxCal.toJson());
  }

  Stream<QuerySnapshot> getHistories() {
    return _MaxCalRef.snapshots();
  }

  void addMaxCal(MaxCalories MaxCal) async {
    _MaxCalRef.add(MaxCal);
  }

  void deleteMaxCal(String MaxCalID) {
    _MaxCalRef.doc(MaxCalID).delete();
  }

  Future<MaxCalories?> getAll(String MaxCalId) async {
    try {
      var snapshot = await _MaxCalRef.doc(MaxCalId).get();
      if (snapshot.exists) {
        var MaxCalData = snapshot.data();
        if (MaxCalData != null) {
          var MaxCal = MaxCalData as MaxCalories;
          return MaxCal;
        }
      }
    } catch (e) {
      print("Error getting username: $e");
    }
    return null;
  }

  Future<double?> getMaxCalories(String MaxCalId) async {
    try {
      var snapshot = await _MaxCalRef.doc(MaxCalId).get();
      if (snapshot.exists) {
        var MaxCalData = snapshot.data();
        if (MaxCalData != null) {
          var maxCal = MaxCalData as MaxCalories;
          return maxCal
              .getMaxCalories();
        }
      }
    } catch (e) {
      print("Error getting username: $e");
    }
    return null;
  }

  addData(double maxCal) async {
    var collection = FirebaseFirestore.instanceFor(app: app).collection("MaxCalories");
    final data1 = <String, dynamic>{
      "maxCalories": maxCal,
    };
    collection.doc(auth.currentUser!.uid).set(data1);
  }

}
