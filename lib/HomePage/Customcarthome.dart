import 'package:flutter/material.dart';

import '../AppColors.dart';
class CustomCartHome extends StatelessWidget {
  const CustomCartHome({Key? key, required this.title, required this.body}) : super(key: key);
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColor.primaryColor,
            ),
            child:  ListTile(
              title: Text(
               title,
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
              subtitle: Text(
                body,
                style: const TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
          ),
          Positioned(
            top: -20,
            right: -20,
            child: Container(
              height: 160,
              width: 160,
              decoration: BoxDecoration(
                color: AppColor.secondColor,
                borderRadius: BorderRadius.circular(160),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
