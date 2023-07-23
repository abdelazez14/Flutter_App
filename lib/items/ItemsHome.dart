import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ok/CrudApi/handlingDataView.dart';
import 'package:ok/favourite/favouriteController.dart';
import 'package:ok/items/ItemsController.dart';
import 'package:ok/routes.dart';
import '../CustomAppBar.dart';
import 'CustomListItems.dart';

class ItemsHome extends StatelessWidget {
  const ItemsHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    Get.put(FavouriteController());
    return Scaffold(
      body: GetBuilder<ItemsControllerImp>(
        builder: (controllerImp) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
            children: [
              CustomAppBar(
                onChanged: (val) {
                  controllerImp.onChange(val);
                },
                onPressedIcon: () {
                  Get.toNamed(AppRoutes.Cart);
                },
                mycontroller: controllerImp.searchController,
                titleAppBar: "Find Product",
                icon: Icon(Icons.shopping_basket),
                onPressedSearch: () {
                  controllerImp.onSearch();
                },
              ),
              const SizedBox(
                height: 10,
              ),
              GetBuilder<ItemsControllerImp>(
                builder: (controller) => handlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: !controllerImp.isSearch
                      ? GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.data.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 8,
                                  crossAxisSpacing: 8,
                                  mainAxisExtent: 300,
                                  childAspectRatio: 0.6),
                          itemBuilder: (BuildContext context, int index) {
                            return GetBuilder<FavouriteController>(
                              builder: (controllerFav) => CustomListItems(
                                type: "items",
                                onIconPressed: () {
                                  controllerFav.onPressedIcon(
                                          controller.data[index].id!)
                                      ? controllerFav.userFav.removeWhere(
                                          (element) =>
                                              element.id ==
                                              controller.data[index].id!)
                                      : controllerFav.userFav
                                          .add(controller.data[index]);
                                  controllerFav.active == true
                                      ? controllerFav.active == false
                                      : controllerFav.active == true;
                                },
                                onTap: () {
                                  controller.GoToProduct(
                                    controller.data[index].id!,
                                  );
                                },
                                productModel: controllerImp.data[index],
                                active: controllerFav
                                        .check(controllerImp.data[index].id!)
                                    ? !controllerFav.active
                                    : controllerFav.active,
                              ),
                            );
                          },
                        )
                      : GridView.builder(
                          itemCount: controller.searchData.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 8,
                                  crossAxisSpacing: 8,
                                  mainAxisExtent: 300,
                                  childAspectRatio: 0.6),
                          itemBuilder: (context, index) {
                            return Container(
                              height: 250,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: CustomListItems(
                                productModel: controller.searchData[index],
                                onTap: () {
                                  controller.GoToProduct(
                                      controller.searchData[index].id!);
                                },
                                active: false,
                              ),
                            );
                          }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
