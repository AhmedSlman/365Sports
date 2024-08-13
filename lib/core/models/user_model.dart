// To parse this JSON data, do
//
//     final registerOneModel = registerOneModelFromJson(jsonString);

// import 'dart:convert';
//
// RegisterOneModel registerOneModelFromJson(String str) => RegisterOneModel.fromJson(json.decode(str));
//
// String registerOneModelToJson(RegisterOneModel data) => json.encode(data.toJson());
//
// class RegisterOneModel {
//   RegisterOneModel({
//      required this.status,
//     required this.massage,
//    required this.data,
//   });
//
//   int status;
//   String massage;
//   Data data;
//
//   factory RegisterOneModel.fromJson(Map<String, dynamic> json) => RegisterOneModel(
//     status: json["status"],
//     massage: json["massage"],
//     data: Data.fromJson(json["data"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "status": status,
//     "massage": massage,
//     "data": data.toJson(),
//   };
// }
//
// class Data {
//   Data({
//     required this.token,
//     required this.user,
//   });
//
//   String token;
//   User user;
//
//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//     token: json["token"],
//     user: User.fromJson(json["user"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "token": token,
//     "user": user.toJson(),
//   };
// }
//
// class User {
//   User({
//     required this.phone,
//     required this.email,
//     required this.password,
//     required this.relativePhone,
//     required this.dOB,
//     required this.updatedAt,
//     required this.createdAt,
//     required this.id,
//     required this.pinCode,
//     required this.pinCodeDateExpired,
//   });
//
//   String phone;
//   String email;
//   String password;
//   String relativePhone;
//   DateTime dOB;
//   DateTime updatedAt;
//   DateTime createdAt;
//   int id;
//   String pinCode;
//   DateTime pinCodeDateExpired;
//
//   factory User.fromJson(Map<String, dynamic> json) => User(
//     phone: json["phone"],
//     email: json["email"],
//     password: json["password"],
//     relativePhone: json["relative_phone"],
//     dOB: DateTime.parse(json["d_o_b"]),
//     updatedAt: DateTime.parse(json["updated_at"]),
//     createdAt: DateTime.parse(json["created_at"]),
//     id: json["id"],
//     pinCode: json["pin_code"],
//     pinCodeDateExpired: DateTime.parse(json["pin_code_date_expired"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "phone": phone,
//     "email": email,
//     "password": password,
//     "relative_phone": relativePhone,
//     "d_o_b": dOB.toIso8601String(),
//     "updated_at": updatedAt.toIso8601String(),
//     "created_at": createdAt.toIso8601String(),
//     "id": id,
//     "pin_code": pinCode,
//     "pin_code_date_expired": pinCodeDateExpired.toIso8601String(),
//   };
// }

// To parse this JSON data, do
//
//     final registerOneModel = registerOneModelFromJson(jsonString);

import 'dart:convert';

UserModel registerOneModelFromJson(String str) =>
    UserModel.fromJson(json.decode(str));

String registerOneModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.status,
    required this.massage,
    required this.data,
  });

  int status;
  String massage;
  Data data;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        status: json["status"],
        massage: json["massage"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "massage": massage,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.token,
    required this.user,
    required this.clientAUthImage,
  });

  String token;
  User user;
  String clientAUthImage;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"] ?? '',
        user: User.fromJson(json["user"]),
        clientAUthImage:
            json["clientAUthImage"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "user": user.toJson(),
        "clientAUthImage": clientAUthImage,
      };
}

class User {
  User({
    required this.id,
    this.createdAt,
    this.updatedAt,
    required this.email,
    required this.phone,
    required this.relativePhone,
    required this.dOB,
    required this.password,
    this.providerUserId,
    this.provider,
    this.pinCode,
    this.pinCodeDateExpired,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.nationaltyId,
    required this.countryId,
    required this.typeIdentifier,
    required this.expirationDate,
    required this.numberIdentifier,
    required this.bio,
    required this.code,
  });

  int id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String email;
  String phone;
  String relativePhone;
  String dOB;
  String password;
  dynamic providerUserId;
  dynamic provider;
  dynamic pinCode;
  dynamic pinCodeDateExpired;
  String firstName;
  String lastName;
  String gender;
  String nationaltyId;
  String countryId;
  String typeIdentifier;
  DateTime expirationDate;
  String numberIdentifier;
  String bio;
  String code;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] ?? 0,
        createdAt: DateTime.parse(json["created_at"] ?? '2022-02-24T15:17:17.000000Z'),
        updatedAt: DateTime.parse(json["updated_at"] ?? '2022-02-24T15:17:17.000000Z'),
        email: json["email"],
        phone: json["phone"],
        relativePhone: json["relative_phone"] ?? '',
        dOB: json["d_o_b"],
        password: json["password"] ?? '',
        providerUserId: json["provider_user_id"],
        provider: json["provider"],
        pinCode: json["pin_code"].toString(),
        pinCodeDateExpired: json["pin_code_date_expired"],
        firstName: json["first_name"] ?? '',
        lastName: json["last_name"] ?? '',
        gender: json["gender"] ?? '',
        nationaltyId:
            json["nationalty_id"] ?? '',
        countryId:
            json["country_id"] == null ? '' : json["country_id"].toString(),
        typeIdentifier:
            json["type_identifier"] ?? '1',
        expirationDate: DateTime.parse(json["expiration_date"] ?? '2026-06-06'),
        numberIdentifier:
            json["number_identifier"] ?? '',
        bio: json["bio"] ?? '',
        code: json["code"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        // "created_at": createdAt?.toIso8601String(),
        // "updated_at": updatedAt?.toIso8601String(),
        "email": email,
        "phone": phone,
        "relative_phone": relativePhone,
        "d_o_b": dOB,
        "password": password,
        "provider_user_id": providerUserId,
        "provider": provider,
        "pin_code": pinCode,
        "pin_code_date_expired": pinCodeDateExpired,
        "first_name": firstName,
        "last_name": lastName,
        "gender": gender,
        "nationalty_id": nationaltyId,
        "country_id": countryId,
        "type_identifier": typeIdentifier,
        "expiration_date":
            "${expirationDate.year.toString().padLeft(4, '0')}-${expirationDate.month.toString().padLeft(2, '0')}-${expirationDate.day.toString().padLeft(2, '0')}",
        "number_identifier": numberIdentifier,
        "bio": bio,
        "code": code,
      };
}
