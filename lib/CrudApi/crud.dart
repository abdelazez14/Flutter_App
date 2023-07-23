import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:ok/Functions/checkInternet.dart';
import 'StatusRequest.dart';
import 'package:http/http.dart'as http;

class Crud{

 Future <Either<StatusRequest,Map>?> getData(String linkurl,{Map<String,String>? headers}) async{

  try{
      var response = await http.get(Uri.parse(linkurl),headers: headers);
      Map responseBody=json.decode(response.body);
      if(response.statusCode==200||response.statusCode==201){
        return Right(responseBody );
      }else{
        return const Left(StatusRequest.serverfailure);
      }
  }catch(_){
    return const Left(StatusRequest.serverfailure);
  }
 }
 

 

 Future <Either<StatusRequest,Map>> postData(String linkurl,Map data,Map<String,String> headers) async{
  
  try{
      var response = await http.post(Uri.parse(linkurl),body:data,headers:headers);
      Map responseBody=json.decode(response.body);
      if(response.statusCode==200||response.statusCode==201){
        return Right(responseBody);
      }else if (response.statusCode==422){
        return Right(responseBody) ;
      }else{
        return const Left(StatusRequest.serverfailure) ;  
      }
  }catch(_){
    return const Left(StatusRequest.failure);
  }

 }
 

}