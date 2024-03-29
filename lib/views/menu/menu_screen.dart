import 'package:flutter/material.dart';
import 'menu_card.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 80,
          ),

          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text("                         "),
                const Text("                         "),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "/bottomnavbar");
                  },
                  child: const Icon(Icons.home),
                )
              ],
            ),

          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Cardio", style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic),),
              Text("          "),
              Text("          "),
            ],
          ),

          const SizedBox(
            height: 10,
          ),

          const MenuCard(
            pushName: "/cardio_screen", 
            image: "cardio.jpg"
          ),

          const SizedBox(
            height: 25,
          ),

          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Strength", style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic),),
              Text("          "),
              Text("          "),
            ],
          ),

          const SizedBox(
            height: 10,
          ),

          const MenuCard(
            pushName: "/strength_screen", 
            image: "strength.jpg"
          ),

          const SizedBox(
            height: 25,
          ),

          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Endurance", style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic),),
              Text("          "),
              Text("          "),
            ],
          ),
          
          const SizedBox(
            height: 10,
          ),

          const MenuCard(
            pushName: "/endurance_screen", 
            image: "endurance.png"
          ),
        ],
      ),
    );
  }
}