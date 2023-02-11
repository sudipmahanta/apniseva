// To parse this JSON data, do
//
//     final cartDetailsDataModel = cartDetailsDataModelFromJson(jsonString);

import 'dart:convert';

CartDetailsDataModel cartDetailsDataModelFromJson(String str) => CartDetailsDataModel.fromJson(json.decode(str));

String cartDetailsDataModelToJson(CartDetailsDataModel data) => json.encode(data.toJson());

class CartDetailsDataModel {
  CartDetailsDataModel({
    this.status,
    this.error,
    this.messages,
  });

  int? status;
  bool? error;
  Messages? messages;

  factory CartDetailsDataModel.fromJson(Map<String, dynamic> json) => CartDetailsDataModel(
    status: json["status"],
    error: json["error"],
    messages: Messages.fromJson(json["messages"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "error": error,
    "messages": messages!.toJson(),
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
    responsecode: json["responsecode"],
    status: Status.fromJson(json["status"]),
  );

  Map<String, dynamic> toJson() => {
    "responsecode": responsecode,
    "status": status!.toJson(),
  };
}

class Status {
  Status({
    this.allCart,
    this.totalAmount,
    this.addressData,
  });

  List<AllCart>? allCart;
  TotalAmount? totalAmount;
  List<AddressDatum>? addressData;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
    allCart: List<AllCart>.from(json["All_cart"].map((x) => AllCart.fromJson(x))),
    totalAmount: TotalAmount.fromJson(json["Total_amount"]),
    addressData: List<AddressDatum>.from(json["address_data"].map((x) => AddressDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "All_cart": List<dynamic>.from(allCart!.map((x) => x.toJson())),
    "Total_amount": totalAmount!.toJson(),
    "address_data": List<dynamic>.from(addressData!.map((x) => x.toJson())),
  };
}

class AddressDatum {
  AddressDatum({
    this.addressId,
    this.userId,
    this.firstName,
    this.lastName,
    this.cityname,
    this.state,
    this.pincode,
    this.email,
    this.number,
    this.address1,
    this.adress2,
    this.isDelte,
    this.lat,
    this.lng,
    this.createdDate,
    this.updatdDare,
    this.cityId,
    this.cityName,
    this.status,
    this.updatedDate,
  });

  String? addressId;
  String? userId;
  String? firstName;
  String? lastName;
  String? cityname;
  String? state;
  String? pincode;
  String? email;
  String? number;
  String? address1;
  String? adress2;
  String? isDelte;
  dynamic lat;
  dynamic lng;
  String? createdDate;
  String? updatdDare;
  String? cityId;
  String? cityName;
  String? status;
  String? updatedDate;

  factory AddressDatum.fromJson(Map<String, dynamic> json) => AddressDatum(
    addressId: json["address_id"],
    userId: json["user_id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    cityname: json["cityname"],
    state: json["state"],
    pincode: json["pincode"],
    email: json["email"],
    number: json["number"],
    address1: json["address1"],
    adress2: json["adress2"],
    isDelte: json["is_delte"],
    lat: json["lat"],
    lng: json["lng"],
    createdDate: json["created_date"],
    updatdDare: json["updatd_dare"],
    cityId: json["city_id"],
    cityName: json["city_name"],
    status: json["status"],
    updatedDate: json["updated_date"],
  );

  Map<String, dynamic> toJson() => {
    "address_id": addressId,
    "user_id": userId,
    "first_name": firstName,
    "last_name": lastName,
    "cityname": cityname,
    "state": state,
    "pincode": pincode,
    "email": email,
    "number": number,
    "address1": address1,
    "adress2": adress2,
    "is_delte": isDelte,
    "lat": lat,
    "lng": lng,
    "created_date": createdDate,
    "updatd_dare": updatdDare,
    "city_id": cityId,
    "city_name": cityName,
    "status": status,
    "updated_date": updatedDate,
  };
}

class AllCart {
  AllCart({
    this.cartId,
    this.servicename,
    this.qty,
    this.image,
    this.price,
  });

  String? cartId;
  String? servicename;
  String? qty;
  String? image;
  String? price;

  factory AllCart.fromJson(Map<String, dynamic> json) => AllCart(
    cartId: json["cart_id"],
    servicename: json["servicename"],
    qty: json["qty"],
    image: json["image"],
    price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "cart_id": cartId,
    "servicename": servicename,
    "qty": qty,
    "image": image,
    "price": price,
  };
}

class TotalAmount {
  TotalAmount({
    this.total,
  });

  int? total;

  factory TotalAmount.fromJson(Map<String, dynamic> json) => TotalAmount(
    total: json["Total"],
  );

  Map<String, dynamic> toJson() => {
    "Total": total,
  };
}
