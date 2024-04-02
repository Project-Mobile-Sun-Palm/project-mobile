import 'package:flutter/material.dart';
import 'package:project/views/menu/course/workout/finished_screen.dart';

class BeforeFinishScreen extends StatelessWidget {
  BeforeFinishScreen({required this.calories, required this.name});

  double calories;
  String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Finished ${name}",
              style: TextStyle(
                fontSize: 45,
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FinishedScreen(
                              calories: calories,
                              name: name,
                            )));
              },
              child: Icon(
                Icons.done,
                size: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
