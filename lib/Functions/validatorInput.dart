import 'package:get/get.dart';

validInput(String val,int min,int max,String type){
  if(type=="Username"){
    if(!GetUtils.isUsername(val)){
      return "Not valid Username";
    }
  }
  if(type=="Email"){
    if(!GetUtils.isEmail(val)){
      return "Not valid Email";
    }
  }
  if(type=="Phone"){
    if(!GetUtils.isPhoneNumber(val)){
      return "Not valid Phone";
    }
  }
  if(val.isEmpty){
    return "can`t be Empty";
  }
  if(val.length<min){
    return "value can`t be less than $min";
  }
  if(val.length>max){
    return "value can`t be larger than $max";
  }

}
