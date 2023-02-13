import 'package:covid_tracker/model/world_cases_model.dart';

class CountryModel {
  String? updated;
  String? country;
  String? id;
  String? flag;
  WorldCasesModel? model;

  CountryModel.fromJson(Map<String, dynamic> json) {
    updated = json["updated"];
    country = json["country"];
    id = json["id"];
    flag = json["flag"];
    model = WorldCasesModel.fromJson(json["model"]);
  }

  CountryModel({
    this.updated,
    this.country,
    this.id,
    this.flag,
    this.model,
  });
}
