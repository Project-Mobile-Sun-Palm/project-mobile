import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  const MenuCard(
      {super.key,
      required this.pushName,
      required this.courseName,
      required this.image});

  final String pushName;
  final String image;
  final String courseName;

  // @override
  // Widget build(BuildContext context) {
  //   return InkWell(
  //     onTap: () {
  //       Navigator.pushNamed(context, pushName);
  //     },
  //     child: SizedBox(
  //       height: 160,
  //       width: double.infinity,
  //       child: ClipRRect(
  //         child: Image.asset("assets/images/$image", fit: BoxFit.cover,),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.pushNamed(context, pushName);
        },
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 1.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: ClipRRect(
                      child: Image.asset("assets/images/$image", fit: BoxFit.cover,),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    courseName,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: defineFont(courseName, context, 20)),
                  ),
                  new Spacer(),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
            const Divider(
              color: Colors.black,
              thickness: 3,
            ),
          ],
        ));
  }

  double defineFont(String message, var context, int defaultLenght) {
    if (message.length < defaultLenght) {
      return MediaQuery.of(context).size.width / defaultLenght;
    }
    return MediaQuery.of(context).size.width / (message.length);
  }
}
