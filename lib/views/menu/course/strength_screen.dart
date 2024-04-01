import 'package:flutter/material.dart';
import 'package:project/services/database_images.dart';
import 'package:project/services/database_exercies.dart';
import 'package:project/views/menu/course/course_card.dart';
import 'package:project/controllers/font_controller.dart';

class StrengthScreen extends StatefulWidget {
  const StrengthScreen({super.key});

  @override
  State<StrengthScreen> createState() => _StrengthScreenState();
}

class _StrengthScreenState extends State<StrengthScreen> {

  String imageUrl="";
  String imageName="";
  ImagesDBService imagesDBService = ImagesDBService();

  String exerciseDescription="";
  String exerciseRestTime="";
  ExerciseDBService exerciseDBService = ExerciseDBService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Strength",
          style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: SingleChildScrollView(
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
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                Text(
                  "Exercise", 
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  )
                ),
                SizedBox(height: 10,),
              ],
            ),
            
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CountCard(exrciseName: imageName, description: exerciseDescription, restTime: exerciseRestTime, image: imageUrl),
              ],
            )
          ],
        ),
      )
    );
  }


  void updateDataFromDB(String docName){

    if(imageUrl=="" || imageName=="" || exerciseDescription=="" || exerciseRestTime==""){
      imagesDBService.getUrl(docName).then((value) => {
        setState(() {
          imageUrl = value ?? '';
        })
      });

      imagesDBService.getName(docName).then((value) => {
        setState(() {
          imageName = value ?? '';
        })
      });

      exerciseDBService.getDescription(docName).then((value) => {
        setState(() {
          exerciseDescription = value ?? '';
        })
      });

      exerciseDBService.getRestTime(docName).then((value) => {
        setState(() {
          exerciseRestTime = value ?? '';
        })
      });            
    }  
  }

}