import 'dart:convert';

import 'package:cbnits_assessment/model/products_model.dart';
import 'package:http/http.dart' as http;


class ProductServices {
  String categoryName;

  setCategoryName(String name){
    categoryName = name;
  }

  static const API = 'https://fakestoreapi.com/products/category/';
   List<ProductsModel> electronicItemList;
   Future<List<ProductsModel>> fetchElectronics() async {
    var response = await http.get(API + categoryName);
    electronicItemList = <ProductsModel>[];
    if(response.statusCode == 200){
      List<dynamic> jsonData =json.decode(response.body);
      for(var item in jsonData){
        electronicItemList.add(ProductsModel.fromJson(item));
      }
    }
    return electronicItemList;
  }

}
