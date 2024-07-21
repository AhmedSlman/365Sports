// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

NotificationModel notificationModelFromJson(String str) => NotificationModel.fromJson(json.decode(str));

String notificationModelToJson(NotificationModel data) => json.encode(data.toJson());

class NotificationModel {
  NotificationModel({
    required this.data,
    this.links,
    this.meta,
    required this.status,
    required this.massage,
  });

  List<Notifications> data;
  Links? links;
  Meta? meta;
  int status;
  String massage;

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
    data: List<Notifications>.from(json["data"].map((x) => Notifications.fromJson(x))),
    links: Links.fromJson(json["links"]),
    meta: Meta.fromJson(json["meta"]),
    status: json["status"],
    massage: json["massage"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "links": links?.toJson(),
    "meta": meta?.toJson(),
    "status": status,
    "massage": massage,
  };
}

class Notifications {
  Notifications({
    this.id,
    this.title,
    this.body,
    this.date,
    this.time,
    this.profileImage,
  });

  int? id;
  String? title;
  String? body;
  String? date;
  String? time;
  String? profileImage;

  factory Notifications.fromJson(Map<String, dynamic> json) => Notifications(
    id: json["id"],
    title: json["title"],
    body: json["body"],
    date: json["date"],
    time: json["time"],
    profileImage: json["profile_image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "body": body,
    "date": date,
    "time": time,
    "profile_image": profileImage,
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
