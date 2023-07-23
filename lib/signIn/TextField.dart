import 'package:flutter/material.dart';
class AuthTextField extends StatelessWidget {
  const AuthTextField({Key? key,
     this.mycontroller,
    required this.hintText,
    required this.label,
    required this.iconData,
    required this.valid,
    required this.isNumber,
    this.obscureText,
    this.onTapIcon,
  }) : super(key: key);

  final String hintText;
  final String label;
  final IconData iconData;
  final TextEditingController?  mycontroller;
  final String ?Function(String?) valid ;
  final bool isNumber;
  final bool ?obscureText;
  final void Function()? onTapIcon;

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.only(bottom: 25),
      child: TextFormField(
        controller: mycontroller,
        obscureText: obscureText==null||obscureText==false?false:true,
        keyboardType: isNumber?const TextInputType.numberWithOptions(decimal: true)
            :TextInputType.text,
        validator: valid,
        decoration: InputDecoration(
          hintText:hintText,
          hintStyle: const TextStyle(fontSize: 12),
          floatingLabelBehavior:FloatingLabelBehavior.always,
          contentPadding: const EdgeInsets.symmetric(vertical: 5,horizontal: 30),
          label: Container(
            margin:const EdgeInsets.symmetric(horizontal: 9),
            child: Text(label),
          ),
          suffixIcon: InkWell(
            onTap: onTapIcon,
            child: Icon(iconData),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
