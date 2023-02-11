// // To parse this JSON data, do
// //
// //     final userDataModel = userDataModelFromJson(jsonString);
//
// import 'dart:convert';
//
// UserDataModel userDataModelFromJson(String str) =>
//     UserDataModel.fromJson(json.decode(str));
//
// String userDataModelToJson(UserDataModel data) => json.encode(data.toJson());
//
// class UserDataModel {
//   UserDataModel({
//     this.status,
//     this.error,
//     this.messages,
//   });
//
//   int? status;
//   bool? error;
//   Messages? messages;
//
//   factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
//     status: json["status"] == null ? null : json["status"],
//     error: json["error"] == null ? null : json["error"],
//     messages: json["messages"] == null ? null : Messages.fromJson(json["message"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "status": status == null ? null : status,
//     "error": error == null ? null : error,
//     "messages": messages == null ? null : messages!.toJson(),
//   };
// }
//
// class Messages {
//   Messages({
//     this.responsecode,
//     this.status,
//   });
//
//   String? responsecode;
//   Status? status;
//
//   factory Messages.fromJson(Map<String, dynamic> json) => Messages(
//     responsecode: json["responsecode"] == null ? null : json["responsecode"],
//     status: json["status"] == null ? null : Status.fromJson(json["status"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "responsecode": responsecode == null ? null : responsecode,
//     "status": status == null ? null : status?.toJson(),
//   };
// }
//
// class Status {
//   Status({
//     this.userId,
//     this.fullname,
//     this.email,
//     this.contact,
//     this.isLoggedIn,
//   });
//
//   String? userId;
//   dynamic fullname;
//   dynamic email;
//   String? contact;
//   bool? isLoggedIn;
//
//   factory Status.fromJson(Map<String, dynamic> json) => Status(
//     userId: json["user_id"] == null ? null : json["user_id"],
//     fullname: json["fullname"] == null ? null : json["fullname"],
//     email: json["email"] == null ? null : json["email"],
//     contact: json["contact"] == null ? null : json["contact"],
//     isLoggedIn: json["isLoggedIn"] == null ? null : json["isLoggedIn"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "user_id": userId == null ? null : userId,
//     "fullname": fullname == null ? null : fullname,
//     "email": email == null ? null : email,
//     "contact": contact == null ? null : contact,
//     "isLoggedIn": isLoggedIn == null ? null : isLoggedIn,
//   };
// }

// To parse this JSON data, do
//
//     final userDataModel = userDataModelFromJson(jsonString);

import 'dart:convert';

UserDataModel userDataModelFromJson(String str) => UserDataModel.fromJson(json.decode(str));

String userDataModelToJson(UserDataModel data) => json.encode(data.toJson());

class UserDataModel {
  UserDataModel({
    this.status,
    this.error,
    this.messages,
  });

  int? status;
  bool? error;
  Messages? messages;

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
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
    this.userId,
    this.fullname,
    this.email,
    this.contact,
    this.isLoggedIn,
  });

  String? userId;
  dynamic fullname;
  dynamic email;
  String? contact;
  bool? isLoggedIn;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
    userId: json["user_id"],
    fullname: json["fullname"],
    email: json["email"],
    contact: json["contact"],
    isLoggedIn: json["isLoggedIn"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "fullname": fullname,
    "email": email,
    "contact": contact,
    "isLoggedIn": isLoggedIn,
  };
}
