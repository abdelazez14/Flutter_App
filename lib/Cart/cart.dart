import 'package:flutter/material.dart';
import 'package:ok/AppColors.dart';
import 'package:ok/Cart/CartController.dart';
import 'CustomBottomNavigationBar.dart';
import 'CustomItemsCartList.dart';
import 'package:get/get.dart';
class Cart extends GetView<CartController> {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     Get.lazyPut(() => CartController());
    return   GetBuilder<CartController>(
      builder: (controller)=>
       Scaffold(
         appBar: AppBar(
           iconTheme: const IconThemeData(color: AppColor.primaryColor),
           backgroundColor: Colors.grey[50],
           title: const Text('My Cart',style: TextStyle(
             color: AppColor.primaryColor,
             fontWeight: FontWeight.bold,
             fontSize: 25,
           ),),
           centerTitle: true,
           elevation: 0,
         ),
        bottomNavigationBar:CustomBottomNavigationBar(
          totalPrice:controller.cartmap.isEmpty?"0":controller.total,),
        body:controller.cartmap.isEmpty
    ? Center(
  child: Image.asset(
    'assets/images/Black Friday-bro.png',
    width: 200,
    height: 200,
  ),
)
    :
          ListView(
            children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount:controller.cart.length,
                    itemBuilder: (BuildContext context, int index) {
                      return
                        CustomItemsCart(
                        image: '${controller.cart.keys.toList()[index].image}',
                        name: '${controller.cart.keys.toList()[index].title}',
                        price: '${controller.cart.keys.toList()[index].price}',
                        count: '${controller.cart.values.toList()[index]}',
                        onPressedincrement: () {
                          controller.changeCount(index, Opretion.incremnt);
                        },
                        onPresseddecrement: () {
                          controller.changeCount(index, Opretion.decrement);
                        },
                      );
                    },
                  ),
                ),
              ],
          ),
      ),
    );
  }
}
