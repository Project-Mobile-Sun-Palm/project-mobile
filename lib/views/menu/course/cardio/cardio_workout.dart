import 'package:flutter/material.dart';
import 'package:project/main.dart';
import 'package:project/services/database_cardios.dart';
import 'package:project/services/database_timer.dart';
import 'package:project/services/database_images.dart';
import 'package:project/models/cardios.dart';
import 'package:project/models/images.dart';
import 'package:project/views/menu/course/workout/workout_screen.dart';
import 'package:project/controllers/font_controller.dart';
import 'package:project/views/menu/course/cardio/cardio_rest.dart';
import 'package:project/views/menu/menu_screen.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:project/services/database_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CardioWorkout extends StatefulWidget {
  CardioWorkout() {
    this.length = 0;
    this.set = 0;
  }
  CardioWorkout.withIndex(this.length, this.set);

  late int length;
  late int set;

  @override
  State<CardioWorkout> createState() => _CardioWorkoutState();
}

class _CardioWorkoutState extends State<CardioWorkout> {
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
            return const Center(
                child: LoadingIndicator(
                    indicatorType: Indicator.circleStrokeSpin,
                    colors: [Colors.red],
                    strokeWidth: 2,
                    ));
          }
          //UI

          Cardio cardio = cardios[widget.length].data();

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
                  if (element.id == cardio.getImageKey()) {
                    return true;
                  } else {
                    return false;
                  }
                }).data();

                DatabaseUser().updateCalories(auth.currentUser!.uid, cardio.getCalories());
                if(widget.length==0 && widget.set==0){TimerDBService().updateBegin(auth.currentUser!.uid, Timestamp.now());}
                if(widget.length == cardios.length - 1 && widget.set == cardio.getSet() - 1){TimerDBService().updateFinish(auth.currentUser!.uid, Timestamp.now());}

                return Column(
                  children: [
                    Container(
                        child: WorkoutWithTime(
                      name: cardio.getName(),
                      todo: cardio.getToDo(),
                      set: cardio.getSet(),
                      restTime: cardio.getRestTime(),
                      length: widget.length,
                      path: (widget.length == cardios.length - 1 && widget.set == cardio.getSet() - 1) ?MenuScreen():CardioRest.withIndex(widget.length, widget.set),
                      image: image.getUrl(),
                    )),
                  ],
                );
              });
        }),
      ),
    );
  }
}
