import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project/controllers/history_controller.dart';
import 'package:project/controllers/time_converter.dart';
import 'package:project/main.dart';
import 'package:project/models/images.dart';
import 'package:project/models/timer.dart';
import 'package:project/services/database_images.dart';
import 'package:project/services/database_timer.dart';
import 'package:project/services/database_users.dart';
import 'package:intl/intl.dart';

class FinishedScreen extends StatefulWidget {
  FinishedScreen({super.key, required this.calories, required this.name});

  late double calories;
  late String name;

  @override
  State<FinishedScreen> createState() => _FinishedScreenState();
}

class _FinishedScreenState extends State<FinishedScreen> {
  Duration time = Duration(days: 0);

  ImagesDBService imagesDBService = ImagesDBService();

  SizedBox createPic(String image, var context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.3,
        width: MediaQuery.of(context).size.width * 1,
        child: ClipRRect(
          child: Image.network(image, fit: BoxFit.cover),
        ));
  }

    @override
    initState() {
      TimerDBService().getAll(auth.currentUser!.uid).then((timer) => {
            setState(() {
              Timer tmp = timer ?? Timer(Timestamp(0, 0), Timestamp(0, 0));
              DateTime begin = DateTime(
                  tmp.getBegin().toDate().year,
                  tmp.getBegin().toDate().month,
                  tmp.getBegin().toDate().day,
                  tmp.getBegin().toDate().hour,
                  tmp.getBegin().toDate().minute,
                  tmp.getBegin().toDate().second);

              DateTime finish = DateTime(
                  tmp.getFinish().toDate().year,
                  tmp.getFinish().toDate().month,
                  tmp.getFinish().toDate().day,
                  tmp.getFinish().toDate().hour,
                  tmp.getFinish().toDate().minute,
                  tmp.getFinish().toDate().second);

              time = begin.difference(finish);
              
            })
          });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
            stream: imagesDBService.getImage(),
            builder: ((context, snapshot) {
              List images = snapshot.data?.docs ?? [];

              if (images.isEmpty) {
                return const Center(
                  child: Text("Please add some images."),
                );
              }
              //UI

              //search image
              Images image = images.firstWhere((element) {
                if (element.id == widget.name) {
                  return true;
                } else {
                  return false;
                }
              }).data();

              String url = image.getUrl();

              return Column(children: [
                createPic(url, context),

                Container(
                  padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                  child: Text("Congratulation !!!", style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic
                  ),),
                ),

                Container(
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
                  child: Text("Workout Completed", style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic
                  ),),
                ),

                const Divider(
                  thickness: 3,
                  color: Colors.blueAccent,
                ),

                const SizedBox(
                  height: 20,
                ),

                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.deepOrange),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Time",
                        style: TextStyle(
                          fontSize: 25, 
                          color: Colors.white),
                      ),

                      Text(
                        "${TimeConverter().toMinute((time.inSeconds * 1.0).abs())}:${TimeConverter().toSecondStr((time.inSeconds * 1.0).abs())}",
                        style: TextStyle(
                          fontSize: 28, 
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      ),

                      const Divider(
                        thickness: 7,
                        color: Colors.white,
                      ),

                      Text(
                        "Calories",
                        style: TextStyle(
                          fontSize: 25, 
                          color: Colors.white),
                      ),

                      Text(
                        "${widget.calories} kcals",
                        style: TextStyle(
                          fontSize: 28, 
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      ),
                    ],
                  )
                ),

                const SizedBox(
                  height: 25,
                ),

                InkWell(
                  onTap: () {
                    HistoryController().addData(Timestamp.now(), image.getName(), (time.inSeconds * 1.0).abs(), widget.calories);
                    String docPath = "${auth.currentUser!.uid}${Timestamp.now().toDate().toString().substring(0, 18)}";
                    DatabaseUser().updateHistoryKey(auth.currentUser!.uid, docPath);
                    Navigator.pushNamed(context, '/bottomnavbar');
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.08,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.blueAccent),
                    child: Center(
                      child: Text(
                        "Finish",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    ),
                  ),
                )
              ]);
            })));
  }
}
