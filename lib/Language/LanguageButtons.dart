import 'package:flutter/material.dart';
class LanguageButton extends StatelessWidget {
  const LanguageButton({Key? key, required this.Textbutton}) : super(key: key);
final String Textbutton;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
      ),
      padding: EdgeInsets.all(100),
      width: double.infinity,
      child: Column(
        children: [
          MaterialButton(
            color: Color.fromRGBO(255, 128, 0, 1),
            onPressed:(){} ,
            child: Text("اللغة العربية",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
          ),

        ],
      ),
    );
  }
}
