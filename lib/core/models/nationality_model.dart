// To parse this JSON data, do
//
//     final nationalityModel = nationalityModelFromJson(jsonString);

import 'dart:convert';

NationalityModel nationalityModelFromJson(String str) => NationalityModel.fromJson(json.decode(str));

String nationalityModelToJson(NationalityModel data) => json.encode(data.toJson());

class NationalityModel {
  NationalityModel({
    this.status,
    this.massage,
    required this.data,
  });

  int? status;
  String? massage;
  List<Nationalities> data;

  factory NationalityModel.fromJson(Map<String, dynamic> json) => NationalityModel(
    status: json["status"],
    massage: json["massage"],
    data: List<Nationalities>.from(json["data"].map((x) => Nationalities.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "massage": massage,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Nationalities {
  Nationalities({
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

  factory Nationalities.fromJson(Map<String, dynamic> json) => Nationalities(
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


