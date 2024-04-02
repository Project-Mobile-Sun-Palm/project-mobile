import 'package:flutter/material.dart';
import 'menu_card.dart';
import 'package:project/models/timer.dart';
import 'package:project/services/database_timer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project/main.dart';
import 'package:project/services/database_user.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
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
            print("begin: ${begin.toString()}");
            print("finish: ${finish.toString()}");
            print(tmp.getBegin().toDate().toString());
            print(tmp.getFinish().toDate().toString());
            Duration time = begin.difference(finish);
            print(time.toString());
            print(time.inSeconds.toString());
            DatabaseUser().updateTime(
                auth.currentUser!.uid, time.inSeconds * 1.0);

            TimerDBService().updateTimer(
                auth.currentUser!.uid, Timer(Timestamp.now(), Timestamp.now()));
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Exercise",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        body: const SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              MenuCard(
                  pushName: '/cardio_screen',
                  courseName: 'Cardio',
                  image: 'cardio.jpg'),
              MenuCard(
                  pushName: '/strength_screen',
                  courseName: 'Strength',
                  image: 'strength.jpg'),
              MenuCard(
                  pushName: '/abs_screen',
                  courseName: 'Abs',
                  image: 'endurance.png'),
            ],
          ),
        ));
  }
}
