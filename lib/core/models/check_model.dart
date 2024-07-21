// To parse this JSON data, do
//
//     final checkModel = checkModelFromJson(jsonString);

import 'dart:convert';

CheckModel checkModelFromJson(String str) => CheckModel.fromJson(json.decode(str));

String checkModelToJson(CheckModel data) => json.encode(data.toJson());

class CheckModel {
  CheckModel({
    this.live,
  });

  int? live;

  factory CheckModel.fromJson(Map<String, dynamic> json) => CheckModel(
    live: json["live"],
  );

  Map<String, dynamic> toJson() => {
    "live": live,
  };
}
