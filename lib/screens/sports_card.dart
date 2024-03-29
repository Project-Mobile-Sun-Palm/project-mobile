import 'package:flutter/material.dart';

class SportCard extends StatelessWidget {
  const SportCard(
      {super.key,
      required this.sportName,
      required this.calories,
      required this.sportPic});

  final String sportName;
  final String sportPic;
  final String calories;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          height: MediaQuery.of(context).size.height * 0.1,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset("assets/images/$sportPic"),
              const SizedBox(width: 15),
              Text(
                "$sportName : ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                "$calories Calories/Hour",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        const Divider(
              color: Colors.black,
              thickness: 3,
        ),
      ],
    );
  }
}