import 'package:flutter/material.dart';
import 'package:ok/Cart/CartController.dart';
import '../AppColors.dart';
import 'buttonOrder.dart';
import 'package:get/get.dart';
class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key, required this.totalPrice}) : super(key: key);
  final String totalPrice;
  @override
  Widget build(BuildContext context) {
   CartController controller= Get.put(CartController());
    return Container(
      padding: const EdgeInsets.all(10),
           child: Column(
        mainAxisSize: MainAxisSize.min,
        children:  [
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: AppColor.primaryColor,width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Text("Total Price", style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: AppColor.primaryColor),)),
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text("$totalPrice\$",
                          style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: AppColor.primaryColor),)),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 10,),
          CustomButtonCart(
            textbutton: 'Place Order',
            onPressed: (){
              controller.gotoCheckOut();

            },
          ),
        ],
      ),
    );
  }
}
