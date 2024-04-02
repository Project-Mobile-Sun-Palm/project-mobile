import 'package:flutter/material.dart';
import 'package:project/main.dart';
import 'package:project/services/database_images.dart';
import 'package:project/services/database_exercies.dart';
import 'package:project/services/database_timer.dart';
import 'package:project/models/exercise.dart';
import 'package:project/models/images.dart';
import 'package:project/views/menu/course/workout/before_finish.dart';
import 'package:project/views/menu/course/workout/workout_screen.dart';
import 'package:project/controllers/font_controller.dart';
import 'package:project/views/menu/course/strength/strength_rest.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:project/services/database_users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StrengthWorkout extends StatefulWidget {
  StrengthWorkout() {
    this.length = 0;
    this.set = 0;
    this.calories = 0;
    this.name = "Strength";
  }
  StrengthWorkout.withIndex(this.length, this.set, this.calories, this.name);

  late int length;
  late int set;
  late double calories;
  late String name;

  @override
  State<StrengthWorkout> createState() => _StrengthWorkoutState();
}

class _StrengthWorkoutState extends State<StrengthWorkout> {
  ImagesDBService imagesDBService = ImagesDBService();
  ExerciseDBService exerciseDBService = ExerciseDBService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: StreamBuilder(
        stream: exerciseDBService.getExercise(),
        builder: ((context, snapshot) {
          List exercises = snapshot.data?.docs ?? [];

          if (exercises.isEmpty) {
            return const Center(
                child: LoadingIndicator(
              indicatorType: Indicator.circleStrokeSpin,
              colors: [Colors.red],
              strokeWidth: 2,
            ));
          }
          //UI

          Exercise exercise = exercises[widget.length].data();

          return StreamBuilder(
              stream: imagesDBService.getImage(),
              builder: (context, snapshot) {
                List images = snapshot.data?.docs ?? [];
                if (images.isEmpty) {
                  return const Center(
                      child: LoadingIndicator(
                    indicatorType: Indicator.circleStrokeSpin,
                    colors: [Colors.red],
                    strokeWidth: 2,
                  ));
                }

                Images image = images.firstWhere((element) {
                  if (element.id == exercise.getImageKey()) {
                    return true;
                  } else {
                    return false;
                  }
                }).data();

                if (widget.length == 0 && widget.set == 0) {
                  TimerDBService()
                      .updateBegin(auth.currentUser!.uid, Timestamp.now());
                }

                return Column(
                  children: [
                    Container(
                        child: WorkoutWithoutTime(
                      name: exercise.getName(),
                      todo: exercise.getToDo(),
                      set: exercise.getSet(),
                      restTime: exercise.getRestTime(),
                      length: widget.length,
                      image: image.getUrl(),
                    )),
                    InkWell(
                      onTap: () {
                        DatabaseUser().updateCalories(
                            auth.currentUser!.uid, exercise.getCalories());
                        widget.calories += exercise.getCalories();
                        if (widget.length == exercises.length - 1 &&
                            widget.set == exercise.getSet() - 1) {
                          TimerDBService().updateFinish(auth.currentUser!.uid, Timestamp.now());
                          Navigator.push(
                            context, MaterialPageRoute(
                              builder: (context) => BeforeFinishScreen(calories: widget.calories, name: widget.name)));
                          
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => StrengthRest.withIndex(
                                      widget.length, widget.set, widget.calories, widget.name)));
                        }
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: const BoxDecoration(
                            color: Colors.orange,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Center(
                            child: Text(
                          "Done",
                          style: TextStyle(
                            fontSize: defineFont("Done", context, 15),
                          ),
                          textAlign: TextAlign.center,
                        )),
                      ),
                    )
                  ],
                );
              });
        }),
      ),
    );
  }
}
