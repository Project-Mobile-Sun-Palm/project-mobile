import 'package:flutter/material.dart';
import 'package:project/views/menu/course/cardio/cardio_card.dart';

class CardioScreen extends StatefulWidget {
  const CardioScreen({super.key});

  @override
  State<CardioScreen> createState() => _CardioScreenState();
}

class _CardioScreenState extends State<CardioScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Cardio Workout",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width * 1.0,
                child: ClipRRect(
                  child: Image.asset(
                    "assets/images/cardio.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text("Exercise",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                  child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: CardPage(),
              ))
            ],
          ),
        ));
  }
}
