import 'package:flutter/material.dart';

class CountCard extends StatelessWidget {
  const CountCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width * 1.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [],
          ),
        )
      ],
    );
  }
}
//-------------------------------------------------------------------------------------
class TimeCard extends StatelessWidget {
  const TimeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}