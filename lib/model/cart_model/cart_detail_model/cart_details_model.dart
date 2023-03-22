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
    messages: json["messages"] == null ? null : Messages.fromJson(json["messages"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "error": error == null ? null : error,
    "messages": messages == null ? null : messages?.toJson(),
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
    "status": status?.toJson(),
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
    allCart: json["All_cart"] == null ? [] : List<AllCart>.from(json["All_cart"].map((x) => AllCart.fromJson(x))),
    totalAmount: json["Total_amount"] == null ? null : TotalAmount.fromJson(json["Total_amount"]),
    addressData: json["address_data"] == null ? [] : List<AddressDatum>.from(json["address_data"].map((x) => AddressDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "All_cart": allCart == null ? [] : List<dynamic>.from(allCart!.map((x) => x.toJson())),
    "Total_amount": totalAmount?.toJson(),
    "address_data":  addressData == null ? null : List<dynamic>.from(addressData!.map((x) => x.toJson())),
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
    addressId: json["address_id"] == null ? null : json["address_id"],
    userId: json["user_id"]== null ? null :json["user_id"],
    firstName: json["first_name"]== null ? null : json["first_name"],
    lastName: json["last_name"]== null ? null : json["last_name"],
    cityname: json["cityname"]== null ? null : json["cityname"],
    state: json["state"]== null ? null :json["state"],
    pincode: json["pincode"]== null ? null : json["pincode"],
    email: json["email"]== null ? null : json["email"],
    number: json["number"]== null ? null :json["number"],
    address1: json["address1"]== null ? null :json["address1"],
    adress2: json["adress2"]== null ? null : json["adress2"],
    isDelte: json["is_delte"]== null ? null : json["is_delte"],
    lat: json["lat"]== null ? null : json["lat"],
    lng: json["lng"]== null ? null : json["lng"],
    createdDate: json["created_date"]== null ? null :json["created_date"],
    updatdDare: json["updatd_dare"]== null ? null :json["updatd_dare"],
    cityId: json["city_id"]== null ? null :json["city_id"],
    cityName: json["city_name"]== null ? null :json["city_name"],
    status: json["status"] == null ? null : json["status"],
    updatedDate: json["updated_date"]== null ? null : json["updated_date"],
  );

  Map<String, dynamic> toJson() => {
    "address_id": addressId== null ? null :addressId,
    "user_id": userId== null ? null :userId,
    "first_name": firstName== null ? null :firstName,
    "last_name": lastName== null ? null :lastName,
    "cityname": cityname== null ? null :cityname,
    "state": state== null ? null :state,
    "pincode": pincode== null ? null :pincode,
    "email": email== null ? null :email,
    "number": number== null ? null :number,
    "address1": address1== null ? null :address1,
    "adress2": adress2== null ? null :adress2,
    "is_delte": isDelte== null ? null :isDelte,
    "lat": lat== null ? null :lat,
    "lng": lng== null ? null :lng,
    "created_date": createdDate== null ? null :createdDate,
    "updatd_dare": updatdDare== null ? null :updatdDare,
    "city_id": cityId== null ? null :cityId,
    "city_name": cityName== null ? null :cityName,
    "status": status== null ? null :status,
    "updated_date": updatedDate== null ? null :updatedDate,
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
    cartId: json["cart_id"]== null ? null :json["cart_id"],
    servicename: json["servicename"]== null ? null :json["servicename"],
    qty: json["qty"]== null ? null : json["qty"],
    image: json["image"]== null ? null :json["image"],
    price: json["price"]== null ? null :json["price"],
  );

  Map<String, dynamic> toJson() => {
    "cart_id": cartId== null ? null :cartId,
    "servicename": servicename== null ? null :servicename,
    "qty": qty== null ? null : qty,
    "image": image== null ? null :image,
    "price": price== null ? null :price,
  };
}

class TotalAmount {
  TotalAmount({
    this.total,
  });

  int? total;

  factory TotalAmount.fromJson(Map<String, dynamic> json) => TotalAmount(
    total: json["Total"]== null ? null :json["Total"],
  );

  Map<String, dynamic> toJson() => {
    "Total": total== null ? null :total,
  };
}
