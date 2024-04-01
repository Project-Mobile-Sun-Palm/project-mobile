import 'package:flutter/material.dart';
import 'package:project/services/database_images.dart';
import 'package:project/services/database_exercies.dart';
import 'package:project/models/exercise.dart';
import 'package:project/models/images.dart';
import 'package:project/views/menu/course/workout/workout_screen.dart';
import 'package:project/controllers/font_controller.dart';
import 'package:project/views/menu/course/strength/strength_rest.dart';

class StrengthWorkout extends StatefulWidget {
  StrengthWorkout() {
    this.length = 0;
  }
  StrengthWorkout.withIndex(this.length);

  late int length;

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
              child: const Text("Please add some exercises"),
            );
          }
          //UI

          Exercise exercise = exercises[widget.length].data();

          return StreamBuilder(
              stream: imagesDBService.getImage(),
              builder: (context, snapshot) {
                List images = snapshot.data?.docs ?? [];
                if (images.isEmpty) {
                  return const Center(
                    child: const Text("Please add some image"),
                  );
                }

                Images image = images.firstWhere((element) {
                  Images checkImg = element.data();
                  if (element.id == exercise.getImageKey()) {
                    return true;
                  } else {
                    return false;
                  }
                }).data();

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
                        if (widget.length == exercises.length - 1) {
                          Navigator.pushNamed(context, '/menu_screen');
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => StrengthRest.withIndex(
                                      widget.length)));
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
                            // fontWeight: FontWeight.bold
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
