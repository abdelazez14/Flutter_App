import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ok/Cart/CartController.dart';

class TopAppBarCart extends GetView<CartController> {
  const TopAppBarCart({Key? key, required this.title}) : super(key: key);
final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child:  Row(
        children: [
          Expanded(
            child: Container(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () {
                       Get.back();
                  }, icon: const Icon(Icons.arrow_back),)),),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child:  Text(title,
                style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.grey),),
            ),),
          Spacer(),
        ],
      ),
    );
  }
}
