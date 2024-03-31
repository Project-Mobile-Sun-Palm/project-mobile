import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stroke_text/stroke_text.dart';
import 'package:project/controllers/font_controller.dart';

class MenuCard extends StatelessWidget {
  const MenuCard(
      {super.key,
      required this.pushName,
      required this.courseName,
      required this.image});

  final String pushName;
  final String image;
  final String courseName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, pushName);
      },
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: SizedBox(
              height: 160,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  "assets/images/$image",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
            child: StrokeText(
              text: courseName,
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: defineFont(courseName, context, 15)
              ),
              strokeColor: Colors.black,
              strokeWidth: 5,
            ),
          ),
        ],
      ),
    );
  }
}
