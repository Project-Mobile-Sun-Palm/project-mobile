import 'package:flutter/material.dart';

class CreateAppBar extends StatelessWidget {
  final String pagename;
  const CreateAppBar({super.key, required this.pagename});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        pagename,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}


