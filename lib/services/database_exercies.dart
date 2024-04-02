import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project/models/exercise.dart';
import 'package:project/main.dart';

const String EXERCISE_COLLECTION_REF = "Exercise";

class ExerciseDBService{
  final _firestore = FirebaseFirestore.instanceFor(app: app);
  late final CollectionReference _exerciseRef;

  ExerciseDBService(){
    _exerciseRef = fireStore.collection(EXERCISE_COLLECTION_REF).withConverter<Exercise>(
      fromFirestore: (snapshots, _) => Exercise.fromJson(
        snapshots.data()!,
      ),
      toFirestore: (exercise, _) => exercise.toJson());
  }

  Stream<QuerySnapshot> getExercise() {
    return _exerciseRef.snapshots();
  }

  Future<String?> getName(String docName) async {
    try {
      var snapshot = await _exerciseRef.doc(docName).get();
      if (snapshot.exists) {
        var exerciseData = snapshot.data();
        if (exerciseData != null) {
          var exercise = exerciseData as Exercise;
          return exercise.getName();
        }
      }
    } catch (e) {
      print("Error getting exercise name: $e");
    }
    return null;
  }

  Future<String?> getDescription(String docName) async {
    try {
      var snapshot = await _exerciseRef.doc(docName).get();
      if (snapshot.exists) {
        var exerciseData = snapshot.data();
        if (exerciseData != null) {
          var exercise = exerciseData as Exercise;
          return exercise.getDescription();
        }
      }
    } catch (e) {
      print("Error getting description: $e");
    }
    return null;
  }

    Future<String?> getRestTime(String docName) async {
    try {
      var snapshot = await _exerciseRef.doc(docName).get();
      if (snapshot.exists) {
        var exerciseData = snapshot.data();
        if (exerciseData != null) {
          var exercise = exerciseData as Exercise;
          return exercise.getRestTimeAsString();
        }
      }
    } catch (e) {
      print("Error getting rest time: $e");
    }
    return null;
  }

  void addExercise(Exercise exercise) async {
    _exerciseRef.add(exercise);
  }

  Future<double?> getCalories(String docName) async {
    try {
      var snapshot = await _exerciseRef.doc(docName).get();
      if (snapshot.exists) {
        var exerciseData = snapshot.data();
        if (exerciseData != null) {
          var exercise = exerciseData as Exercise;
          return exercise.getCalories();
        }
      }
    } catch (e) {
      print("Error getting calories: $e");
    }
    return null;
  }
}