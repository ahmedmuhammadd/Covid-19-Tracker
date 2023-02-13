import 'dart:convert';
import 'package:covid_tracker/shared/utilities.dart';
import 'package:http/http.dart' as http;
import '../model/world_cases_model.dart';

class StatesServices {
  Future<WorldCasesModel> getWolrdStates() async {
    http.Response response = await http.get(Uri.parse(Utilities.worldStates));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return WorldCasesModel.fromJson(data);
    } else {
      throw Exception('Failed To Load Data !');
    }
  }

  Future<List<dynamic>> getCountries() async {
    var data;
    http.Response response = await http.get(Uri.parse(Utilities.allCountries));
    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('Failed To Load Data !');
    }
  }
}
