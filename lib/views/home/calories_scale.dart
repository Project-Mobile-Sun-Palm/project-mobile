import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

Widget getRadialGauge(double currentValue, double maxValue) {

  return SfRadialGauge(
    enableLoadingAnimation: true,
    axes: <RadialAxis>[
      RadialAxis( // Set max
        showTicks: false, 
        showLabels: false, 
        startAngle: 270, 
        endAngle: 630, 
        minimum: 0, 
        maximum: maxValue, 

        pointers: <GaugePointer>[
          RangePointer( // Set current
            value: currentValue, 
            color: Colors.green,) 
        ], 
          
        annotations: <GaugeAnnotation>[
          GaugeAnnotation(
            widget: Column(
              children: [
                Text(currentValue.toInt().toString(), // Calculate Calories, Input
                  style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold)),

                Text("Kcals", 
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