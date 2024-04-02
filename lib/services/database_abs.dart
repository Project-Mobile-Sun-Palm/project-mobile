import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project/models/abs.dart';
import 'package:project/main.dart';

const ABS_COLLECTION_REF = "Abs";

class AbsDBService{
  late final CollectionReference _absRef;

  AbsDBService(){
    _absRef = fireStore.collection(ABS_COLLECTION_REF).withConverter<Abs>(
      fromFirestore: (snapshots, _) => Abs.fromJson(
        snapshots.data()!,
      ),
      toFirestore: (abs, _) => abs.toJson());
  }

  Stream<QuerySnapshot> getAbs() {
    return _absRef.snapshots();
  }

  Future<String?> getName(String docName) async {
    try {
      var snapshot = await _absRef.doc(docName).get();
      if (snapshot.exists) {
        var absData = snapshot.data();
        if (absData != null) {
          var abs = absData as Abs;
          return abs.getName();
        }
      }
    } catch (e) {
      print("Error getting Abs name: $e");
    }
    return null;
  }

  Future<String?> getDescription(String docName) async {
    try {
      var snapshot = await _absRef.doc(docName).get();
      if (snapshot.exists) {
        var absData = snapshot.data();
        if (absData != null) {
          var abs = absData as Abs;
          return abs.getDescription();
        }
      }
    } catch (e) {
      print("Error getting description: $e");
    }
    return null;
  }

  Future<int?> getRestTime(String docName) async {
    try {
      var snapshot = await _absRef.doc(docName).get();
      if (snapshot.exists) {
        var absData = snapshot.data();
        if (absData != null) {
          var abs = absData as Abs;
          return abs.getRestTime();
        }
      }
    } catch (e) {
      print("Error getting rest time: $e");
    }
    return null;
  }

  Future<String?> getRestTimeAsString(String docName) async {
    try {
      var snapshot = await _absRef.doc(docName).get();
      if (snapshot.exists) {
        var absData = snapshot.data();
        if (absData != null) {
          var abs = absData as Abs;
          return abs.getRestTimeAsString();
        }
      }
    } catch (e) {
      print("Error getting rest time string: $e");
    }
    return null;
  }

  Future<int?> getToDo(String docName) async {
    try {
      var snapshot = await _absRef.doc(docName).get();
      if (snapshot.exists) {
        var absData = snapshot.data();
        if (absData != null) {
          var abs = absData as Abs;
          return abs.getToDo();
        }
      }
    } catch (e) {
      print("Error getting todo: $e");
    }
    return null;
  }

  void addAbs(Abs Abs) async {
    _absRef.add(Abs);
  }

  Future<double?> getCalories(String docName) async {
    try {
      var snapshot = await _absRef.doc(docName).get();
      if (snapshot.exists) {
        var absData = snapshot.data();
        if (absData != null) {
          var abs = absData as Abs;
          return abs.getCalories();
        }
      }
    } catch (e) {
      print("Error getting calories: $e");
    }
    return null;
  }
}
