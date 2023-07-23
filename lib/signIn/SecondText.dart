import 'package:flutter/material.dart';
class SecondText extends StatelessWidget {
  const SecondText({Key? key, required this.text2}) : super(key: key);
final String text2;
  @override
  Widget build(BuildContext context) {
    return Text(
      text2,
      textAlign: TextAlign.center,
      style: const TextStyle(color: Colors.grey),
    );
  }
}
