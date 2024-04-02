import 'package:flutter/material.dart';
import 'package:project/services/database_abs.dart';
import 'package:project/services/database_images.dart';
import 'package:project/services/database_abs.dart';
import 'package:project/models/abs.dart';
import 'package:project/models/images.dart';
import 'package:project/views/menu/course/workout/workout_screen.dart';
import 'package:project/controllers/font_controller.dart';
import 'package:project/views/menu/course/abs/abs_rest.dart';

class AbsWorkout extends StatefulWidget {
  AbsWorkout() {
    this.length = 0;
    this.set = 0;
  }
  AbsWorkout.withIndex(this.length, this.set);

  late int length;
  late int set;

  @override
  State<AbsWorkout> createState() => _AbsWorkoutState();
}

class _AbsWorkoutState extends State<AbsWorkout> {
  ImagesDBService imagesDBService = ImagesDBService();
  AbsDBService absDBService = AbsDBService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: StreamBuilder(
        stream: absDBService.getAbs(),
        builder: ((context, snapshot) {
          List abss = snapshot.data?.docs ?? [];

          if (abss.isEmpty) {
            return const Center(
              child: const Text("Please add some abss"),
            );
          }
          //UI

          Abs abs = abss[widget.length].data();

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
                  if (element.id == abs.getImageKey()) {
                    return true;
                  } else {
                    return false;
                  }
                }).data();

                return Column(
                  children: [
                    Container(
                        child: WorkoutWithoutTime(
                      name: abs.getName(),
                      todo: abs.getToDo(),
                      set: abs.getSet(),
                      restTime: abs.getRestTime(),
                      length: widget.length,
                      image: image.getUrl(),
                    )),
                    InkWell(
                      onTap: () {
                        if (widget.length == abss.length - 1 && widget.set == abs.getSet()-1) {
                          Navigator.pushNamed(context, '/menu_screen');
                        } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        AbsRest.withIndex(
                                            widget.length, widget.set)));
                          
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
