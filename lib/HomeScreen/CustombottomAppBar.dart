import 'package:flutter/material.dart';
import 'package:ok/AppColors.dart';
class CustomBottomAppBar extends StatelessWidget {
   CustomBottomAppBar({Key? key,required this.onPressed, required this.text, required this.iconData, required this.active, }) : super(key: key);
final void Function()? onPressed;
final String text;
final IconData iconData;
final bool ?active;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children:  [
          Icon(iconData,
              color:active==true?AppColor.primaryColor: AppColor.greyBlack),
             ],
      ),
    );
  }
}
