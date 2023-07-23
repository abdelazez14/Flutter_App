import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ok/Cart/CustomItemsCartList.dart';
import 'package:ok/CrudApi/handlingDataView.dart';
import 'package:ok/HomePage/Customcarthome.dart';
import 'package:ok/HomePage/CustomtitleHome.dart';
import 'package:ok/HomePage/customBestSellerView.dart';
import 'package:ok/HomePage/homeController.dart';
import 'package:get/get.dart';
import 'package:ok/LinkApi.dart';
import 'package:ok/items/CustomListItems.dart';
import 'package:ok/routes.dart';
import '../CustomAppBar.dart';
import 'ListCategoriesHome.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = Get.put(HomeControllerImp());
    return ListView(
      children: [
        CustomAppBar(
          onChanged: (val) {
            controller.onChange(val);
          },
          mycontroller: controller.searchController,
          titleAppBar: "Find Product",
          icon: const Icon(
            Icons.favorite_outline_outlined,
            size: 25,
          ),
          onPressedIcon: () {
            Get.toNamed(AppRoutes.Favourite);
          },
          onPressedSearch: () {
            controller.onSearch();
          },
        ),
        GetBuilder<HomeControllerImp>(
          builder: (controller) => handlingDataView(
            statusRequest: controller.statusRequest,
            widget: controller.isSearch == false
                ? Column(children: [
                  SizedBox(height: 10,),
                    Container(
                      alignment: Alignment.center,
                      height: 200,
                      width: double.infinity,
                      // margin: const EdgeInsets.all(0),
                      child: CarouselSlider.builder(
                          itemCount: controller.cursorImage.length,
                          options: CarouselOptions(height: 250, autoPlay: true,viewportFraction: 1),
                          itemBuilder:
                              (BuildContext context, int index, int realIndex) {
                            return Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal:0),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      "${AppLink.apiImage}${controller.cursorImage[index].image!.first.photo}",
                                  height: 200,
                                  width: double.infinity,
                                  fit: BoxFit.fill,
                                ));
                          }),
                    ),

                    const CustomTitleHome(title: "Categories"),
                    const SizedBox(
                      height: 20,
                    ),
                    const ListCategoriesHome(),
              const SizedBox(height: 10,),
              const CustomTitleHome(title: "Best Seller"),
              SizedBox(height: 20,),
                   Container(
                     height: 220,
                     child: ListView.separated(
                       shrinkWrap: true,
                         scrollDirection: Axis.horizontal,
                         itemCount:controller.bestSellerData.length ,
                         separatorBuilder: (context,index)=>SizedBox(width:5 ,),
                         itemBuilder: (context,index)=>GestureDetector(
                             onTap: (){
                               controller.GoToProduct(controller.bestSellerData[index].id!);
                             },
                             child: CustomBestSellerView(productModel: controller.bestSellerData[index] ))),
                   )
                  ])
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
                    itemBuilder: (_, index) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
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
    );
  }
}
