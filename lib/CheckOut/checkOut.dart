import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../AppColors.dart';
import '../Cart/CartController.dart';
import '../Cart/buttonOrder.dart';
import '../Functions/validatorInput.dart';
import '../signIn/TextField.dart';
import 'CheckOutController.dart';
class CheckOut extends StatelessWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CheckOutController controller= Get.put(CheckOutController());
    CartController controllerCart= Get.put(CartController());
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColor.primaryColor),
        backgroundColor: Colors.grey[50],
        title: const Text('CheckOut',style: TextStyle(
          color: AppColor.primaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),),
        centerTitle: true,
        elevation: 0,
      ),
      bottomNavigationBar: CustomButtonCart(
        textbutton: 'Check Out',
        onPressed: (){
    if (controller.formstate.currentState!.validate()) {
      controllerCart.cartmap.clear();
      controller.gotoSuccessCheckOut();
    }else{
      print("not vaild");
    }
        },
      ),
      body:  Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                            child: const Text("Total Price", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: AppColor.primaryColor),)),
                        Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text("${controller.total}\$",
                              style: const TextStyle(fontSize: 26,fontWeight: FontWeight.bold,color: AppColor.primaryColor),)),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50,),
              Container(
                padding: const EdgeInsets.all(10),
                child: Form(
                  key: controller.formstate,
                  child: AuthTextField(
                    isNumber: false,
                    valid: (val) {
                      return validInput(val!, 3, 50, "Address");
                    },
                    hintText: 'Enter your Address',
                    label: 'Address',
                    iconData: Icons.location_on_outlined,
                    mycontroller: controller.address,
                  ),
                ),
              ),

            ],
          ),
      ),
    );
  }
}
