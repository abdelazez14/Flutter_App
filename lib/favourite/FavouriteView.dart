import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ok/CrudApi/handlingDataView.dart';
import 'package:ok/favourite/favouriteController.dart';
import 'package:ok/items/CustomListItems.dart';

import '../AppColors.dart';

class FavouriteHome extends StatelessWidget {
  const FavouriteHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => FavouriteController());
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColor.primaryColor),
        backgroundColor: Colors.grey[50],
        title: const Text(
          'My Favourite',
          style: TextStyle(
            color: AppColor.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(children: [
        GetBuilder<FavouriteController>(
          builder: (controller) => handlingDataView(
            statusRequest: controller.statusRequest,
            widget: GridView.builder(
              itemCount: controller.userFav.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  mainAxisExtent: 300,
                  childAspectRatio: 0.8),
              itemBuilder: (context, index) => Container(
                height: 200,
                margin: const EdgeInsets.all(5),
                child: CustomListItems(
                  type: "fav",
                  active: false,
                  productModel: controller.userFav[index],
                  onTap: () {
                    controller.GoToProduct(controller.userFav[index].id!);
                  },
                  onIconPressed: () {
                    controller.deletefromFavourite(
                        controller.userFav[index].id.toString());
                    controller.userFav.removeWhere((element) =>
                        element.id == controller.userFav[index].id);
                  },
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
