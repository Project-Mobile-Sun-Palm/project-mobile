import 'package:flutter/material.dart';
import 'package:project/services/database_images.dart';
import 'package:project/services/database_abs.dart';
import 'package:project/models/abs.dart';
import 'package:project/models/images.dart';
import 'package:project/views/menu/course/abs/abs_workout.dart';
import 'package:project/views/menu/course/workout/workout_screen.dart';
import 'package:project/controllers/font_controller.dart';
import 'package:loading_indicator/loading_indicator.dart';

class AbsRest extends StatefulWidget {
  AbsRest() {
    this.length = 0;
    this.set = 0;
    this.calories = 0;
  }
  AbsRest.withIndex(this.length, this.set, this.calories);
  
  late int length;
  late int set;
  late double calories;

  @override
  State<AbsRest> createState() => _AbsRestState();
}

class _AbsRestState extends State<AbsRest> {
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
            return Center(
                child: LoadingIndicator(
                    indicatorType: Indicator.circleStrokeSpin,
                    colors: const [Colors.red],
                    strokeWidth: 2,
                    ));
          }
          //UI

          Abs abs = abss[widget.length].data();
          Abs absNext = abss[widget.length].data();
          if (widget.set == abs.getSet() - 1) {
            absNext = abss[widget.length + 1].data();
          }

          return StreamBuilder(
              stream: imagesDBService.getImage(),
              builder: (context, snapshot) {
                List images = snapshot.data?.docs ?? [];
                if (images.isEmpty) {
            return Center(
                child: LoadingIndicator(
                    indicatorType: Indicator.circleStrokeSpin,
                    colors: const [Colors.red],
                    strokeWidth: 2,                    
                    ));
                }

                Images image = images.firstWhere((element) {
                  Images checkImg = element.data();
                  print("IMG: ${checkImg.getName()}");
                  if (element.id == absNext.getImageKey()) {
                    return true;
                  } else {
                    return false;
                  }
                }).data();

                return Column(
                  children: [
                    Container(
                        child: Rest(
                      name: absNext.getName(),
                      todo: abs.getToDo(),
                      set: abs.getSet(),
                      restTime: abs.getRestTime(),
                      length: abss.length,
                      path: (widget.set == abs.getSet() - 1 &&
                              widget.length != abss.length - 1)
                          ? AbsWorkout.withIndex(widget.length + 1, 0, widget.calories)
                          : AbsWorkout.withIndex(widget.length, widget.set + 1, widget.calories),
                      image: image.getUrl(),
                    )),
                    InkWell(
                      onTap: () {
                        // if (widget.length == abss.length - 1 && widget.set == abs.getSet()-1) {
                        // } else {
                        print(
                            "widget length:${widget.length}, set:${widget.set}");
                        print(
                            "abs length  ${abss.length}, abs set: ${abs.getSet()}");
                        if (widget.set >= abs.getSet() - 1) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AbsWorkout.withIndex(
                                      widget.length + 1, 0, widget.calories)));
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AbsWorkout.withIndex(
                                      widget.length, widget.set + 1, widget.calories)));
                          // }
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
