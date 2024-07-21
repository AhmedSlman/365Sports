// To parse this JSON data, do
//
//     final gusetModel = gusetModelFromJson(jsonString);

import 'dart:convert';

GusetModel gusetModelFromJson(String str) => GusetModel.fromJson(json.decode(str));

String gusetModelToJson(GusetModel data) => json.encode(data.toJson());

class GusetModel {
  GusetModel({
    this.status,
    this.massage,
    this.data,
  });

  int? status;
  String? massage;
  Data? data;

  factory GusetModel.fromJson(Map<String, dynamic> json) => GusetModel(
    status: json["status"],
    massage: json["massage"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "massage": massage,
    "data": data!.toJson(),
  };
}

class Data {
  Data({
    this.token,
    this.user,
  });

  String? token;
  User? user;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    token: json["token"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "user": user!.toJson(),
  };
}

class User {
  User({
    this.email,
    this.pinCode,
    this.pinCodeDateExpired,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  String? email;
  int? pinCode;
  DateTime? pinCodeDateExpired;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  factory User.fromJson(Map<String, dynamic> json) => User(
    email: json["email"],
    pinCode: json["pin_code"],
    pinCodeDateExpired: DateTime.parse(json["pin_code_date_expired"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "pin_code": pinCode,
    "pin_code_date_expired": pinCodeDateExpired!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "created_at": createdAt!.toIso8601String(),
    "id": id,
  };
}
