import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

Future<bool> alertExitApp(){
   Get.defaultDialog(
    title: "Key",
    middleText: "Do you want to exit the application ?",
      actions: [
        ElevatedButton(onPressed: (){
          exit(0);
        },
            child: const Text("Confirm")),
        ElevatedButton(onPressed: (){
          Get.back();
        },
            child: const Text("Cancel")),
      ]
  );
   return Future.value(true);

}