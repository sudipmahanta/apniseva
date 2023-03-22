// To parse this JSON data, do
//
//     final locationModel = locationModelFromJson(jsonString);

import 'dart:convert';

LocationModel locationModelFromJson(String str) => LocationModel.fromJson(json.decode(str));

String locationModelToJson(LocationModel data) => json.encode(data.toJson());

class LocationModel {
  LocationModel({
    this.status,
    this.error,
    this.messages,
  });

  int? status;
  bool? error;
  Messages? messages;

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
    status: json["status"] == null ? null : json["status"],
    error: json["error"] == null ? null : json["error"],
    messages: json["messages"] == null ? null : Messages.fromJson(json["messages"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "error": error == null ? null : error,
    "messages": messages == null ? null : messages!.toJson(),
  };
}

class Messages {
  Messages({
    this.responsecode,
    this.status,
  });

  String? responsecode;
  Status? status;

  factory Messages.fromJson(Map<String, dynamic> json) => Messages(
    responsecode: json["responsecode"] == null ? null : json["responsecode"],
    status: json["status"] == null ? null : Status.fromJson(json["status"]),
  );

  Map<String, dynamic> toJson() => {
    "responsecode": responsecode == null ? null : responsecode,
    "status": status == null ? null : status!.toJson(),
  };
}

class Status {
  Status({
    this.city,
  });

  List<City>? city;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
    city: json["city"] == null ? null : List<City>.from(json["city"].map((x) => City.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "city": city == null ? null : List<dynamic>.from(city!.map((x) => x.toJson())),
  };
}

class City {
  City({
    this.cityId,
    this.cityName,
    this.status,
    this.createdDate,
    this.updatedDate,
  });

  String? cityId;
  String? cityName;
  String? status;
  String? createdDate;
  String? updatedDate;

  factory City.fromJson(Map<String, dynamic> json) => City(
    cityId: json["city_id"] == null ? null : json["city_id"],
    cityName: json["city_name"] == null ? null : json["city_name"],
    status: json["status"] == null ? null : json["status"],
    createdDate: json["created_date"] == null ? null : json["created_date"],
    updatedDate: json["updated_date"] == null ? null : json["updated_date"],
  );

  Map<String, dynamic> toJson() => {
    "city_id": cityId == null ? null : cityId,
    "city_name": cityName == null ? null : cityName,
    "status": status == null ? null : status,
    "created_date": createdDate == null ? null : createdDate,
    "updated_date": updatedDate == null ? null : updatedDate,
  };
}
