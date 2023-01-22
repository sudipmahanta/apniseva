// To parse this JSON data, do
//
//     final orderDetailsDataModel = orderDetailsDataModelFromJson(jsonString);

import 'dart:convert';

OrderDetailsDataModel orderDetailsDataModelFromJson(String str) => OrderDetailsDataModel.fromJson(json.decode(str));

String orderDetailsDataModelToJson(OrderDetailsDataModel data) => json.encode(data.toJson());

class OrderDetailsDataModel {
  OrderDetailsDataModel({
    this.status,
    this.error,
    this.messages,
  });

  int? status;
  bool? error;
  Messages? messages;

  factory OrderDetailsDataModel.fromJson(Map<String, dynamic> json) => OrderDetailsDataModel(
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
    this.orderdtls,
    this.addOrderdtls,
    this.gst,
    this.address,
  });

  List<Orderdtl>? orderdtls;
  List<dynamic>? addOrderdtls;
  Gst? gst;
  List<Address>? address;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
    orderdtls: List<Orderdtl>.from(json["Orderdtls"].map((x) => Orderdtl.fromJson(x))),
    addOrderdtls: List<dynamic>.from(json["add_Orderdtls"].map((x) => x)),
    gst: Gst.fromJson(json["gst"]),
    address: List<Address>.from(json["address"].map((x) => Address.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Orderdtls": List<dynamic>.from(orderdtls!.map((x) => x.toJson())),
    "add_Orderdtls": List<dynamic>.from(addOrderdtls!.map((x) => x)),
    "gst": gst!.toJson(),
    "address": List<dynamic>.from(address!.map((x) => x.toJson())),
  };
}

class Address {
  Address({
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

  factory Address.fromJson(Map<String, dynamic> json) => Address(
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

class Gst {
  Gst({
    this.gst,
  });

  String? gst;

  factory Gst.fromJson(Map<String, dynamic> json) => Gst(
    gst: json["gst"],
  );

  Map<String, dynamic> toJson() => {
    "gst": gst,
  };
}

class Orderdtl {
  Orderdtl({
    this.ordersId,
    this.productname,
    this.variationId,
    this.qty,
    this.img,
    this.price,
    this.userId,
    this.shippingType,
    this.shippingCharge,
    this.vendorId,
    this.orderId,
    this.addressId,
    this.paymentMode,
    this.status,
    this.reason,
    this.txn,
    this.couponCode,
    this.couponAmnt,
    this.bookingDate,
    this.bookingTime,
    this.verifyOtp,
    this.vendorCommisionByorder,
    this.createdDate,
    this.updateDate,
  });

  String? ordersId;
  String? productname;
  dynamic variationId;
  String? qty;
  String? img;
  String? price;
  String? userId;
  String? shippingType;
  dynamic shippingCharge;
  dynamic vendorId;
  String? orderId;
  String? addressId;
  String? paymentMode;
  dynamic status;
  dynamic reason;
  String? txn;
  String? couponCode;
  String? couponAmnt;
  DateTime? bookingDate;
  String? bookingTime;
  dynamic verifyOtp;
  dynamic vendorCommisionByorder;
  String? createdDate;
  String? updateDate;

  factory Orderdtl.fromJson(Map<String, dynamic> json) => Orderdtl(
    ordersId: json["orders_id"],
    productname: json["productname"],
    variationId: json["variation_id"],
    qty: json["qty"],
    img: json["img"],
    price: json["price"],
    userId: json["user_id"],
    shippingType: json["shipping_type"],
    shippingCharge: json["shipping_charge"],
    vendorId: json["vendor_id"],
    orderId: json["order_id"],
    addressId: json["address_id"],
    paymentMode: json["payment_mode"],
    status: json["status"],
    reason: json["reason"],
    txn: json["txn"],
    couponCode: json["coupon_code"],
    couponAmnt: json["coupon_amnt"],
    bookingDate: DateTime.parse(json["booking_date"]),
    bookingTime: json["booking_time"],
    verifyOtp: json["verify_otp"],
    vendorCommisionByorder: json["vendor_commision_byorder"],
    createdDate: json["created_date"],
    updateDate: json["update_date"],
  );

  Map<String, dynamic> toJson() => {
    "orders_id": ordersId,
    "productname": productname,
    "variation_id": variationId,
    "qty": qty,
    "img": img,
    "price": price,
    "user_id": userId,
    "shipping_type": shippingType,
    "shipping_charge": shippingCharge,
    "vendor_id": vendorId,
    "order_id": orderId,
    "address_id": addressId,
    "payment_mode": paymentMode,
    "status": status,
    "reason": reason,
    "txn": txn,
    "coupon_code": couponCode,
    "coupon_amnt": couponAmnt,
    "booking_date": "${bookingDate!.year.toString().padLeft(4, '0')}-${bookingDate!.month.toString().padLeft(2, '0')}-${bookingDate!.day.toString().padLeft(2, '0')}",
    "booking_time": bookingTime,
    "verify_otp": verifyOtp,
    "vendor_commision_byorder": vendorCommisionByorder,
    "created_date": createdDate,
    "update_date": updateDate,
  };
}
