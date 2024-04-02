import 'package:flutter/material.dart';
import 'menu_card.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Exercise",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              onPressed: (){
                Navigator.pushNamed(context, '/bottomnavbar');
              }, 
              icon: const Icon(Icons.home)
            )
          ],
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
