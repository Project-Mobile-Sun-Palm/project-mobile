import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project/models/timer.dart';
import 'package:project/main.dart';

const String TIMER_COLLECTION_REF = "Timer";

class TimerDBService{
  final _firestore = FirebaseFirestore.instanceFor(app: app);

  late final CollectionReference _timerRef;

  TimerDBService(){
    _timerRef =
        _firestore.collection(TIMER_COLLECTION_REF).withConverter<Timer>(
            fromFirestore: (snapshots, _) => Timer.fromJson(
                  snapshots.data()!,
                ),
            toFirestore: (timer, _) => timer.toJson());
  }

  Stream<QuerySnapshot> getTimer() {
    return _timerRef.snapshots();
  }

  void updateTimer(String accountID, Timer timer) {
    _timerRef.doc(accountID).update(timer.toJson());
  }



  addTimer(Timestamp begin, Timestamp finish) async {
    final data1 = <String, dynamic>{
      "begin": begin,
      "finish": finish
    };
    _firestore.collection("Timer").doc(auth.currentUser!.uid).set(data1);
  }

  Future<Timer?> getAll(String userId) async {
    try {
      var snapshot = await _timerRef.doc(userId).get();
      if (snapshot.exists) {
        var timerData = snapshot.data();
        if (timerData != null) {
          var timer = timerData as Timer;
          return timer;
        }
      }
    } catch (e) {
      print("Error getting timer: $e");
    }
    return null;
  }


  Future<Timestamp?> getBegin(String userId) async {
    try {
      var snapshot = await _timerRef.doc(userId).get();
      if (snapshot.exists) {
        var timerData = snapshot.data();
        if (timerData != null) {
          var timer = timerData as Timer;
          return timer.getBegin();
        }
      }
    } catch (e) {
      print("Error getting begin: $e");
    }
    return null;
  }

  Future<Timestamp?> getFinish(String userId) async {
    try {
      var snapshot = await _timerRef.doc(userId).get();
      if (snapshot.exists) {
        var timerData = snapshot.data();
        if (timerData != null) {
          var timer = timerData as Timer;
          return timer.getFinish();
        }
      }
    } catch (e) {
      print("Error getting Finish: $e");
    }
    return null;
  }

  void updateBegin(String accountID, Timestamp begin){
    getAll(accountID).then((value) => {
      value?.setBegin(begin),
      updateTimer(accountID, value ?? Timer(begin, begin))
    });
  }

  bool updateFinish(String accountID, Timestamp finish){
    bool check = false;
    getAll(accountID).then((value) => {
      value?.setFinish(finish),
      updateTimer(accountID, value ?? Timer(finish, finish)),
      check = true
    });
    return check;
  }

}