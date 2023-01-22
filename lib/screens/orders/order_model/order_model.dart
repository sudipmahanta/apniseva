// To parse this JSON data, do
//
//     final bookingDataModel = bookingDataModelFromJson(jsonString);

import 'dart:convert';

OrderDataModel orderDataModelFromJson(String str) => OrderDataModel.fromJson(json.decode(str));

String orderDataModelToJson(OrderDataModel data) => json.encode(data.toJson());

class OrderDataModel {
  OrderDataModel({
    this.status,
    this.error,
    this.messages,
  });

  int? status;
  bool? error;
  Messages? messages;

  factory OrderDataModel.fromJson(Map<String, dynamic> json) => OrderDataModel(
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
  });

  List<Orderdtl>? orderdtls;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
    orderdtls: List<Orderdtl>.from(json["Orderdtls"].map((x) => Orderdtl.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Orderdtls": List<dynamic>.from(orderdtls!.map((x) => x.toJson())),
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
    this.id,
    this.fullName,
    this.userName,
    this.password,
    this.email,
    this.contactNo,
    this.alterCnum,
    this.profileImage,
    this.shopName,
    this.shopRedgProof,
    this.userType,
    this.vendorCatagory,
    this.countryId,
    this.stateId,
    this.cityId,
    this.pin,
    this.address1,
    this.address2,
    this.gstNo,
    this.gstCopy,
    this.commition,
    this.bannerImage,
    this.logoImage,
    this.reasone,
    this.wallet,
    this.addrProfType,
    this.idProofFside,
    this.idProofBside,
    this.dlNum,
    this.docRc,
    this.docLic,
    this.validLic,
    this.docInc,
    this.validInc,
    this.acHolderName,
    this.acNum,
    this.branch,
    this.ifscCode,
    this.otp,
    this.lat,
    this.lng,
    this.online,
    this.fcmId,
    this.roles,
    this.passbookCopy,
    this.updatedDate,
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
  String? vendorId;
  String? orderId;
  String? addressId;
  String? paymentMode;
  String? status;
  dynamic reason;
  String? txn;
  String? couponCode;
  String? couponAmnt;
  DateTime? bookingDate;
  String? bookingTime;
  String? verifyOtp;
  String? vendorCommisionByorder;
  String? createdDate;
  String? updateDate;
  String? id;
  String? fullName;
  dynamic userName;
  dynamic password;
  String? email;
  String? contactNo;
  dynamic alterCnum;
  String? profileImage;
  dynamic shopName;
  dynamic shopRedgProof;
  String? userType;
  dynamic vendorCatagory;
  dynamic countryId;
  dynamic stateId;
  dynamic cityId;
  dynamic pin;
  dynamic address1;
  dynamic address2;
  dynamic gstNo;
  dynamic gstCopy;
  dynamic commition;
  dynamic bannerImage;
  dynamic logoImage;
  dynamic reasone;
  String? wallet;
  dynamic addrProfType;
  dynamic idProofFside;
  dynamic idProofBside;
  dynamic dlNum;
  dynamic docRc;
  dynamic docLic;
  dynamic validLic;
  dynamic docInc;
  dynamic validInc;
  dynamic acHolderName;
  dynamic acNum;
  dynamic branch;
  dynamic ifscCode;
  dynamic otp;
  dynamic lat;
  dynamic lng;
  String? online;
  dynamic fcmId;
  dynamic roles;
  dynamic passbookCopy;
  String? updatedDate;

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
    id: json["id"],
    fullName: json["full_name"],
    userName: json["user_name"],
    password: json["password"],
    email: json["email"],
    contactNo: json["contact_no"],
    alterCnum: json["alter_cnum"],
    profileImage: json["profile_image"],
    shopName: json["shop_name"],
    shopRedgProof: json["shop_redg_proof"],
    userType: json["user_type"],
    vendorCatagory: json["vendor_catagory"],
    countryId: json["country_id"],
    stateId: json["state_id"],
    cityId: json["city_id"],
    pin: json["pin"],
    address1: json["address1"],
    address2: json["address2"],
    gstNo: json["gst_no"],
    gstCopy: json["gst_copy"],
    commition: json["commition"],
    bannerImage: json["banner_image"],
    logoImage: json["logo_image"],
    reasone: json["reasone"],
    wallet: json["wallet"],
    addrProfType: json["addr_prof_type"],
    idProofFside: json["id_proof_fside"],
    idProofBside: json["id_proof_bside"],
    dlNum: json["dl_num"],
    docRc: json["doc_rc"],
    docLic: json["doc_lic"],
    validLic: json["valid_lic"],
    docInc: json["doc_inc"],
    validInc: json["valid_inc"],
    acHolderName: json["ac_holder_name"],
    acNum: json["ac_num"],
    branch: json["branch"],
    ifscCode: json["ifsc_code"],
    otp: json["otp"],
    lat: json["lat"],
    lng: json["lng"],
    online: json["online"],
    fcmId: json["fcm_id"],
    roles: json["roles"],
    passbookCopy: json["passbook_copy"],
    updatedDate: json["updated_date"],
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
    "booking_date": "${bookingDate?.year.toString().padLeft(4, '0')}-${bookingDate?.month.toString().padLeft(2, '0')}-${bookingDate?.day.toString().padLeft(2, '0')}",
    "booking_time": bookingTime,
    "verify_otp": verifyOtp,
    "vendor_commision_byorder": vendorCommisionByorder,
    "created_date": createdDate,
    "update_date": updateDate,
    "id": id,
    "full_name": fullName,
    "user_name": userName,
    "password": password,
    "email": email,
    "contact_no": contactNo,
    "alter_cnum": alterCnum,
    "profile_image": profileImage,
    "shop_name": shopName,
    "shop_redg_proof": shopRedgProof,
    "user_type": userType,
    "vendor_catagory": vendorCatagory,
    "country_id": countryId,
    "state_id": stateId,
    "city_id": cityId,
    "pin": pin,
    "address1": address1,
    "address2": address2,
    "gst_no": gstNo,
    "gst_copy": gstCopy,
    "commition": commition,
    "banner_image": bannerImage,
    "logo_image": logoImage,
    "reasone": reasone,
    "wallet": wallet,
    "addr_prof_type": addrProfType,
    "id_proof_fside": idProofFside,
    "id_proof_bside": idProofBside,
    "dl_num": dlNum,
    "doc_rc": docRc,
    "doc_lic": docLic,
    "valid_lic": validLic,
    "doc_inc": docInc,
    "valid_inc": validInc,
    "ac_holder_name": acHolderName,
    "ac_num": acNum,
    "branch": branch,
    "ifsc_code": ifscCode,
    "otp": otp,
    "lat": lat,
    "lng": lng,
    "online": online,
    "fcm_id": fcmId,
    "roles": roles,
    "passbook_copy": passbookCopy,
    "updated_date": updatedDate,
  };
}
