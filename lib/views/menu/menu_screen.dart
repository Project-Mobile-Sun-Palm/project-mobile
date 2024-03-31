import 'package:flutter/material.dart';
import 'menu_card.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Exercise",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        // automaticallyImplyLeading: false,
        // actions: [
        //   IconButton(
        //     onPressed: (){
        //       Navigator.pushNamed(context, "/bottomnavbar");
        //     }, 
        //     icon: const Icon(Icons.home)
        //   )
        // ],
      ),
      body: const SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            MenuCard(pushName: '/cardio_screen', courseName: 'Cardio', image: 'cardio.jpg'),
            MenuCard(pushName: '/strength_screen', courseName: 'Strength', image: 'strength.jpg'),
            MenuCard(pushName: '/endurance_screen', courseName: 'Endurance', image: 'endurance.png'),
          ],
        ),
      )
    );
  }
}

// class MenuScreen extends StatelessWidget {
//   const MenuScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           const SizedBox(
//             height: 80,
//           ),

//           Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 const Text("                         "),
//                 const Text("                         "),
//                 InkWell(
//                   onTap: () {
//                     Navigator.pushNamed(context, "/bottomnavbar");
//                   },
//                   child: const Icon(Icons.home),
//                 )
//               ],
//             ),

//           const Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Text("Cardio", style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic),),
//               Text("          "),
//               Text("          "),
//             ],
//           ),

//           const SizedBox(
//             height: 10,
//           ),

//           const MenuCard(
//             pushName: "/cardio_screen", 
//             image: "cardio.jpg"
//           ),

//           const SizedBox(
//             height: 25,
//           ),

//           const Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Text("Strength", style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic),),
//               Text("          "),
//               Text("          "),
//             ],
//           ),

//           const SizedBox(
//             height: 10,
//           ),

//           const MenuCard(
//             pushName: "/strength_screen", 
//             image: "strength.jpg"
//           ),

//           const SizedBox(
//             height: 25,
//           ),

//           const Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Text("Endurance", style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic),),
//               Text("          "),
//               Text("          "),
//             ],
//           ),
          
//           const SizedBox(
//             height: 10,
//           ),

//           const MenuCard(
//             pushName: "/endurance_screen", 
//             image: "endurance.png"
//           ),
//         ],
//       ),
//     );
//   }
// }