import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomeScreen"),
      ),
      body: Column(
        children: [
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),

// User's Profile
              ClipRRect(
                borderRadius: BorderRadius.circular(50) ,
                child: Container(
                  height: 70,
                  width: 70,
                  child: Icon(Icons.person, size: 35,),
                  color: Colors.green,
                ),
              ),

              const SizedBox(
                width: 15,
              ),

// Username, Bio
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Username", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                  )),
                  Text("bio: (inspiration)", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                  )),
                ],
              ),

            ],
          ),

          const SizedBox(
            height: 15,
          ),

// Text "Activity"
          const Row(
            children: [
              Text("       "),
              Text("Activty", style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25
              ))
            ],
          ),

          const SizedBox(
            height: 20,
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
                  height: 110,
                  width: 170,
                  color: Colors.orange[100],
                  child: const Column(
                    children: [
                      SizedBox(
                        height: 60,
                        width: 135,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Training", style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                            )),
                            Icon(Icons.fireplace)
                          ]
                        ),
                      ),

                      Text("45 minutes", style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      ))

                    ],
                  ),
                ),
              ),

              // Calories
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 200,
                  width: 170,
                  color: Colors.pink[100],
                  child: const Column(
                    children: [
                      SizedBox(
                        height: 60,
                        width: 135,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Calories", style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                            )),
                            Icon(Icons.fireplace)
                          ]
                        ),
                      ),

                      SizedBox(
                        height: 40,
                      ),

                      Text("2700", style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      )),

                      Text("kcal", style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      ))

                    ],
                  ),
                ),
              )
            ],
          ),

          const SizedBox(
                height: 20,
              ),
          
// Text "Quick action"
          const Row(
            children: [
              Text("       "),
              Text("Quick action", style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25
              ))
            ],
          ),

          const SizedBox(
            height: 20,
          ),

// Boxes; BMI
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              // BMIB
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 130,
                  width: 170,
                  color: Colors.green[200],
                  child: const Column(
                    children: [
                      SizedBox(
                        height: 60,
                        width: 135,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("BMI", style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                            )),
                            Icon(Icons.fireplace)
                          ]
                        ),
                      ),

                      Text("25.41", style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      )),

                      Text("overweight", style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      ))

                    ],
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
            onTap: () {},
            child: Card(
              child: Container(
                height: 60,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.deepOrange[400],
                  borderRadius: BorderRadius.circular(20)
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("   "),
                    Text("Workout", style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    )),
                    Text("  "),
                    Icon(Icons.arrow_forward_ios, 
                      color: Colors.white,
                      size: 30,)
                  ],
                ),
              ),
            ),
          )


        ],
      ),
    );
  }
}