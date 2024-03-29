import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  const MenuCard(
      {super.key,
      required this.pushName,
      required this.image});

  final String pushName;
  final String image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, pushName);
      },
      child: SizedBox(
        height: 160,
        width: double.infinity,
        child: ClipRRect(
          child: Image.asset("assets/images/$image", fit: BoxFit.cover,),
        ),
      ),
    );
  }
}