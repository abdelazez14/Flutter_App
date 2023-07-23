import 'package:ok/CrudApi/crud.dart';
import 'package:ok/LinkApi.dart';

class SignUpData {
  Crud crud;
  SignUpData(this.crud);
  postData(String name, String email, String password) async {
    var response = await crud.postData(AppLink.signUp, {
      "name": name,
      "email": email,
      "password": password,
    },
    {
      "Accept":"application/json",
    }
    );
    return response.fold((l) => l, (r) => r);
  }
}
