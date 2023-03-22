import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider_practice/model/user_model.dart';

class HomeProvider with ChangeNotifier{
List <UserModel> userModelList =[];
UserModel? userModel;
bool isLoading = false;
Dio dio = Dio();
 getProducts()async{

   isLoading =true;

final response = await dio.get("https://jsonplaceholder.typicode.com/posts") ;
   isLoading =false;
if(response!=null && response.statusCode == 200){
  final data = response.data as List;
   userModelList = data.map((e) => UserModel.fromJson(e)).toList();
  print("UserModel ${userModelList.length}");
  notifyListeners();


}

  }
}