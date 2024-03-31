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
          Container(
            height: 55,
            width: 370,
            child: const SearchBar(
              leading: Icon(Icons.search),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: const BoxDecoration(
                color: Color.fromRGBO(186, 255, 243, 1),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Expanded(
              child: Container(
                child: const Column(
                  children: [
                    SportCard(
                        sportName: "Walkasdasdasdasdasd",
                        calories: "200 - 350",
                        sportPic: "walking.png"),
                    SportCard(
                        sportName: "Boxing",
                        calories: "800",
                        sportPic: "boxing-gloves.png"),
                    SportCard(
                        sportName: "Badminton",
                        calories: "800",
                        sportPic: "boxing-gloves.png"),
                    SportCard(
                        sportName: "Boxing",
                        calories: "800",
                        sportPic: "boxing-gloves.png"),
                    SportCard(
                        sportName: "Boxing",
                        calories: "800",
                        sportPic: "boxing-gloves.png"),
                    SportCard(
                        sportName: "Boxing",
                        calories: "800",
                        sportPic: "boxing-gloves.png"),
                    SportCard(
                        sportName: "Boxing",
                        calories: "800",
                        sportPic: "boxing-gloves.png"),
                    SportCard(
                        sportName: "Boxing",
                        calories: "800",
                        sportPic: "boxing-gloves.png"),
                    SportCard(
                        sportName: "Boxing",
                        calories: "800",
                        sportPic: "boxing-gloves.png"),
                    SportCard(
                        sportName: "Boxing",
                        calories: "800",
                        sportPic: "boxing-gloves.png"),
                    SportCard(
                        sportName: "Boxing",
                        calories: "800",
                        sportPic: "boxing-gloves.png"),
                    SportCard(
                        sportName: "Walk",
                        calories: "200 - 350",
                        sportPic: "walking.png"),
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
