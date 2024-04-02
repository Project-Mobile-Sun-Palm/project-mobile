import 'package:flutter/material.dart';
import 'package:project/services/database_images.dart';
import 'package:project/services/database_exercies.dart';
import 'package:project/models/images.dart';
import 'package:project/models/exercise.dart';
import 'package:project/views/menu/course/course_card.dart';
import 'package:project/views/menu/course/strength/strength_workout.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  ImagesDBService imagesDBService = ImagesDBService();
  ExerciseDBService exerciseDBService = ExerciseDBService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100), color: Colors.amber),
        child: IconButton(
          color: Colors.black,
          highlightColor: Colors.orange,
          icon: Icon(Icons.play_arrow),
          onPressed: () {
            Navigator.pushNamed(context, '/strength_workout');
          },
        ),
      ),
      body: StreamBuilder(
          stream: exerciseDBService.getExercise(),
          builder: (context, snapshot) {
            List exercises = snapshot.data?.docs ?? [];

            if (exercises.isEmpty) {
              return const Center(
                child: Text("Please add some exercise."),
              );
            }

            return StreamBuilder(
                stream: imagesDBService.getImage(),
                builder: ((context, snapshot) {
                  List images = snapshot.data?.docs ?? [];

                  if (images.isEmpty) {
                    return const Center(
                      child: Text("Please add some images."),
                    );
                  }
                  //UI
                  return ListView.builder(
                    itemCount: exercises.length,
                    itemBuilder: (context, index) {
                      Exercise exercise = exercises[index].data();
                      String exerciseId = exercises[index].id;

                      //search image
                      Images image = images.firstWhere((element) {
                        Images checkImg = element.data();
                        if (element.id == exercise.getImageKey()) {
                          return true;
                        } else {
                          return false;
                        }
                      }).data();

                      String url = image.getUrl();
                      //search image

                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: CountCard(
                            exrciseName: exercise.getName(),
                            description: exercise.getDescription(),
                            restTime: exercise.getRestTimeAsString(),
                            image: url),
                      );
                    },
                  );
                }));
          }),
    );
  }
}
