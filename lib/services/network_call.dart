import 'dart:convert';

import 'package:http/http.dart' as http;

class Network{
  static const  API = 'https://fakestoreapi.com/products/categories';
   List<dynamic> categoryList;
   Future<List<dynamic>> fetchCategoryList() async {
     var response = await http.get(API);
     categoryList = <dynamic>[];
     if (response.statusCode == 200) {
       categoryList = json.decode(response.body);
       print(categoryList);
     }
     return categoryList;
   }
}