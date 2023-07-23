import 'package:flutter/material.dart';
import 'package:ok/Functions/checkInternet.dart';
class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  var res ;
  intialData() async{
    res =await CheckInternet();
    print(res);
  }
  @override
  void initState() {
    intialData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test"),
      ),
    );
  }
}
