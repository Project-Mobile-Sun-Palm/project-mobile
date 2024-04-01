import 'package:flutter/material.dart';
import "package:project/controllers/font_controller.dart";

class CountCard extends StatelessWidget {
  const CountCard({
    super.key,
    required this.exrciseName,
    required this.description,
    required this.restTime,
    required this.image,
  });

  final String exrciseName;
  final String description;
  final String restTime;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      width: MediaQuery.of(context).size.width * 1.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        border: Border.all(color: Colors.black),
        color: Colors.blueAccent
      ),
      child: Row(
        children: [
          createPic(image, context),
          callVerticalBar(),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  exrciseName,
                  style: TextStyle(
                    fontSize: defineFont(exrciseName, context, 20),
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: defineFont(description, context, 20),
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  restTime,
                  style: TextStyle(
                    fontSize: defineFont(restTime, context, 20),
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
//-------------------------------------------------------------------------------------
SizedBox createPic(String image, var context){
  return SizedBox(
          width: MediaQuery.of(context).size.width * 0.3,
          height: MediaQuery.of(context).size.height * 0.15,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), 
              bottomLeft: Radius.circular(20)
            ),
            child: Image.network(
              image,
              fit: BoxFit.cover,
            ),
          ),
        );
}

VerticalDivider callVerticalBar(){
  return const VerticalDivider(
            width: 0,
            thickness: 1,
            color: Colors.black,
          );
}