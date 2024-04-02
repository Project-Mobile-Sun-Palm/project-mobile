import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project/controllers/bmi_controller.dart';
import 'package:project/controllers/time_converter.dart';
import 'package:project/main.dart';
import 'package:project/services/database_max_cal.dart';
import 'package:project/services/database_users.dart';
import 'package:project/views/home/calories_scale.dart';
import 'package:project/services/auth.dart';
import 'package:project/controllers/font_controller.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //Initial Data
  String username = "";
  double training_time = -1;
  double bmi = -1;
  double calories = -1;
  String image = "";
  double maxCal = 4000;

  static Route<Object?> _dialogBuilder(
      BuildContext context, Object? arguments) {
      TextEditingController caloriesController = TextEditingController();
    return DialogRoute<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add max calories'),
          content: TextField(
            controller: caloriesController,
            decoration: InputDecoration(
            prefixIcon: const Icon(Icons.local_fire_department),
            hintText: 'Calories',
            border: const OutlineInputBorder()
          ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Confirm'),
              onPressed: () {
                DatabaseMaxCal().addData(double.parse(caloriesController.text));
                Navigator.of(context).pop();
                Navigator.pushNamed(context, '/bottomnavbar');
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    //Get Data From Database
    if (username == "") {
      DatabaseUser().getUsername(auth.currentUser!.uid).then((value) => {
            setState(() {
              username = value ?? "No user Name"; //Get Username
            })
          });

      DatabaseUser().getBmi(auth.currentUser!.uid).then((value) => {
            setState(() {
              bmi = value ?? 0; //Get BMI
            })
          });

      DatabaseUser().getCalories(auth.currentUser!.uid).then((value) => {
            setState(() {
              calories = value ?? 0; //Get Calories
            })
          });

      DatabaseUser().getTime(auth.currentUser!.uid).then((value) => {
            setState(() {
              training_time = value ?? 0; //Get Training Time
            })
          });
          
      DatabaseUser().getImage(auth.currentUser!.uid).then((value) => {
            setState(() {
              image = value ?? "";
            })
      });

       DatabaseMaxCal().getMaxCalories(auth.currentUser!.uid).then((value) {
            setState(() {
              maxCal = value ?? 4000; 
            });
      },);
    }

    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
        
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
        
        // User's Profile
                InkWell(
                  onTap: () {
                    username = "";
                    Navigator.pushNamed(context, '/setting_screen');
                  },
        
                  child: SizedBox(
                    height: 80,
                    width: 80,
                    child: image != "" ? 
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(image, fit: BoxFit.cover,),
                      ) : 
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSd3Z1x2Gh1fwbXhqvNekPS4DfWm0rdweKQjA&usqp=CAU",
                          fit: BoxFit.cover
                        ),
                      )
                  ),
                ),
        
                const SizedBox(
                  width: 15,
                ),
        
        // Username, Bio
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(username,
                      style: TextStyle(
                        fontWeight: FontWeight.bold, 
                        fontSize: defineFont(username, context, 15)
                      )
                    ),
                    // Text("bio: (inspiration)",
                    //     style:
                    //         TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  ],
                ),
        
                new Spacer(),
        
        // LogOut
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                  child: InkWell(
                    onTap: () {
                      Auth().signOut();
                      Navigator.pushNamed(context, '/login_screen');
                    },
                    child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Colors.deepOrange,
                            borderRadius: BorderRadius.circular(20)),
                        child: const Center(
                            child: Icon(Icons.logout, color: Colors.white))),
                  ),
                )
              ],
            ),
        
            const SizedBox(
              height: 18,
            ),
        
        // Text "Activity"
            const Row(
              children: [
                Text("       "),
                Text("Activty",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25))
              ],
            ),
        
            const SizedBox(
              height: 23,
            ),
        
        // Boxes; Training, Calories
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Training
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 140,
                    width: 170,
                    color: Colors.orange[100],
                    child: Column(
                      children: [
                        SizedBox(
                          height: 60,
                          width: 135,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Training",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20)),
                                Icon(
                                  Icons.fitness_center,
                                )
                              ]),
                        ),
                        Text("${training_time<3600 ? "" : TimeConverter().toHrStr(training_time)+":"}${TimeConverter().toMinute(training_time)}:${TimeConverter().toSecondStr(training_time)}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                                textAlign: TextAlign.center,),
                        Text("  ${training_time<3600 ? "minutes" : "hours"}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                                textAlign: TextAlign.center)
                      ],
                    ),
                  ),
                ),
        
                // Calories
                InkWell(
                  onTap: () {
                    Navigator.of(context).restorablePush(_dialogBuilder);
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 200,
                      width: 170,
                      color: Colors.pink[100],
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 60,
                            width: 135,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Calories",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20)),
                                  Icon(Icons.local_fire_department)
                                ]),
                          ),
                          SizedBox(
                            height: 125,
                            width: 125,
                            child: Stack(
                              children: [
                                Container(
                                  height: 125,
                                  width: 125,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                        width: 10, color: Colors.pink.shade100),
                                    color: Colors.white,
                                  ),
                                ),
                                Container(
                                  child: getRadialGauge(calories, maxCal),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
        
            const SizedBox(
              height: 23,
            ),
        
        // Text "Quick action"
            const Row(
              children: [
                Text("       "),
                Text("Quick action",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25))
              ],
            ),
        
            const SizedBox(
              height: 23,
            ),
        
        // Boxes; BMI
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
        
                // BMI
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "/bmi_screen");
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 140,
                      width: 170,
                      color: Colors.green[200],
                      child: Column(
                        children: [
                          SizedBox(
                            height: 60,
                            width: 135,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("BMI",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20)),
                                  Icon(Icons.man_rounded)
                                ]),
                          ),
                          Text(bmi.toStringAsFixed(2),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                          Text(BmiController(bmi).getHealth(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20))
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
        
            const SizedBox(
              height: 40,
            ),
        
        // Button "Get Started"
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/menu_screen');
              },
              child: Container(
                height: 60,
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.deepOrange[400],
                    borderRadius: BorderRadius.circular(20)),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("   "),
                    Text("Workout",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    Text("  "),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 30,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
