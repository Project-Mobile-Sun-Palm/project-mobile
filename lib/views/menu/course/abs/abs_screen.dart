import 'package:flutter/material.dart';
import 'package:project/services/database_images.dart';
import 'package:project/services/database_abs.dart';
import 'package:project/views/menu/course/abs/abs_card.dart';

class AbsScreen extends StatefulWidget {
  const AbsScreen({super.key});

  @override
  State<AbsScreen> createState() => _AbsScreenState();
}

class _AbsScreenState extends State<AbsScreen> {

  // String imageUrl="";
  // String imageName="";
  // ImagesDBService imagesDBService = ImagesDBService();

  // String cardioDescription="";
  // String cardioRestTime="";
  // CardioDBService cardioDBService = CardioDBService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Abs Workout",
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
                "assets/images/endurance.png",
                fit: BoxFit.cover,
              ),
              ),
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    "Exercise", 
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25
                    )
                  ),
                ),
                SizedBox(height: 10,),
              ],
            ),
            
            Container(width: MediaQuery.of(context).size.width,height : MediaQuery.of(context).size.height,child: CardPage(),)
          ],
        ),
      )
    );
  }


  // void updateDataFromDB(String docName) {
  //   if (imageUrl == "" ||
  //       imageName == "" ||
  //       cardioDescription == "" ||
  //       cardioRestTime == "") {
  //     imagesDBService.getUrl(docName).then((value) => {
  //           setState(() {
  //             imageUrl = value ?? '';
  //           })
  //         });

  //     imagesDBService.getName(docName).then((value) => {
  //           setState(() {
  //             imageName = value ?? '';
  //           })
  //         });

  //     cardioDBService.getDescription(docName).then((value) => {
  //           setState(() {
  //             cardioDescription = value ?? '';
  //           })
  //         });

  //     cardioDBService.getRestTimeAsString(docName).then((value) => {
  //           setState(() {
  //             cardioRestTime = value ?? '';
  //           })
  //         });
  //   }
  // }

}