import 'package:flutter/material.dart';
import 'package:project/controllers/font_controller.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard(
      {super.key,
      required this.muscleImage,
      required this.day,
      required this.name,
      required this.time,
      required this.calories});

  final String muscleImage;
  final String day;
  final String name;
  final String time;
  final String calories; 

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height * 0.17,
          width: MediaQuery.of(context).size.width * 1.0,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset("assets/images/$muscleImage",),
                const SizedBox(
                  width: 15
                ),
                
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("$day", style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold
                    ),),    
                    
                    const SizedBox(height: 8,),
          
                    Text("$name", style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold
                    ),),

                    const SizedBox(height: 7,),
                    
                    Row(
                      children: [
                        Icon(Icons.timer),
                        Text(" "),
                        Text("$time", style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                        ),),
                        Text("  minutes", style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14
                        ),)
                      ],
                    ),

                    Row(
                      children: [
                        Icon(Icons.local_fire_department),
                        Text(" "),
                        Text("$calories", style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                        ),),
                        Text("  kcals", style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14
                        ),)
                      ],
                    ),
                  ],
                )
              ],
            )
        ),



        const Divider(
          color: Colors.black,
          thickness: 3,
        ),
      ],
    );
  }
}
