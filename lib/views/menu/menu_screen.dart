import 'package:flutter/material.dart';
import 'menu_card.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

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
            MenuCard(pushName: '/cardio_screen', courseName: 'Cardio', image: 'cardio.jpg'),
            MenuCard(pushName: '/strength_screen', courseName: 'Strength', image: 'strength.jpg'),
            MenuCard(pushName: '/endurance_screen', courseName: 'Endurance', image: 'endurance.png'),
          ],
        ),
      )
    );
  }
}