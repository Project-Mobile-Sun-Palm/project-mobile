import 'package:flutter/material.dart';
import 'package:project/services/database_images.dart';
import 'package:project/services/database_cardios.dart';
import 'package:project/models/images.dart';
import 'package:project/models/cardios.dart';
import 'package:project/views/menu/course/course_card.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  ImagesDBService imagesDBService = ImagesDBService();
  CardioDBService cardioDBService = CardioDBService();

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
            Navigator.pushNamed(context, '/cardio_workout');
          },
        ),
      ),
      body: StreamBuilder(
          stream: cardioDBService.getCardio(),
          builder: (context, snapshot) {
            List cardios = snapshot.data?.docs ?? [];

            if (cardios.isEmpty) {
              return const Center(
                child: Text("Please add some cardio."),
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
                    itemCount: cardios.length,
                    itemBuilder: (context, index) {
                      Cardio cardio = cardios[index].data();
                      String cardioId = cardios[index].id;

                      //search image
                      Images image = images.firstWhere((element) {
                        Images checkImg = element.data();
                        if (element.id == cardio.getImageKey()) {
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
                            exrciseName: cardio.getName(),
                            description: cardio.getDescription(),
                            restTime: cardio.getRestTimeAsString(),
                            image: url),
                      );
                    },
                  );
                }));
          }),
    );
  }
}