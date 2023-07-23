import 'package:flutter/material.dart';

import '../AppColors.dart';

class CustomButtonCart extends StatelessWidget {
  const CustomButtonCart({Key? key, this.onPressed, required this.textbutton}) : super(key: key);
  final void Function()? onPressed;

  final String  textbutton;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      child: MaterialButton(
        color: AppColor.primaryColor,
        textColor: Colors.white,
        onPressed: onPressed,
        child: Text(
          textbutton,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}