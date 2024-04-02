import 'package:flutter/material.dart';
import 'package:project/services/database_cardios.dart';
import 'package:project/services/database_images.dart';
import 'package:project/models/cardios.dart';
import 'package:project/models/images.dart';
import 'package:project/views/menu/course/cardio/cardio_workout.dart';
import 'package:project/views/menu/course/workout/workout_screen.dart';
import 'package:project/controllers/font_controller.dart';
import 'package:loading_indicator/loading_indicator.dart';

class CardioRest extends StatefulWidget {
  CardioRest() {
    this.length = 0;
    this.set = 0;
    this.calories = 0;
  }
  CardioRest.withIndex(this.length, this.set, this.calories);

  late int length;
  late int set;
  late double calories;

  @override
  State<CardioRest> createState() => _CardioRestState();
}

class _CardioRestState extends State<CardioRest> {
  ImagesDBService imagesDBService = ImagesDBService();
  CardioDBService cardioDBService = CardioDBService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: StreamBuilder(
        stream: cardioDBService.getCardio(),
        builder: ((context, snapshot) {
          List cardios = snapshot.data?.docs ?? [];

          if (cardios.isEmpty) {
            return Center(
                child: LoadingIndicator(
                    indicatorType: Indicator.circleStrokeSpin,
                    colors: const [Colors.red],
                    strokeWidth: 2,
                    ));
          }
          //UI

          Cardio cardio = cardios[widget.length].data();
          Cardio cardioNext = cardios[widget.length].data();

          if (widget.set == cardio.getSet() - 1) {
            cardioNext = cardios[widget.length + 1].data();
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
                  if (element.id == cardioNext.getImageKey()) {
                    return true;
                  } else {
                    return false;
                  }
                }).data();

                return Column(
                  children: [
                    Container(
                        child: WorkoutWithTime(
                      name: cardioNext.getName(),
                      todo: cardio.getToDo(),
                      set: cardio.getSet(),
                      restTime: cardio.getRestTime(),
                      length: cardios.length,
                      path: (widget.set == cardio.getSet() - 1 && widget.length != cardios.length - 1)
                          ? CardioWorkout.withIndex(widget.length + 1, 0, widget.calories)
                          : CardioWorkout.withIndex(
                              widget.length, widget.set + 1, widget.calories),
                      image: image.getUrl(),
                    )),
                    InkWell(
                      onTap: () {
                        if (widget.length == cardios.length - 1 &&
                            widget.set == cardio.getSet()) {
                        } else {
                          if (widget.set == cardio.getSet() - 1) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CardioWorkout.withIndex(
                                            widget.length + 1, 0, widget.calories)));
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CardioWorkout.withIndex(
                                            widget.length, widget.set + 1, widget.calories)));
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
