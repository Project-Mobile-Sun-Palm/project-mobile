import 'package:flutter/material.dart';
import 'package:project/screens/sports_card.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      // appBar: AppBar(
      //   title: const Text(
      //     '\n\nSports',
      //     style: TextStyle(fontWeight: FontWeight.bold),
      //   ),
      //   primary: false,
      // ),
      body: SingleChildScrollView(
        
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 60,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("    Sports", style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold
              ),)
          ],),
          SizedBox(
            height: 10,
          ),

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
