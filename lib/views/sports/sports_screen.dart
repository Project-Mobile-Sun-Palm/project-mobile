import 'package:flutter/material.dart';
import 'package:project/views/sports/sports_card.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text(
          "Sport",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Container(
          //   height: 55,
          //   width: 370,
          //   child: const SearchBar(
          //     leading: Icon(Icons.search),
          //   ),
          // ),
          const SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.deepOrange[100],
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Expanded(
              child: Container(
                child: const Column(
                  children: [
                    SportCard(
                        sportName: "Golf",
                        calories: "120 - 140",
                        sportPic: "golf.png"),
                    SportCard(
                        sportName: "Walking",
                        calories: "150 - 160",
                        sportPic: "walk.jpg"),
                    SportCard(
                        sportName: "Yoga",
                        calories: "150 - 160",
                        sportPic: "yoga.png"),
                    SportCard(
                        sportName: "Table Tennis",
                        calories: "170 - 180",
                        sportPic: "table_tennis.jpeg"),
                    SportCard(
                        sportName: "Badminton",
                        calories: "170 - 180",
                        sportPic: "badminton.jpg"),
                    SportCard(
                        sportName: "Basketball",
                        calories: "230 - 240",
                        sportPic: "basketball.png"),
                    SportCard(
                        sportName: "Tennis",
                        calories: "230 - 240",
                        sportPic: "tennis.png"),
                    SportCard(
                        sportName: "Boxing",
                        calories: "230 - 240",
                        sportPic: "boxing.jpg"),
                    SportCard(
                        sportName: "Climbing",
                        calories: "250 - 260",
                        sportPic: "climbing.png"),
                    SportCard(
                        sportName: "Swimming",
                        calories: "270 - 280",
                        sportPic: "swimming.jpg"),
                    SportCard(
                        sportName: "Football",
                        calories: "270 - 280",
                        sportPic: "football.png"),
                    SportCard(
                        sportName: "Fencing",
                        calories: "390 - 400",
                        sportPic: "fencing.png"),
                    SportCard(
                        sportName: "Squat",
                        calories: "390 - 400",
                        sportPic: "squat.png"),
                    SportCard(
                        sportName: "Taekwondo",
                        calories: "390 - 400",
                        sportPic: "taekwondo.png"),
                  ],
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
