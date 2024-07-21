// To parse this JSON data, do
//
//     final countryModel = countryModelFromJson(jsonString);

import 'dart:convert';

CountryModel countryModelFromJson(String str) => CountryModel.fromJson(json.decode(str));

String countryModelToJson(CountryModel data) => json.encode(data.toJson());

class CountryModel {
  CountryModel({
    this.status,
    this.massage,
    required this.data,
  });

  int? status;
  String? massage;
  List<Datum> data;

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
    status: json["status"],
    massage: json["massage"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "massage": massage,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.isActive,
  });

  int? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? name;
  String? isActive;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    name: json["name"],
    isActive: json["is_active"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "name": name,
    "is_active": isActive,
  };
}
