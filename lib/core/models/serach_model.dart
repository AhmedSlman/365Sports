// To parse this JSON data, do
//
//     final searchModel = searchModelFromJson(jsonString);

import 'dart:convert';

SearchModel searchModelFromJson(String str) =>
    SearchModel.fromJson(json.decode(str));

String searchModelToJson(SearchModel data) => json.encode(data.toJson());

class SearchModel {
  SearchModel({
    this.data,
    this.links,
    this.meta,
    this.status,
    this.massage,
  });

  List<Datum>? data;
  Links? links;
  Meta? meta;
  int? status;
  String? massage;

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        data: json["data"] != null
            ? List<Datum>.from(json["data"].map((x) => Datum.fromJson(x)))
            : null,
        links: json["links"] != null ? Links.fromJson(json["links"]) : null,
        meta: json["meta"] != null ? Meta.fromJson(json["meta"]) : null,
        status: json["status"],
        massage: json["massage"],
      );

  Map<String, dynamic> toJson() => {
        "data": data != null
            ? List<dynamic>.from(data!.map((x) => x.toJson()))
            : null,
        "links": links?.toJson(),
        "meta": meta?.toJson(),
        "status": status,
        "massage": massage,
      };
}

class Datum {
  Datum({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.email,
    this.phone,
    this.relativePhone,
    this.dob,
    this.password,
    this.providerUserId,
    this.provider,
    this.pinCode,
    this.pinCodeDateExpired,
    this.firstName,
    this.lastName,
    this.gender,
    this.nationalityId,
    this.countryId,
    this.typeIdentifier,
    this.expirationDate,
    this.numberIdentifier,
    this.bio,
    this.videos,
  });

  int? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? email;
  String? phone;
  String? relativePhone;
  DateTime? dob;
  String? password;
  dynamic providerUserId;
  dynamic provider;
  dynamic pinCode;
  dynamic pinCodeDateExpired;
  String? firstName;
  String? lastName;
  dynamic gender;
  dynamic nationalityId;
  int? countryId;
  dynamic typeIdentifier;
  dynamic expirationDate;
  dynamic numberIdentifier;
  String? bio;
  List<Video>? videos;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        createdAt: json["created_at"] != null
            ? DateTime.parse(json["created_at"])
            : null,
        updatedAt: json["updated_at"] != null
            ? DateTime.parse(json["updated_at"])
            : null,
        email: json["email"],
        phone: json["phone"],
        relativePhone: json["relative_phone"],
        dob: json["d_o_b"] != null ? DateTime.parse(json["d_o_b"]) : null,
        password: json["password"],
        providerUserId: json["provider_user_id"],
        provider: json["provider"],
        pinCode: json["pin_code"],
        pinCodeDateExpired: json["pin_code_date_expired"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        gender: json["gender"],
        nationalityId: json["nationalty_id"],
        countryId: json["country_id"],
        typeIdentifier: json["type_identifier"],
        expirationDate: json["expiration_date"],
        numberIdentifier: json["number_identifier"],
        bio: json["bio"],
        videos: json["videos"] != null
            ? List<Video>.from(json["videos"].map((x) => Video.fromJson(x)))
            : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "email": email,
        "phone": phone,
        "relative_phone": relativePhone,
        "d_o_b": dob?.toIso8601String(),
        "password": password,
        "provider_user_id": providerUserId,
        "provider": provider,
        "pin_code": pinCode,
        "pin_code_date_expired": pinCodeDateExpired,
        "first_name": firstName,
        "last_name": lastName,
        "gender": gender,
        "nationalty_id": nationalityId,
        "country_id": countryId,
        "type_identifier": typeIdentifier,
        "expiration_date": expirationDate,
        "number_identifier": numberIdentifier,
        "bio": bio,
        "videos": videos != null
            ? List<dynamic>.from(videos!.map((x) => x.toJson()))
            : null,
      };
}

class Video {
  Video({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.title,
    this.description,
    this.categoryId,
    this.clientId,
    this.tags,
  });

  int? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? title;
  String? description;
  int? categoryId;
  int? clientId;
  String? tags;

  factory Video.fromJson(Map<String, dynamic> json) => Video(
        id: json["id"],
        createdAt: json["created_at"] != null
            ? DateTime.parse(json["created_at"])
            : null,
        updatedAt: json["updated_at"] != null
            ? DateTime.parse(json["updated_at"])
            : null,
        title: json["title"],
        description: json["description"],
        categoryId: json["category_id"],
        clientId: json["client_id"],
        tags: json["tags"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "title": title,
        "description": description,
        "category_id": categoryId,
        "client_id": clientId,
        "tags": tags,
      };
}

class Links {
  Links({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  String? first;
  String? last;
  dynamic prev;
  dynamic next;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        first: json["first"],
        last: json["last"],
        prev: json["prev"],
        next: json["next"],
      );

  Map<String, dynamic> toJson() => {
        "first": first,
        "last": last,
        "prev": prev,
        "next": next,
      };
}

class Meta {
  Meta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  int? currentPage;
  int? from;
  int? lastPage;
  String? path;
  int? perPage;
  int? to;
  int? total;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentPage: json["current_page"],
        from: json["from"],
        lastPage: json["last_page"],
        path: json["path"],
        perPage: json["per_page"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "from": from,
        "last_page": lastPage,
        "path": path,
        "per_page": perPage,
        "to": to,
        "total": total,
      };
}
