import 'package:http/http.dart';
import 'dart:convert';

import '../model/dishes_list_model.dart';



class ApiService {

  final endPointUrl =
      "https://8b648f3c-b624-4ceb-9e7b-8028b7df0ad0.mock.pstmn.io/dishes/v1/";

  Future<DishesListModel> getDishes() async{
    Response res = await get(Uri.parse(endPointUrl));

    print("response ${res.statusCode} ${res.body}");
    if(res.statusCode == 200){
      Map<String, dynamic> json = jsonDecode(res.body);
      DishesListModel dishesListModel =  DishesListModel.fromJson(json);

      print("articles $dishesListModel");
      return dishesListModel;
    }
    else{
      throw('Can\'t get the Dishes');
    }
  }
}