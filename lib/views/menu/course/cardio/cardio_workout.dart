import 'package:flutter/material.dart';
import 'package:project/services/database_cardios.dart';
import 'package:project/services/database_images.dart';
import 'package:project/models/cardios.dart';
import 'package:project/models/images.dart';
import 'package:project/views/menu/course/workout/workout_screen.dart';
import 'package:project/controllers/font_controller.dart';
import 'package:project/views/menu/course/cardio/cardio_rest.dart';
import 'package:project/views/menu/menu_screen.dart';

class CardioWorkout extends StatefulWidget {
  CardioWorkout() {
    this.length = 0;
  }
  CardioWorkout.withIndex(this.length);

  late int length;

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
              child: const Text("Please add some cardios"),
            );
          }
          //UI

          Cardio cardio = cardios[widget.length].data();

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
                      path: widget.length != cardios.length-1 ? CardioRest.withIndex(widget.length) : MenuScreen(),
                      image: image.getUrl(),
                    )),
                    // InkWell(
                    //   onTap: () {
                        // if (widget.length == cardios.length - 1) {
                        // } else {
                    //       Navigator.push(
                    //           context,
                    //           MaterialPageRoute(
                    //               builder: (context) => CardioRest.withIndex(
                    //                   widget.length + 1)));
                    //     }
                    //   },
                    //   child: Container(
                    //     width: MediaQuery.of(context).size.width * 0.4,
                    //     height: MediaQuery.of(context).size.height * 0.05,
                    //     decoration: const BoxDecoration(
                    //         color: Colors.orange,
                    //         borderRadius:
                    //             BorderRadius.all(Radius.circular(20))),
                    //     child: Center(
                    //         child: Text(
                    //       "Done",
                    //       style: TextStyle(
                    //         fontSize: defineFont("Done", context, 15),
                    //       ),
                    //       textAlign: TextAlign.center,
                    //     )),
                    //   ),
                    // )
                  ],
                );
              });
        }),
      ),
    );
  }
}
