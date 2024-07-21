// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

import 'dart:convert';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
  HomeModel({
    this.data,
    this.links,
    this.meta,
    this.status,
    this.massage,
  });

  List<Datu>? data;
  Links? links;
  Meta? meta;
  int? status;
  String? massage;

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
    data: List<Datu>.from(json["data"].map((x) => Datu.fromJson(x))),
    links: Links.fromJson(json["links"]),
    meta: Meta.fromJson(json["meta"]),
    status: json["status"],
    massage: json["massage"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "links": links!.toJson(),
    "meta": meta!.toJson(),
    "status": status,
    "massage": massage,
  };
}

class Datu {
  Datu({
    this.id,
    this.name,
    this.clientImage,
    this.title,
    this.createdAt,
    this.views,
    this.videos,
  });

  int? id;
  String? name;
  String? clientImage;
  String? title;
  String? createdAt;
  int? views;
  String? videos;

  factory Datu.fromJson(Map<String, dynamic> json) => Datu(
    id: json["id"],
    name: json["name"],
    clientImage: json["client-image"],
    title: json["title"],
    createdAt: json["created_at"],
    views: json["views"],
    videos: json["videos"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "client-image": clientImage,
    "title": title,
    "created_at": createdAt,
    "views": views,
    "videos": videos,
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
