import 'package:flutter/material.dart';
import "package:project/controllers/font_controller.dart";
import 'package:stroke_text/stroke_text.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

class WorkoutWithTime extends StatefulWidget {
  final String name;
  final int todo;
  final int set;
  final int restTime;
  final String image;
  final int length;
  var path;

  WorkoutWithTime(
      {super.key,
      required this.name,
      required this.todo,
      required this.set,
      required this.restTime,
      required this.length,
      required this.path,
      required this.image});

  @override
  State<WorkoutWithTime> createState() => _WorkoutWithTimeState();
}

class _WorkoutWithTimeState extends State<WorkoutWithTime> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        createPic(widget.image, context),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.0275,
        ),
        Text(
          widget.name,
          style: TextStyle(
              fontSize: defineFont(widget.name, context, 20),
              fontWeight: FontWeight.bold),
        ),
        countDown(context, widget.restTime, widget.length, widget.path)
      ],
    );
  }
}

//-------------------------------------------------------------

class WorkoutWithoutTime extends StatelessWidget {
  final String name;
  final int todo;
  final int set;
  final int restTime;
  final int length;
  final String image;

  const WorkoutWithoutTime(
      {super.key,
      required this.name,
      required this.todo,
      required this.set,
      required this.restTime,
      required this.length,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        createPic(image, context),
        const SizedBox(
          height: 20,
        ),
        Text(
          name,
          style: TextStyle(
              fontSize: defineFont(name, context, 20),
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "x ${todo.toString()}",
          style: const TextStyle(fontSize: 45),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

//-------------------------------------------------------------

class Rest extends StatefulWidget {
  final String name;
  final int todo;
  final int set;
  final int restTime;
  final String image;
  final int length;
  var path;

  Rest(
      {super.key,
      required this.name,
      required this.todo,
      required this.set,
      required this.restTime,
      required this.length,
      required this.path,
      required this.image});

  @override
  State<Rest> createState() => _RestState();
}

class _RestState extends State<Rest> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        createPicStack(widget.name, widget.image, context),
        const Text(
          "Rest",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 20,
        ),
        countDown(context, widget.restTime, widget.length, widget.path)
      ],
    );
  }
}

//-------------------------------------------------------------

SizedBox createPic(String image, var context) {
  return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width * 1.0,
      child: ClipRRect(
        child: Image.network(image, fit: BoxFit.cover),
      ));
}

Stack createPicStack(String name, String image, var context) {
  return Stack(
    children: [
      SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
          width: MediaQuery.of(context).size.width * 1.0,
          child: ClipRRect(
            child: Image.network(image, fit: BoxFit.cover),
          )),
      Padding(
        padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
        child: StrokeText(
          text: name,
          textStyle: TextStyle(
              color: Colors.white, fontSize: defineFont(name, context, 20)),
          strokeColor: Colors.black,
          strokeWidth: 5,
        ),
      ),
    ],
  );
}

Widget countDown(var context, int restTime, int length, var path) {
  return CircularCountDownTimer(
    duration: restTime,
    initialDuration: 0,
    controller: CountDownController(),
    width: MediaQuery.of(context).size.width / 4,
    height: MediaQuery.of(context).size.height / 4,
    ringColor: Colors.grey[300]!,
    ringGradient: null,
    fillColor: Colors.purpleAccent[100]!,
    fillGradient: null,
    backgroundColor: Colors.purple[500],
    backgroundGradient: null,
    strokeWidth: 20.0,
    strokeCap: StrokeCap.round,
    textStyle: TextStyle(
        fontSize: 33.0, color: Colors.white, fontWeight: FontWeight.bold),
    textFormat: CountdownTextFormat.S,
    isReverse: false,
    isReverseAnimation: false,
    isTimerTextShown: true,
    autoStart: true,
    onStart: () {
      // debugPrint('Countdown Started');
    },
    onComplete: () {
      // debugPrint('Countdown Ended');
      // try{
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => path));
      // }catch(e){

      // }
    },
    onChange: (String timeStamp) {
      // debugPrint('Countdown Changed $timeStamp');
    },
    timeFormatterFunction: (defaultFormatterFunction, duration) {
      if (duration.inSeconds == 0) {
        return "Start";
      } else {
        return Function.apply(defaultFormatterFunction, [duration]);
      }
    },
  );
}
