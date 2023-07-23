import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ok/AppColors.dart';
import 'package:ok/CrudApi/dataRemote/test_controller.dart';
import 'package:ok/CrudApi/handlingDataView.dart';

class TestView extends StatelessWidget {
  const TestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Get.put(TestController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: Text("Title"),
      ),
      body: GetBuilder<TestController>(builder: (controller) {
        return handlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) {
                  return Text("${controller.data[index].images}");
                }));
      }),
    );
  }
}
