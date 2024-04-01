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
          "History",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.deepOrange[400],
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: const Expanded(
              child: Column(
                children: [
                  HistoryCard(
                      muscleImage: "walking.png",
                      day: "May 10, 6:00",
                      name: "Six pack Abs",
                      time: "45",
                      calories: "2000",
                  ),
                  HistoryCard(
                      muscleImage: "boxing-gloves.png",
                      day: "May 6, 6:30",
                      name: "Cardio",
                      time: "30",
                      calories: "1300",
                  ),
                  HistoryCard(
                      muscleImage: "walking.png",
                      day: "May 4, 7:00",
                      name: "Strength",
                      time: "33",
                      calories: "1322",
                  ),
                  HistoryCard(
                      muscleImage: "boxing-gloves.png",
                      day: "May 3, 6:00",
                      name: "Six pack Abs",
                      time: "52",
                      calories: "322",
                  ),
                  HistoryCard(
                      muscleImage: "walking.png",
                      day: "May 2, 6:00",
                      name: "Six pack Abs",
                      time: "15",
                      calories: "30",
                  ),
                  HistoryCard(
                      muscleImage: "boxing-gloves.png",
                      day: "May 1, 6:00",
                      name: "Cardio",
                      time: "27",
                      calories: "389",
                  ),
                  
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
