import 'package:flutter/material.dart';
import 'package:ok/AppColors.dart';
class FirstText extends StatelessWidget {
  const FirstText({Key? key, required this.text}) : super(key: key);
final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 30,color: AppColor.secondColor),
      textAlign: TextAlign.center,
    );
  }
}
