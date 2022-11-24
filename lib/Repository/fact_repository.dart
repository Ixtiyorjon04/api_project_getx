import 'dart:convert';

import 'package:api_project_getx/Model/fact_model.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Repo extends GetxController {
  var factModels = [].obs;

  Future<RxList?> getFact(String num) async {
    var headers = {'X-Api-Key': 'z1PIEtHQGj1Ee6/DGF4zZg==wYZ1qW9VEq3QsmzP'};

    String baseUrl = 'https://api.api-ninjas.com/v1/facts?limit=$num';
    final responce =
        await http.Client().get(Uri.parse(baseUrl), headers: headers);
    if (responce.statusCode == 200) {
      Iterable results = jsonDecode(responce.body);
      for (var result in results) {
        var factModel = FactModel.fromJson(result);
        factModels.add(factModel);
      }
      return factModels;
    } else {
      return null;
    }
  }
  RxList get FactRepo=>factModels;
}
