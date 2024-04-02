import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:project/models/history.dart';
import 'package:project/main.dart';

const String History_COLLECTION_REF = "History";

class DatabaseHistory {
  final _firestore = FirebaseFirestore.instanceFor(app: app);
  // final _storage = FirebaseStorage.instanceFor(app: app);

  late final CollectionReference _historyRef;

  DatabaseHistory() {
    _historyRef =
        _firestore.collection(History_COLLECTION_REF).withConverter<History>(
            fromFirestore: (snapshots, _) => History.fromJson(
                  snapshots.data()!,
                ),
            toFirestore: (history, _) => history.toJson());
  }

  Stream<QuerySnapshot> getHistories() {
    return _historyRef.snapshots();
  }

  void addHistory(History history) async {
    _historyRef.add(history);
  }



  void deleteHistory(String HistoryID) {
    _historyRef.doc(HistoryID).delete();
  }

  Future<History?> getAll(String historyId) async {
    try {
      var snapshot = await _historyRef.doc(historyId).get();
      if (snapshot.exists) {
        var historyData = snapshot.data();
        if (historyData != null) {
          var history = historyData as History;
          return history;
        }
      }
    } catch (e) {
      print("Error getting username: $e");
    }
    return null;
  }

  Future<Timestamp?> getDate(String historyId) async {
    try {
      var snapshot = await _historyRef.doc(historyId).get();
      if (snapshot.exists) {
        var historyData = snapshot.data();
        if (historyData != null) {
          var history = historyData as History;
          return history
              .getDate();
        }
      }
    } catch (e) {
      print("Error getting username: $e");
    }
    return null;
  }

  Future<String?> getName(String historyId) async {
    try {
      var snapshot = await _historyRef.doc(historyId).get();
      if (snapshot.exists) {
        var historyData = snapshot.data();
        if (historyData != null) {
          var history = historyData as History;
          return history
              .getName();
        }
      }
    } catch (e) {
      print("Error getting username: $e");
    }
    return null;
  }

  Future<double?> getTime(String historyId) async {
    try {
      var snapshot = await _historyRef.doc(historyId).get();
      if (snapshot.exists) {
        var historyData = snapshot.data();
        if (historyData != null) {
          var history = historyData as History;
          return history
              .getTime();
        }
      }
    } catch (e) {
      print("Error getting username: $e");
    }
    return null;
  }

  Future<double?> getCalories(String historyId) async {
    try {
      var snapshot = await _historyRef.doc(historyId).get();
      if (snapshot.exists) {
        var historyData = snapshot.data();
        if (historyData != null) {
          var history = historyData as History;
          return history
              .getCalories();
        }
      }
    } catch (e) {
      print("Error getting username: $e");
    }
    return null;
  }

}
