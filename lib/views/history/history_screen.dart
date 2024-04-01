import 'package:flutter/material.dart';
import 'package:project/views/history/history_card.dart';
 
class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text(
          "HistoryCardry",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          
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
                    HistoryCard(
                        sportName: "Walkasdasdasdasdasd",
                        calories: "200 - 350",
                        sportPic: "walking.png"),
                    HistoryCard(
                        sportName: "Boxing",
                        calories: "800",
                        sportPic: "boxing-gloves.png"),
                    HistoryCard(
                        sportName: "Badminton",
                        calories: "800",
                        sportPic: "boxing-gloves.png"),
                    HistoryCard(
                        sportName: "Boxing",
                        calories: "800",
                        sportPic: "boxing-gloves.png"),
                    HistoryCard(
                        sportName: "Boxing",
                        calories: "800",
                        sportPic: "boxing-gloves.png"),
                    HistoryCard(
                        sportName: "Boxing",
                        calories: "800",
                        sportPic: "boxing-gloves.png"),
                    HistoryCard(
                        sportName: "Boxing",
                        calories: "800",
                        sportPic: "boxing-gloves.png"),
                    HistoryCard(
                        sportName: "Boxing",
                        calories: "800",
                        sportPic: "boxing-gloves.png"),
                    HistoryCard(
                        sportName: "Boxing",
                        calories: "800",
                        sportPic: "boxing-gloves.png"),
                    HistoryCard(
                        sportName: "Boxing",
                        calories: "800",
                        sportPic: "boxing-gloves.png"),
                    HistoryCard(
                        sportName: "Boxing",
                        calories: "800",
                        sportPic: "boxing-gloves.png"),
                    HistoryCard(
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
