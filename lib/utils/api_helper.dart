import 'dart:convert';

import 'package:http/http.dart' as http;

import '../screen/home/model/home_model.dart';

class ApiHelper {
  static ApiHelper helper = ApiHelper._();
  ApiHelper._();

  Future<HomeModel?> getData() async {
    String apiLink = "https://dummyjson.com/products";
    var res = await http.get(Uri.parse(apiLink));
    if (res.statusCode == 200) {
      var json = jsonDecode(res.body);
      HomeModel homeModel = HomeModel.mapToModel(json);
      return homeModel;
    }
    return null;
  }
}
