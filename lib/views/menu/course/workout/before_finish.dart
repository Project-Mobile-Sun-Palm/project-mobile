import 'package:flutter/material.dart';
import 'package:project/views/menu/course/workout/finished_screen.dart';

class BeforeFinishScreen extends StatelessWidget {
  BeforeFinishScreen({required this.calories});

  double calories;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Finished Cardio",
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
