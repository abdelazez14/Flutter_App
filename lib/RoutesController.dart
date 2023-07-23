
import 'package:ok/Cart/cart.dart';
import 'package:ok/CheckOut/checkOut.dart';
 import 'package:ok/Forget_Password/forgetPassword.dart';
import 'package:ok/HomePage/AboutUs.dart';

import 'package:ok/HomeScreen/homeScreen.dart';
import 'package:ok/Middleware.dart';
import 'package:ok/SignUp/SuccessSignUp.dart';
 import 'package:ok/SubItems/SubItemsView.dart';
import 'package:ok/favourite/FavouriteView.dart';
import 'package:ok/productdetails/product_view.dart';
import 'package:ok/resetPassword/SuccessResetPassword.dart';
import 'package:ok/resetPassword/resetPasswordView.dart';
import 'package:ok/routes.dart';
import 'package:ok/signIn/SignInView.dart';
import 'CheckOut/SuccessCheckOut.dart';
import 'SignUp/SignUp_view.dart';
import 'package:get/get.dart';

import 'items/ItemsHome.dart';


List<GetPage<dynamic>>? routes=[
   GetPage(name: AppRoutes.SignIn,page: () => const SignIn(),middlewares: [Middleware()]),
  GetPage(name: AppRoutes.SignUp, page: ()=> const SignUp()),
  GetPage(name: AppRoutes.forgetPassword, page: ()=> const ForgetPassword()),
  GetPage(name: AppRoutes.resetPassword, page: ()=> const ResetPassword()),
  GetPage(name: AppRoutes.successReset, page: ()=> const SuccessResetPassword()),
  GetPage(name: AppRoutes.successSignUp, page: ()=> const SuccessSignUP()),
  GetPage(name: AppRoutes.HomePage, page: ()=> const HomeScreen()),
  GetPage(name: AppRoutes.Items, page: ()=> const ItemsHome()),
  GetPage(name: AppRoutes.Products, page: ()=> const ProductDetails()),
  GetPage(name: AppRoutes.Cart, page: ()=> const Cart()),
  GetPage(name: AppRoutes.subItems, page: ()=> const SubItems()),
  GetPage(name: AppRoutes.AboutUs, page: ()=> const AboutUs()),
  GetPage(name: AppRoutes.Favourite, page: ()=> const FavouriteHome()),
  GetPage(name: AppRoutes.CheckOut, page: ()=> const CheckOut()),
  GetPage(name: AppRoutes.SuccessCheckOut, page: ()=> const SuccessCheckOut()),
];

