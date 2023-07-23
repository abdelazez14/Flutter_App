import 'package:flutter/material.dart';
import 'package:ok/AppColors.dart';
import 'package:get/get.dart';

import 'package:ok/routes.dart';
class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        leading: IconButton(onPressed: () {
            Get.offNamed(AppRoutes.HomePage);
        }, icon: const Icon(Icons.arrow_back)),
        title: const Text("About Us",textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: const [
            Text("The world of e-commerce is large and ever-growing evolving.\n the changes in e-commerce over the past year. \n alone were remarkable.",
            style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20,),
            Text("In 2020, many offline stores were forced to shift to e-commerce to keep their businesses going,\n while many small e-commerce businesses struggled and others flourished.",
              style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20,),
            Text("Globally, retail e-commerce sales in 2020 neared 4.3\$ trillion compared to 3.35\$ trillion in 2019\n according to Statista. In 2021, this figure rose 16.8% to 4.92\$ billion. For 2022, it is forecasted that global retail e-commerce sales will reach 5.55\$ trillion. \n The market's value will continue rising till it reaches 7.385\$ trillion by 2025",
              style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
