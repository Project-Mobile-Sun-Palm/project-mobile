import 'package:flutter/material.dart';

class BMI extends StatefulWidget {
  const BMI({super.key});

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  late String result = "";
  late double height = 0;
  late double weight = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          "BMI",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //IMAGE
            Image.asset('assets/images/bmi_pic.webp'),
            const SizedBox(
              height: 20,
            ),
            //Weight input
            const Text(
              "Your weight in Kg :",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 8,
            ),
            TextField(
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              controller: weightController,
              obscureText: false,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  hintText: 'Your weight in Kg'),
            ),
            const SizedBox(
              height: 10,
            ),
            //Height input
            const Text(
              "Your height in Cm :",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 8,
            ),
            TextField(
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              controller: heightController,
              obscureText: false,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  hintText: 'Your height in Cm'),
            ),
            const SizedBox(
              height: 20,
            ),
            //Calculate Button
            Container(
              width: double.infinity,
              child: FloatingActionButton(
                onPressed: () {
                  setState(() {
                    height = double.parse(checkString(heightController));
                    weight = double.parse(checkString(weightController));
                  });
                  calculateBMI(height, weight);
                 
                },
                child: const Text(
                  'Calculate',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                backgroundColor: Colors.orange,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //BMI output
            Container(
              width: double.infinity,
              child: Text(
                "Your BMI is :",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              child: Text(
                "$result",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      )),
    );
  }

  void calculateBMI(double height, double weight) {
    double finalResult = weight / ((height / 100) * (height / 100));
    String bmi = finalResult.toStringAsFixed(2);
    setState(() {
      result = bmi;
    });
  }

  String checkString(TextEditingController message){
    String txt = message.text;
    String newMessage="";
    for(var i in txt.characters){
      if(i.contains(RegExp('[0-9.]')) == true){
        newMessage += i;
      }
    }
    return newMessage;
  }
}
