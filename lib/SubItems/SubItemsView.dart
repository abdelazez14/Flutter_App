import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ok/CrudApi/handlingDataView.dart';
import 'package:ok/HomePage/ListCategoriesHome.dart';
import 'package:ok/SubItems/SubitemsController.dart';

class SubItems extends GetView<SubItemsController> {
  const SubItems({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SubItemsController());
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 30, left: 10, right: 10),
        child: GetBuilder<SubItemsController>(
          builder: (controller) => handlingDataView(
            statusRequest: controller.statusRequest,
            widget: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1),
              itemCount: controller.categoryId == 48
                  ? controller.typeOfElctronics.length
                      : controller.categoryId == 35
                          ? controller.typeOfMen.length
                          : controller.categoryId == 38
                              ? controller.typeOfWomman.length
                              : null,
              itemBuilder: (context, index) => Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                height: 200,
                child: InkWell(
                  onTap: () => controller.goItems(
                    controller.categoryId == 48
                        ? controller.typeOfElctronics[index].id!
                            : controller.categoryId == 35
                                ? controller.typeOfMen[index].id!
                                : controller.categoryId == 38
                                    ? controller.typeOfWomman[index].id!
                                    : null,
                  ),
                  child: Container(
                    child: ViewParentCategory(
                        image: controller.categoryId == 48
                            ? controller.imageOfElectronics[index]
                                : controller.categoryId == 35
                                    ? controller.imageOfMen[index]
                                    : controller.categoryId == 38
                                        ? controller.imageOfWomman[index]
                                        : "",
                        name: controller.categoryId == 48
                            ? controller.typeOfElctronics[index].name!
                                : controller.categoryId == 35
                                    ? controller.typeOfMen[index].name!
                                    : controller.categoryId == 38
                                        ? controller.typeOfWomman[index].name!
                                        : ""),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
