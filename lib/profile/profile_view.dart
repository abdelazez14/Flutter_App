import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ok/AppColors.dart';
import 'package:ok/CrudApi/handlingDataView.dart';
import 'package:ok/profile/profile_controller.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});
  @override
  Widget build(BuildContext context) {
 Get.put(ProfileController());
    return GetBuilder<ProfileController>(
      builder:(controller)=> handlingDataView(
        statusRequest: controller.statusRequest,
        widget: Center(
           child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text(
                   "Hello ${controller.profile["name"]} !"
                   ,style: const TextStyle(fontSize: 25 ,color: AppColor.primaryColor),
          ),
          SizedBox(height: 10,),
               Text(
                   "Your email is ${controller.profile["email"]} "
                   ,style: const TextStyle(fontSize: 13 ,color: AppColor.primaryColor),
          ),
             ],
           ),
             
        ),
      ),
    );
  }
}