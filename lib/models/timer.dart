import 'package:cloud_firestore/cloud_firestore.dart';

class Timer{
  late Timestamp _begin;
  late Timestamp _finish;
  
  Timer(this._begin, this._finish);
  
  Timer.fromJson(Map<String, Object?> json){
    _begin = json['begin'] as Timestamp;
    _finish = json['finish'] as Timestamp;
  }

  Map<String, Object?> toJson() {
    return {
      'begin': _begin,
      'finish': _finish,
    };
  }

  Timestamp getBegin(){
    return _begin;
  }

  Timestamp getFinish(){
    return _finish;
  }

  void setBegin(Timestamp? begin){
    _begin = begin ?? _begin;
  }

  void setFinish(Timestamp? finish){
    _finish = finish ?? _finish;
  }

}
