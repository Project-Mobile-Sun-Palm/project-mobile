import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project/models/cardios.dart';
import 'package:project/main.dart';

const String CARDIO_COLLECTION_REF = "Cardio";

class CardioDBService{
  final _firestore = FirebaseFirestore.instanceFor(app: app);
  late final CollectionReference _cardioRef;

  CardioDBService(){
    _cardioRef = fireStore.collection(CARDIO_COLLECTION_REF).withConverter<Cardio>(
      fromFirestore: (snapshots, _) => Cardio.fromJson(
        snapshots.data()!,
      ),
      toFirestore: (cardio, _) => cardio.toJson());
  }

  Stream<QuerySnapshot> getCardio() {
    return _cardioRef.snapshots();
  }

  Future<String?> getName(String docName) async {
    try {
      var snapshot = await _cardioRef.doc(docName).get();
      if (snapshot.exists) {
        var cardioData = snapshot.data();
        if (cardioData != null) {
          var cardio = cardioData as Cardio;
          return cardio.getName();
        }
      }
    } catch (e) {
      print("Error getting cardio name: $e");
    }
    return null;
  }

  Future<String?> getDescription(String docName) async {
    try {
      var snapshot = await _cardioRef.doc(docName).get();
      if (snapshot.exists) {
        var cardioData = snapshot.data();
        if (cardioData != null) {
          var cardio = cardioData as Cardio;
          return cardio.getDescription();
        }
      }
    } catch (e) {
      print("Error getting description: $e");
    }
    return null;
  }

    Future<int?> getRestTime(String docName) async {
    try {
      var snapshot = await _cardioRef.doc(docName).get();
      if (snapshot.exists) {
        var cardioData = snapshot.data();
        if (cardioData != null) {
          var cardio = cardioData as Cardio;
          return cardio.getRestTime();
        }
      }
    } catch (e) {
      print("Error getting rest time: $e");
    }
    return null;
  }

    Future<String?> getRestTimeAsString(String docName) async {
    try {
      var snapshot = await _cardioRef.doc(docName).get();
      if (snapshot.exists) {
        var cardioData = snapshot.data();
        if (cardioData != null) {
          var cardio = cardioData as Cardio;
          return cardio.getRestTimeAsString();
        }
      }
    } catch (e) {
      print("Error getting rest time string: $e");
    }
    return null;
  }

  void addCardio(Cardio cardio) async {
    _cardioRef.add(cardio);
  }

  Future<double?> getCalories(String docName) async {
    try {
      var snapshot = await _cardioRef.doc(docName).get();
      if (snapshot.exists) {
        var cardioData = snapshot.data();
        if (cardioData != null) {
          var cardio = cardioData as Cardio;
          return cardio.getCalories();
        }
      }
    } catch (e) {
      print("Error getting calories: $e");
    }
    return null;
  }
}
