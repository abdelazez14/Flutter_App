import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ok/HomeScreen/homeScreenController.dart';

import 'CustombottomAppBar.dart';
class CustomBottomAppBarHome extends StatelessWidget {
  const CustomBottomAppBarHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller)=>
            BottomAppBar(
              shape: const CircularNotchedRectangle(),
              notchMargin: 10,
              child: Row(
                children: [
                  ...List.generate(
                      controller.listPage.length + 1,
                          (index) {
                        int i=index > 2 ? index - 1 : index;
                        return index == 2
                            ? const Spacer()
                            : CustomBottomAppBar(
                          text: controller
                              .bottomAppBar[i]["title"],
                          iconData: controller
                              .bottomAppBar[i]["icon"],
                          active: controller.currentPage == i ? true : false,
                          onPressed: () {
                            controller.changePage(i);
                          },
                        );
                      }),
                ],
              ),
            ),
    );
  }
}
