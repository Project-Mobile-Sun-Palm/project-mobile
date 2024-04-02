class TimeConverter{
  String toMinute(double seconds){
    if(((seconds/60).toInt()-(toHour(seconds) * 60)) < 10){
      return "0" + ((seconds/60).toInt()-(toHour(seconds) * 60)).toString();
    }
    return ((seconds/60).toInt()-(toHour(seconds) * 60)).toString();
  }

  int toHour(double seconds){
    return (seconds/3600).toInt();
  }

  int toSecond(double seconds){
    return (seconds%60).toInt();
  }

  String toHrStr(double seconds){
    if((seconds/3600).toInt() < 9){
      return "0" + (seconds/3600).toInt().toString();
    }
    return (seconds/3600).toInt().toString();
  }

  String toSecondStr(double seconds){
    if((seconds%60).toInt() < 9){
      return "0" + (seconds%60).toInt().toString();
    }
    return (seconds%60).toInt().toString();
  }
}