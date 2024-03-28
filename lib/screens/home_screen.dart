import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("HomeScreen"),
      // ),
      body: Column(
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
              ClipRRect(
                borderRadius: BorderRadius.circular(50) ,
                child: Container(
                  height: 75,
                  width: 75,
                  child: Icon(Icons.person, size: 35,),
                  color: Colors.deepPurple,
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
                    fontSize: 18
                  )),
                  Text("bio: (inspiration)", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                  )),
                ],
              ),

              const SizedBox(
                width: 100,
              ),

              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/login_screen');
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: const Center(
                    child: Icon(Icons.logout, color: Colors.white)
                  )
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
              Text("Activty", style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25
              ))
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
                  height: 200,
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
                            Icon(Icons.fitness_center)
                          ]
                        ),
                      ),

                      SizedBox(
                        height: 40,
                      ),

                      Text("45", style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      )),

                      Text("minutes", style: TextStyle(
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
                            Icon(Icons.local_fire_department)
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

                      Text("kcals", style: TextStyle(
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
                height: 23,
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
            height: 23,
          ),

// Boxes; BMI
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              
              // BMI
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 140,
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
                            Icon(Icons.man_rounded)
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