// To parse this JSON data, do
//
//     final orderDetailDataModel = orderDetailDataModelFromJson(jsonString);

import 'dart:convert';
import 'dart:ffi';

OrderDetailDataModel orderDetailDataModelFromJson(String str) => OrderDetailDataModel.fromJson(json.decode(str));

String orderDetailDataModelToJson(OrderDetailDataModel data) => json.encode(data.toJson());

class OrderDetailDataModel {
  OrderDetailDataModel({
    this.status,
    this.error,
    this.messages,
  });

  int? status;
  bool? error;
  Messages? messages;

  factory OrderDetailDataModel.fromJson(Map<String, dynamic> json) => OrderDetailDataModel(
    status: json["status"],
    error: json["error"],
    messages: Messages.fromJson(json["messages"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "error": error,
    "messages": messages?.toJson(),
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
    this.allOrders,
    this.additinalOrders,
    this.otherDtl,
    this.address,
  });

  List<AllOrder>? allOrders;
  List<AdditinalOrder>? additinalOrders;
  OtherDtl? otherDtl;
  List<Address>? address;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
    allOrders: List<AllOrder>.from(json["All_orders"].map((x) => AllOrder.fromJson(x))),
    additinalOrders: List<AdditinalOrder>.from(json["additinal_orders"].map((x) => AdditinalOrder.fromJson(x))),
    otherDtl: OtherDtl.fromJson(json["other_dtl"]),
    address: List<Address>.from(json["address"].map((x) => Address.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "All_orders": List<dynamic>.from(allOrders!.map((x) => x.toJson())),
    "additinal_orders": List<dynamic>.from(additinalOrders!.map((x) => x.toJson())),
    "other_dtl": otherDtl == null ? null :otherDtl?.toJson(),
    "address": address  == null ? [] : List<dynamic>.from(address!.map((x) => x.toJson())),
  };
}

class AdditinalOrder {
  AdditinalOrder({
    this.productName,
    this.qty,
    this.price,
  });

  String? productName;
  String? qty;
  String? price;

  factory AdditinalOrder.fromJson(Map<String, dynamic> json) => AdditinalOrder(
    productName: json["product_name"]  == null ? null :json["product_name"],
    qty: json["qty"]  == null ? null :json["qty"],
    price: json["price"]  == null ? null :json["price"],
  );

  Map<String, dynamic> toJson() => {
    "product_name": productName  == null ? null : productName,
    "qty": qty  == null ? null :qty,
    "price": price  == null ? null :price,
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
    addressId: json["address_id"]  == null ? null :json["address_id"],
    userId: json["user_id"]  == null ? null :json["user_id"],
    firstName: json["first_name"]  == null ? null : json["first_name"],
    lastName: json["last_name"]  == null ? null : json["last_name"],
    cityname: json["cityname"]  == null ? null :json["cityname"],
    state: json["state"]  == null ? null : json["state"],
    pincode: json["pincode"]  == null ? null :json["pincode"],
    email: json["email"]  == null ? null :json["email"],
    number: json["number"] == null ? null : json["number"],
    address1: json["address1"] == null ? null : json["address1"],
    adress2: json["adress2"] == null ? null : json["adress2"],
    isDelte: json["is_delte"] == null ? null :json["is_delte"],
    lat: json["lat"]== null ? null : json["lat"],
    lng: json["lng"]== null ? null : json["lng"],
    createdDate: json["created_date"] == null ? null : json["created_date"],
    updatdDare: json["updatd_dare"] == null ? null : json["updatd_dare"],
    cityId: json["city_id"] == null ? null : json["city_id"],
    cityName: json["city_name"] == null ? null : json["city_name"],
    status: json["status"] == null ? null : json["status"],
    updatedDate: json["updated_date"] == null ? null : json["updated_date"],
  );

  Map<String, dynamic> toJson() => {
    "address_id": addressId == null ? null :addressId,
    "user_id": userId == null ? null : userId,
    "first_name": firstName == null ? null : firstName,
    "last_name": lastName == null ? null : lastName,
    "cityname": cityname == null ? null : cityname,
    "state": state == null ? null : state,
    "pincode": pincode == null ? null : pincode,
    "email": email == null ? null : email,
    "number": number == null ? null :number,
    "address1": address1== null ? null :address1,
    "adress2": adress2 == null ? null : adress2,
    "is_delte": isDelte == null ? null : isDelte,
    "lat": lat == null ? null : lat,
    "lng": lng == null ? null : lng,
    "created_date": createdDate == null ? null : createdDate,
    "updatd_dare": updatdDare == null ? null :updatdDare,
    "city_id": cityId == null ? null :cityId,
    "city_name": cityName == null ? null : cityName,
    "status": status == null ? null : status,
    "updated_date": updatedDate == null ? null : updatedDate,
  };
}

class AllOrder {
  AllOrder({
    this.productName,
    this.qty,
    this.image,
    this.price,
  });

  String? productName;
  String? qty;
  String? image;
  String? price;

  factory AllOrder.fromJson(Map<String, dynamic> json) => AllOrder(
    productName: json["product_name"] == null ? null : json["product_name"],
    qty: json["qty"] == null ? null : json["qty"],
    image: json["image"] == null ? null : json["image"],
    price: json["price"] == null ? null : json["price"],
  );

  Map<String, dynamic> toJson() => {
    "product_name": productName == null ? null : productName,
    "qty": qty == null ? null : qty,
    "image": image == null ? null : image,
    "price": price == null ? null : price,
  };
}

class OtherDtl {
  OtherDtl({
    this.orderId,
    this.bookingDate,
    this.bookingTime,
    this.verifyOtp,
    this.totalPrice,
    this.discount,
    this.gst,
    this.grandTotal,
    this.dueAmount,
    this.paidAmount,
  });

  String? orderId;
  String? bookingDate;
  String? bookingTime;
  String? verifyOtp;
  dynamic totalPrice;
  String? discount;
  String? gst;
  dynamic grandTotal;
  dynamic dueAmount;
  dynamic paidAmount;

  factory OtherDtl.fromJson(Map<String, dynamic> json) => OtherDtl(
    orderId: json["order_id"],
    bookingDate: json["booking_date"],
    bookingTime: json["booking_time"],
    verifyOtp: json["verify_otp"],
    totalPrice: json["total_price"],
    discount: json["discount"],
    gst: json["gst"],
    grandTotal: json["grand_total"],
    dueAmount: json["due_amount"],
    paidAmount: json["paid_amount"],
  );

  Map<String, dynamic> toJson() => {
    "order_id": orderId== null ? null :orderId,
    "booking_date": bookingDate == null ? null : bookingDate,
    "booking_time": bookingTime == null ? null : bookingTime,
    "verify_otp": verifyOtp == null ? null : verifyOtp,
    "total_price": totalPrice == null ? null : totalPrice,
    "discount": discount == null ? null : discount,
    "gst": gst == null ? null : gst,
    "grand_total": grandTotal == null ? null : grandTotal,
    "due_amount": dueAmount == null ? null : dueAmount,
    "paid_amount": paidAmount == null ? null : paidAmount,
  };
}
