import 'package:flutter/material.dart';
import 'package:project/services/database_images.dart';
import 'package:project/services/database_abs.dart';
import 'package:project/models/images.dart';
import 'package:project/models/abs.dart';
import 'package:project/views/menu/course/course_card.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  ImagesDBService imagesDBService = ImagesDBService();
  AbsDBService absDBService = AbsDBService();

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
            Navigator.pushNamed(context, '/abs_workout');
          },
        ),
      ),
      body: StreamBuilder(
          stream: absDBService.getAbs(),
          builder: (context, snapshot) {
            List abss = snapshot.data?.docs ?? [];

            if (abss.isEmpty) {
              return const Center(
                child: Text("Please add some abs."),
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
                  return ListView.builder(
                    itemCount: abss.length,
                    itemBuilder: (context, index) {
                      Abs abs = abss[index].data();

                      //search image
                      Images image = images.firstWhere((element) {
                        if (element.id == abs.getImageKey()) {
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
                            exrciseName: abs.getName(),
                            description: abs.getDescription(),
                            restTime: abs.getRestTimeAsString(),
                            image: url),
                      );
                    },
                  );
                }));
          }),
    );
  }
}