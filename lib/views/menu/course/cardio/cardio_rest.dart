import 'package:flutter/material.dart';
import 'package:project/services/database_cardios.dart';
import 'package:project/services/database_images.dart';
import 'package:project/models/cardios.dart';
import 'package:project/models/images.dart';
import 'package:project/views/menu/course/cardio/cardio_workout.dart';
import 'package:project/views/menu/course/workout/workout_screen.dart';
import 'package:project/controllers/font_controller.dart';

class CardioRest extends StatefulWidget {
  CardioRest() {
    this.length = 0;
  }
  CardioRest.withIndex(this.length);

  late int length;

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
            return const Center(
              child: const Text("Please add some cardios"),
            );
          }
          //UI

          Cardio cardio = cardios[widget.length+1].data();

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
                  if (element.id == cardio.getImageKey()) {
                    return true;
                  } else {
                    return false;
                  }
                }).data();

                return Column(
                  children: [
                    Container(
                        child: WorkoutWithTime(
                      name: cardio.getName(),
                      todo: cardio.getToDo(),
                      set: cardio.getSet(),
                      restTime: cardio.getRestTime(),
                      length: widget.length,
                      path: CardioWorkout.withIndex(widget.length+1),
                      image: image.getUrl(),
                    )),
                    InkWell(
                      onTap: () {
                        if (widget.length == cardios.length - 1) {
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CardioWorkout.withIndex(
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
