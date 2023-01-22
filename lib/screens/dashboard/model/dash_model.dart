// To parse this JSON data, do
//
//     final dashDataModel = dashDataModelFromJson(jsonString);

import 'dart:convert';

DashDataModel dashDataModelFromJson(String str) => DashDataModel.fromJson(json.decode(str));

String dashDataModelToJson(DashDataModel data) => json.encode(data.toJson());

class DashDataModel {
  DashDataModel({
    this.status,
    this.error,
    this.messages,
  });

  int? status;
  bool? error;
  Messages? messages;

  factory DashDataModel.fromJson(Map<String, dynamic> json) => DashDataModel(
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
    this.userDtl,
    this.testimonialDtl,
    this.bannerDtl,
    this.offerDtl,
    this.categoryDtl,
  });

  List<UserDtl>? userDtl;
  List<TestimonialDtl>? testimonialDtl;
  List<BannerDtl>? bannerDtl;
  List<OfferDtl>? offerDtl;
  List<CategoryDtl>? categoryDtl;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
    userDtl: List<UserDtl>.from(json["user_dtl"].map((x) => UserDtl.fromJson(x))),
    testimonialDtl: List<TestimonialDtl>.from(json["testimonial_dtl"].map((x) => TestimonialDtl.fromJson(x))),
    bannerDtl: List<BannerDtl>.from(json["banner_dtl"].map((x) => BannerDtl.fromJson(x))),
    offerDtl: List<OfferDtl>.from(json["offer_dtl"].map((x) => OfferDtl.fromJson(x))),
    categoryDtl: List<CategoryDtl>.from(json["category_dtl"].map((x) => CategoryDtl.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "user_dtl": List<dynamic>.from(userDtl!.map((x) => x.toJson())),
    "testimonial_dtl": List<dynamic>.from(testimonialDtl!.map((x) => x.toJson())),
    "banner_dtl": List<dynamic>.from(bannerDtl!.map((x) => x.toJson())),
    "offer_dtl": List<dynamic>.from(offerDtl!.map((x) => x.toJson())),
    "category_dtl": List<dynamic>.from(categoryDtl!.map((x) => x.toJson())),
  };
}

class BannerDtl {
  BannerDtl({
    this.bannerId,
    this.bannerTitle,
    this.bannerSubtitle,
    this.description,
    this.urrl,
    this.type,
    this.orderby,
    this.image,
    this.cityId,
    this.createdDate,
    this.updatedDate,
  });

  String? bannerId;
  String? bannerTitle;
  String? bannerSubtitle;
  String? description;
  String? urrl;
  String? type;
  String? orderby;
  String? image;
  String? cityId;
  String? createdDate;
  String? updatedDate;

  factory BannerDtl.fromJson(Map<String, dynamic> json) => BannerDtl(
    bannerId: json["banner_id"],
    bannerTitle: json["banner_title"],
    bannerSubtitle: json["banner_subtitle"],
    description: json["description"],
    urrl: json["urrl"],
    type: json["type"],
    orderby: json["orderby"],
    image: json["image"],
    cityId: json["city_id"],
    createdDate: json["created_date"],
    updatedDate: json["updated_date"],
  );

  Map<String, dynamic> toJson() => {
    "banner_id": bannerId,
    "banner_title": bannerTitle,
    "banner_subtitle": bannerSubtitle,
    "description": description,
    "urrl": urrl,
    "type": type,
    "orderby": orderby,
    "image": image,
    "city_id": cityId,
    "created_date": createdDate,
    "updated_date": updatedDate,
  };
}

class CategoryDtl {
  CategoryDtl({
    this.catId,
    this.catName,
    this.parentId,
    this.cityIds,
    this.catImg,
    this.status,
    this.createdDate,
    this.sub,
  });

  String? catId;
  String? catName;
  String? parentId;
  String? cityIds;
  String? catImg;
  String? status;
  String? createdDate;
  List<CategoryDtlSub>? sub;

  factory CategoryDtl.fromJson(Map<String, dynamic> json) => CategoryDtl(
    catId: json["cat_id"],
    catName: json["cat_name"],
    parentId: json["parent_id"],
    cityIds: json["city_ids"],
    catImg: json["cat_img"],
    status: json["status"],
    createdDate: json["created_date"],
    sub: List<CategoryDtlSub>.from(json["sub"].map((x) => CategoryDtlSub.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "cat_id": catId,
    "cat_name": catName,
    "parent_id": parentId,
    "city_ids": cityIds,
    "cat_img": catImg,
    "status": status,
    "created_date": createdDate,
    "sub": List<dynamic>.from(sub!.map((x) => x.toJson())),
  };
}

class CategoryDtlSub {
  CategoryDtlSub({
    this.catId,
    this.catName,
    this.parentId,
    this.cityIds,
    this.catImg,
    this.status,
    this.createdDate,
    this.sub,
  });

  String? catId;
  String? catName;
  String? parentId;
  String? cityIds;
  String? catImg;
  String? status;
  String? createdDate;
  List<SubSub>? sub;

  factory CategoryDtlSub.fromJson(Map<String, dynamic> json) => CategoryDtlSub(
    catId: json["cat_id"],
    catName: json["cat_name"],
    parentId: json["parent_id"],
    cityIds: json["city_ids"],
    catImg: json["cat_img"],
    status: json["status"],
    createdDate: json["created_date"],
    sub: List<SubSub>.from(json["sub"].map((x) => SubSub.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "cat_id": catId,
    "cat_name": catName,
    "parent_id": parentId,
    "city_ids": cityIds,
    "cat_img": catImg,
    "status": status,
    "created_date": createdDate,
    "sub": List<dynamic>.from(sub!.map((x) => x.toJson())),
  };
}

class SubSub {
  SubSub({
    this.catId,
    this.catName,
    this.parentId,
    this.cityIds,
    this.catImg,
    this.status,
    this.createdDate,
    this.sub,
  });

  String? catId;
  String? catName;
  String? parentId;
  String? cityIds;
  String? catImg;
  String? status;
  String? createdDate;
  List<dynamic>? sub;

  factory SubSub.fromJson(Map<String, dynamic> json) => SubSub(
    catId: json["cat_id"],
    catName: json["cat_name"],
    parentId: json["parent_id"],
    cityIds: json["city_ids"],
    catImg: json["cat_img"],
    status: json["status"],
    createdDate: json["created_date"],
    sub: List<dynamic>.from(json["sub"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "cat_id": catId,
    "cat_name": catName,
    "parent_id": parentId,
    "city_ids": cityIds,
    "cat_img": catImg,
    "status": status,
    "created_date": createdDate,
    "sub": List<dynamic>.from(sub!.map((x) => x)),
  };
}

class OfferDtl {
  OfferDtl({
    this.couponCodeId,
    this.name,
    this.code,
    this.cityId,
    this.discountType,
    this.discountValue,
    this.validUoTo,
    this.usedUpTo,
    this.noOfUseUser,
    this.priceCart,
    this.img,
    this.createDate,
    this.updateDate,
  });

  String? couponCodeId;
  String? name;
  String? code;
  String? cityId;
  String? discountType;
  String? discountValue;
  DateTime? validUoTo;
  String? usedUpTo;
  String? noOfUseUser;
  String? priceCart;
  String? img;
  String? createDate;
  String? updateDate;

  factory OfferDtl.fromJson(Map<String, dynamic> json) => OfferDtl(
    couponCodeId: json["coupon_code_id"],
    name: json["name"],
    code: json["code"],
    cityId: json["city_id"],
    discountType: json["discount_type"],
    discountValue: json["discount_value"],
    validUoTo: DateTime.parse(json["valid_uo_to"]),
    usedUpTo: json["used_up_to"],
    noOfUseUser: json["no_of_use_user"],
    priceCart: json["price_cart"],
    img: json["img"],
    createDate: json["create_date"],
    updateDate: json["update_date"],
  );

  Map<String, dynamic> toJson() => {
    "coupon_code_id": couponCodeId,
    "name": name,
    "code": code,
    "city_id": cityId,
    "discount_type": discountType,
    "discount_value": discountValue,
    "valid_uo_to": "${validUoTo!.year.toString().padLeft(4, '0')}-${validUoTo!.month.toString().padLeft(2, '0')}-${validUoTo!.day.toString().padLeft(2, '0')}",
    "used_up_to": usedUpTo,
    "no_of_use_user": noOfUseUser,
    "price_cart": priceCart,
    "img": img,
    "create_date": createDate,
    "update_date": updateDate,
  };
}

class TestimonialDtl {
  TestimonialDtl({
    this.testimonialId,
    this.name,
    this.image,
    this.message,
    this.createdDate,
    this.updatedDate,
  });

  String? testimonialId;
  String? name;
  String? image;
  String? message;
  String? createdDate;
  String? updatedDate;

  factory TestimonialDtl.fromJson(Map<String, dynamic> json) => TestimonialDtl(
    testimonialId: json["testimonial_id"],
    name: json["name"],
    image: json["image"],
    message: json["message"],
    createdDate: json["created_date"],
    updatedDate: json["updated_date"],
  );

  Map<String, dynamic> toJson() => {
    "testimonial_id": testimonialId,
    "name": name,
    "image": image,
    "message": message,
    "created_date": createdDate,
    "updated_date": updatedDate,
  };
}

class UserDtl {
  UserDtl({
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
    this.status,
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
    this.createdDate,
    this.updatedDate,
  });

  String? id;
  dynamic fullName;
  dynamic userName;
  dynamic password;
  dynamic email;
  String? contactNo;
  dynamic alterCnum;
  dynamic profileImage;
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
  String? status;
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
  String? createdDate;
  String? updatedDate;

  factory UserDtl.fromJson(Map<String, dynamic> json) => UserDtl(
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
    status: json["status"],
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
    createdDate: json["created_date"],
    updatedDate: json["updated_date"],
  );

  Map<String, dynamic> toJson() => {
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
    "status": status,
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
    "created_date": createdDate,
    "updated_date": updatedDate,
  };
}
