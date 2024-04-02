import 'package:flutter/material.dart';
import 'package:project/views/menu/course/strength/strength_card.dart';

class StrengthScreen extends StatefulWidget {
  const StrengthScreen({super.key});

  @override
  State<StrengthScreen> createState() => _StrengthScreenState();
}

class _StrengthScreenState extends State<StrengthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Strength Workout",
          style: TextStyle(fontWeight: FontWeight.bold),),
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
                "assets/images/strength.jpg",
                fit: BoxFit.cover,
              ),
              ),
            ),
            const SizedBox(height: 10,),
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                "Exercise", 
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                )
              ),
            ),
            const SizedBox(height: 10,),
            
            Expanded(child: Container(width: MediaQuery.of(context).size.width,height : MediaQuery.of(context).size.height,child: CardPage(),))
          ],
        ),
      )
    );
  }
}