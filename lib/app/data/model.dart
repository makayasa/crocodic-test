// To parse this JSON data, do
//
//     final modelFlight = modelFlightFromJson(jsonString);

import 'dart:convert';

import 'package:dropdown_search/dropdown_search.dart';

ModelFlight modelFlightFromJson(String str) => ModelFlight.fromJson(json.decode(str));

String modelFlightToJson(ModelFlight data) => json.encode(data.toJson());

class ModelFlight {
  ModelFlight({
    this.airportName,
    this.businessId,
    this.airportCode,
    this.businessNameTransId,
    this.locationName,
    this.countryId,
    this.countryName,
    this.label,
  });

  String? airportName;
  String? businessId;
  String? airportCode;
  String? businessNameTransId;
  String? locationName;
  String? countryId;
  String? countryName;
  String? label;

  factory ModelFlight.fromJson(Map<String, dynamic> json) => ModelFlight(
    airportName: json["airport_name"],
    businessId: json["business_id"],
    airportCode: json["airport_code"],
    businessNameTransId: json["business_name_trans_id"],
    locationName: json["location_name"],
    countryId: json["country_id"],
    countryName: json["country_name"],
    label: json["label"],
  );

  Map<String, dynamic> toJson() => {
    "airport_name": airportName,
    "business_id": businessId,
    "airport_code": airportCode,
    "business_name_trans_id": businessNameTransId,
    "location_name": locationName,
    "country_id": countryId,
    "country_name": countryName,
    "label": label,
  };

  static List<ModelFlight> fromJsonList(List list) {
    if (list.isEmpty) return List<ModelFlight>.empty();
    return list.map((item) => ModelFlight.fromJson(item)).toList();
  }

  static List<ModelFlight> fromGroup(List<Map<String, List<dynamic>>> map) {
    if(map.isEmpty) {
      return List<ModelFlight>.empty();
    }
    return map.map((item) => ModelFlight.fromJson(item)).toList();
  }

  static ModelFlight parseArticle(Map<String, dynamic> map) {
    return ModelFlight(
        airportName: map['airport_name'],
        businessId: map['business_id'],
        airportCode: map['airport_code'],
        businessNameTransId: map['business_name_trans_id'],
        locationName: map['location_name'],
        countryId: map['country_id'],
        countryName: map['country_name'],
        label: map['label']
    );
  }



  // static List<ModelFlight> fromJsonGroup(Map<String, dynamic> map) {
  //   if(map.isEmpty) return List<ModelFlight>.empty();
  //   return ModelFlight(
  //     airportName: map['airport_name'],
  //     businessId: map['business_id'],
  //     airportCode: map['airport_code'],
  //     businessNameTransId: map['business_name_trans_id'],
  //     locationName: map['location_name'],
  //     countryId: map['country_id'],
  //     countryName: map['country_name'],
  //     label: map['label']
  //   )
  // }
}
