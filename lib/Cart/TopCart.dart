import 'package:flutter/material.dart';
import '../AppColors.dart';
class TopCart extends StatelessWidget {
  const TopCart({Key? key, required this.massage}) : super(key: key);
  final String massage;
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.only(bottom: 5),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      // height: 20,
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child:  Text(massage,
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
    );
  }
}