import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ok/AppColors.dart';
import 'package:ok/LinkApi.dart';
import 'package:ok/Services/Services.dart';
import 'package:ok/routes.dart';
import 'package:url_launcher/url_launcher.dart';
import 'SettingsController.dart';
class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();
    SettingsController controller= Get.put(SettingsController());
    return Container(
      child:ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(height: Get.width/3, color: AppColor.primaryColor,),
              Positioned(
                top: Get.width/3.9,
                right: Get.width/2.4,
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: CircleAvatar(
                  radius: 40,
                    backgroundColor: Colors.grey[100],
               backgroundImage: AssetImage(AppLink.avatar),
              ),
                ),
              ),
            ],
          ),
          SizedBox(height: 100,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10,),
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    onTap: (){

                    },
                    title: Text("Disable Notification"),
                    trailing: Switch(onChanged: (val){},
                      value: true,
                    ),
                  ),

                  ListTile(
                    onTap: (){

                    },
                    title: Text("Address"),
                    trailing: Icon(Icons.location_on_outlined),
                  ),

                  ListTile(
                    onTap: (){
                      Get.toNamed(AppRoutes.AboutUs);

                    },
                    title: Text("About Us"),
                    trailing: Icon(Icons.help_outline_outlined),
                  ),

                  ListTile(
                    onTap: ()async{
                      await launchUrl(Uri.parse("tel:+201156728086"));
                    },
                    title: Text("Contact Us"),
                    trailing: Icon(Icons.phone_callback_outlined),
                  ),

                  ListTile(
                    onTap: (){
                        myServices.sharedPreferences.clear();
                    Get.offAllNamed(AppRoutes.SignIn);
                    },
                    title: Text("Logout"),
                    trailing: Icon(Icons.exit_to_app_outlined),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
