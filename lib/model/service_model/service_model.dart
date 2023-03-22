// To parse this JSON data, do
//
// final serviceDataModel = serviceDataModelFromJson(jsonString);

import 'dart:convert';

ServiceDataModel serviceDataModelFromJson(String str) => ServiceDataModel.fromJson(json.decode(str));

String serviceDataModelToJson(ServiceDataModel data) => json.encode(data.toJson());

class ServiceDataModel {
  ServiceDataModel({
    this.status,
    this.error,
    this.messages,
  });

  int? status;
  bool? error;
  Messages? messages;

  factory ServiceDataModel.fromJson(Map<String, dynamic> json) => ServiceDataModel(
    status: json["status"]== null ? null : json["status"],
    error: json["error"] == null ? null : json["error"],
    messages: json["messages"] ==null ? null : Messages.fromJson(json["messages"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status ==null ? null : status,
    "error": error ==null ? null: error,
    "messages": messages == null ? null: messages!.toJson(),
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
    responsecode: json["responsecode"]==null ? null:json["responsecode"],
    status: json["status"] ==null ? null: Status.fromJson(json["status"]),
  );

  Map<String, dynamic> toJson() => {
    "responsecode": responsecode ==null ? null: responsecode,
    "status": status ==null ? null: status!.toJson(),
  };
}

class Status {
  Status({
    this.serviceList,
  });

  List<ServiceList>? serviceList;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
    serviceList: json["service_list"] ==null ? null:  List<ServiceList>.from(json["service_list"].map((x) => ServiceList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "service_list":serviceList == null ? null : List<dynamic>.from(serviceList!.map((x) => x.toJson())),
  };
}

class ServiceList {
  ServiceList({
    this.serviceId,
    this.serviceName,
    this.cityId,
    this.serviceImage,
    this.serviceDetails,
    this.serviceReguPrice,
    this.serviceSalePrice,
    this.catId,
    this.status,
    this.priceId,
    this.amount,
    this.createdDate,
    this.updatedDate,
  });

  String? serviceId;
  String? serviceName;
  String? cityId;
  String? serviceImage;
  String? serviceDetails;
  dynamic serviceReguPrice;
  dynamic serviceSalePrice;
  String? catId;
  String? status;
  String? priceId;
  String? amount;
  String? createdDate;
  String? updatedDate;

  factory ServiceList.fromJson(Map<String, dynamic> json) => ServiceList(
    serviceId: json["service_id"] == null ? null : json["service_id"],
    serviceName: json["service_name"] == null ? null : json["service_name"],
    cityId: json["city_id"] == null ? null : json["city_id"],
    serviceImage: json["service_image"] == null ? null : json["service_image"],
    serviceDetails: json["service_details"] == null ? null : json["service_details"],
    serviceReguPrice: json["service_regu_price"] == null ? null : json["service_regu_price"],
    serviceSalePrice: json["service_sale_price"] == null ? null : json["service_sale_price"],
    catId: json["cat_id"] == null ? null : json["cat_id"],
    status: json["status"] == null ? null : json["status"],
    priceId: json["price_id"] == null ? null : json["price_id"],
    amount: json["amount"] == null ? null : json["amount"],
    createdDate: json["created_date"] == null ? null : json["created_date"],
    updatedDate: json["updated_date"] == null ? null : json["updated_date"],
  );

  Map<String, dynamic> toJson() => {
    "service_id": serviceId == null ? null : serviceId,
    "service_name": serviceName == null ? null : serviceName,
    "city_id": cityId == null ? null : cityId,
    "service_image": serviceImage == null ? null : serviceImage,
    "service_details": serviceDetails == null ? null : serviceDetails,
    "service_regu_price": serviceReguPrice == null ? null : serviceReguPrice,
    "service_sale_price": serviceSalePrice  == null ? null :  serviceSalePrice,
    "cat_id": catId == null ? null : catId,
    "status": status == null ? null : status,
    "price_id": priceId == null ? null : priceId,
    "amount": amount == null ? null : amount,
    "created_date": createdDate == null ? null : createdDate,
    "updated_date": updatedDate == null ? null : updatedDate,
  };
}
