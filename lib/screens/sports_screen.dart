import 'package:flutter/material.dart';
import 'package:project/screens/sports_card.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Sports',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SearchBar(
            leading: Icon(Icons.search),
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
            child: const Column(
              children: [
                SportCard(
                    sportName: "Walk",
                    calories: "200 - 350",
                    sportPic: "walking.png"),
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
        ],
      )),
    );
  }
}
