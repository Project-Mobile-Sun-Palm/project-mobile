import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

Widget getRadialGauge() {
  return SfRadialGauge(
    enableLoadingAnimation: true,
    axes: <RadialAxis>[
      RadialAxis( // Set max
        showTicks: false, 
        showLabels: false, 
        startAngle: 270, 
        endAngle: 630, 
        minimum: 0, 
        maximum: 3000, 

        pointers: const <GaugePointer>[
          RangePointer( // Set current
            value: 2700, 
            color: Colors.green,) 
        ], 
          
        annotations: const <GaugeAnnotation>[
          GaugeAnnotation(
            widget: Column(
              children: [
                Text('2700', // Calculate Calories, Input
                  style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold)),

                Text("kcals", 
                  style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
            angle: 90,
            positionFactor: 0.7
          )
        ]
      )
    ]
  );
}