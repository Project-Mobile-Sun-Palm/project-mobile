import 'package:flutter/material.dart';
import 'package:project/services/database_images.dart';
import 'package:project/services/database_exercies.dart';
import 'package:project/models/exercise.dart';
import 'package:project/models/images.dart';
import 'package:project/views/menu/course/strength/strength_workout.dart';
import 'package:project/views/menu/course/workout/workout_screen.dart';
import 'package:project/controllers/font_controller.dart';
import 'package:loading_indicator/loading_indicator.dart';


class StrengthRest extends StatefulWidget {
  StrengthRest() {
    this.length = 0;
    this.set = 0;
  }
  StrengthRest.withIndex(this.length, this.set);

  late int length;
  late int set;

  @override
  State<StrengthRest> createState() => _StrengthRestState();
}

class _StrengthRestState extends State<StrengthRest> {
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
          Exercise exerciseNext = exercises[widget.length].data();

          if (widget.set == exercise.getSet()-1) {
            exerciseNext = exercises[widget.length + 1].data();
          }

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
                  Images checkImg = element.data();
                  print("IMG: ${checkImg.getName()}");
                  if (element.id == exerciseNext.getImageKey()) {
                    return true;
                  } else {
                    return false;
                  }
                }).data();

                return Column(
                  children: [
                    Container(
                        child: Rest(
                      name: exerciseNext.getName(),
                      todo: exercise.getToDo(),
                      set: exercise.getSet(),
                      restTime: exercise.getRestTime(),
                      length: widget.length,
                      path: (widget.set == exercise.getSet() - 1 && widget.length != exercises.length - 1)
                          ? StrengthWorkout.withIndex(widget.length + 1, 0)
                          : StrengthWorkout.withIndex(
                              widget.length, widget.set + 1),
                      image: image.getUrl(),
                    )),
                    InkWell(
                      onTap: () {
                        if (widget.length == exercises.length - 1 && widget.set == exercise.getSet()) {
                        } else {
                          if (widget.set >= exercise.getSet()-1) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        StrengthWorkout.withIndex(
                                            widget.length + 1, 0)));
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        StrengthWorkout.withIndex(
                                            widget.length, widget.set+1)));
                          }
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
                          "Skip",
                          style: TextStyle(
                            fontSize: defineFont("Skip", context, 15),
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
