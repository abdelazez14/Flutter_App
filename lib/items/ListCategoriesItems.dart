// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import 'package:ok/items/ItemsController.dart';

// import '../AppColors.dart';
// class ListCategoriesItems extends GetView<ItemsControllerImp> {
//   const ListCategoriesItems({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 50,
//       padding: const EdgeInsets.all(10),
//         child: ListView.separated(
//           scrollDirection: Axis.horizontal,
//             shrinkWrap: true,
//             itemBuilder: (context,index)=> InkWell(
//               onTap: (){
//                 controller.changeBorder(index);
//               },
//               child: Column(
//                 children:[
//                   Container(
//                       decoration: BoxDecoration(
//                         border: controller.index==index ?const Border(
//                           bottom:  BorderSide(width: 3,color: AppColor.primaryColor),
//                         ):null
//                       ),
//                       child:  Text(controller.name[index],style: const TextStyle(color: AppColor.greyBlack,fontSize: 15,fontWeight: FontWeight.bold),)),
//                 ],
//               ),
//             ),
//             separatorBuilder: (context,index){
//              return const SizedBox(width: 50,);
//     },
//             itemCount:controller.name.length ),
//     );
//   }

// }
