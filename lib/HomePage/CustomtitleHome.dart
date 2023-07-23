import 'package:flutter/material.dart';

import '../AppColors.dart';

class CustomTitleHome extends StatelessWidget {
  const CustomTitleHome({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      // alignment: Alignment.topLeft,
      margin: const EdgeInsets.all(15),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 20, color: Colors.black54, fontWeight: FontWeight.bold),
      ),
    );
  }
}
