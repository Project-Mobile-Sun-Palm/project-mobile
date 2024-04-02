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
          padding: const EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height * 0.1,
          width: MediaQuery.of(context).size.width * 1.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset("assets/images/$sportPic"),
              const SizedBox(width: 15),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$sportName : ",
                    style: TextStyle(
                        fontSize:  defineFont(sportName, context),
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    "$calories Calories/Hour",
                    style: TextStyle(
                        fontSize:  defineFont(sportName, context),
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )
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

  double defineFont(String message, var context){
    if(message.length < 20){
      return MediaQuery.of(context).size.width / 20;
    }
    return MediaQuery.of(context).size.width / (message.length);
  }
}
