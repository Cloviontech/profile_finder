// To parse this JSON data, do
//
//     final allPiData = allPiDataFromJson(jsonString);

import 'dart:convert';

List<AllPiData> allPiDataFromJson(String str) => List<AllPiData>.from(json.decode(str).map((x) => AllPiData.fromJson(x)));

String allPiDataToJson(List<AllPiData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllPiData {
    String uid;
    String email;
    String mobile;
    String password;
    int otp;
    int userOtp;
    String createdDate;
    String? profilePicture;
    String? officeName;
    String? officeCountry;
    String? officeCity;
    String? officeAddress;
    String? firstName;
    String? lastName;
    String? personalCountry;
    String? personalCity;
    String? personalAddress;
    String? hiringManager;
    String? idCard;
    String? tagline;
    List <String>? myClient;
    List <double> totalRatings;

    AllPiData({
        required this.uid,
        required this.email,
        required this.mobile,
        required this.password,
        required this.otp,
        required this.userOtp,
        required this.createdDate,
        required this.profilePicture,
        required this.officeName,
        required this.officeCountry,
        required this.officeCity,
        required this.officeAddress,
        required this.firstName,
        required this.lastName,
        required this.personalCountry,
        required this.personalCity,
        required this.personalAddress,
        required this.hiringManager,
        required this.idCard,
        required this.tagline,
        required this.myClient,
        required this.totalRatings,
    });

    factory AllPiData.fromJson(Map<String, dynamic> json) => AllPiData(
      
        uid: json["uid"],
        email: json["email"],
        mobile: json["mobile"],
        password: json["password"],
        otp: json["otp"],
        userOtp: json["user_otp"],
        createdDate: json["created_date"],
        profilePicture: json["profile_picture"],
        officeName: json["office_name"],
        officeCountry: json["office_country"],
        officeCity: json["office_city"],
        officeAddress: json["office_address"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        personalCountry: json["personal_country"],
        personalCity: json["personal_city"],
        personalAddress: json["personal_address"],
        hiringManager: json["hiring_manager"],
        idCard: json["id_card"],
        tagline: json["tagline"],
        myClient: json["my_client"],
        totalRatings: json["total_ratings"],
    );

    Map<String, dynamic> toJson() => {
        "uid": uid,
        "email": email,
        "mobile": mobile,
        "password": password,
        "otp": otp,
        "user_otp": userOtp,
        "created_date": createdDate,
        "profile_picture": profilePicture,
        "office_name": officeName,
        "office_country": officeCountry,
        "office_city": officeCity,
        "office_address": officeAddress,
        "first_name": firstName,
        "last_name": lastName,
        "personal_country": personalCountry,
        "personal_city": personalCity,
        "personal_address": personalAddress,
        "hiring_manager": hiringManager,
        "id_card": idCard,
        "tagline": tagline,
        "my_client": myClient,
        "total_ratings": totalRatings,
    };
}


// ....................................

// To parse this JSON data, do
//
//     final myManagerList = myManagerListFromJson(jsonString);

// import 'dart:convert';

// MyManagerList myManagerListFromJson(String str) => MyManagerList.fromJson(json.decode(str));

// String myManagerListToJson(MyManagerList data) => json.encode(data.toJson());

// class MyManagerList {
//     List<The2Vjx38Znruy>? the2Vjx38Znruy;

//     MyManagerList({
//         this.the2Vjx38Znruy,
//     });

//     factory MyManagerList.fromJson(Map<String, dynamic> json) => MyManagerList(
//         the2Vjx38Znruy: json["2VJX38ZNRUY"] == null ? [] : List<The2Vjx38Znruy>.from(json["2VJX38ZNRUY"]!.map((x) => The2Vjx38Znruy.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "2VJX38ZNRUY": the2Vjx38Znruy == null ? [] : List<dynamic>.from(the2Vjx38Znruy!.map((x) => x.toJson())),
//     };
// }

// class The2Vjx38Znruy {
//     int? id;
//     String? uid;
//     String? email;
//     String? mobile;
//     String? password;
//     int? otp;
//     int? userOtp;
//     String? createdDate;
//     String? profilePicture;
//     dynamic officeName;
//     dynamic officeCountry;
//     dynamic officeCity;
//     dynamic officeAddress;
//     dynamic firstName;
//     dynamic lastName;
//     dynamic personalCountry;
//     dynamic personalCity;
//     dynamic personalAddress;
//     dynamic idCard;
//     dynamic tagline;
//     dynamic hiringManager;
//     dynamic signDocument;
//     String? myClient;
//     String? allRatings;
//     int? totalRatings;
//     int? percentage;

//     The2Vjx38Znruy({
//         this.id,
//         this.uid,
//         this.email,
//         this.mobile,
//         this.password,
//         this.otp,
//         this.userOtp,
//         this.createdDate,
//         this.profilePicture,
//         this.officeName,
//         this.officeCountry,
//         this.officeCity,
//         this.officeAddress,
//         this.firstName,
//         this.lastName,
//         this.personalCountry,
//         this.personalCity,
//         this.personalAddress,
//         this.idCard,
//         this.tagline,
//         this.hiringManager,
//         this.signDocument,
//         this.myClient,
//         this.allRatings,
//         this.totalRatings,
//         this.percentage,
//     });

//     factory The2Vjx38Znruy.fromJson(Map<String, dynamic> json) => The2Vjx38Znruy(
//         id: json["id"],
//         uid: json["uid"],
//         email: json["email"],
//         mobile: json["mobile"],
//         password: json["password"],
//         otp: json["otp"],
//         userOtp: json["user_otp"],
//         createdDate: json["created_date"],
//         profilePicture: json["profile_picture"],
//         officeName: json["office_name"],
//         officeCountry: json["office_country"],
//         officeCity: json["office_city"],
//         officeAddress: json["office_address"],
//         firstName: json["first_name"],
//         lastName: json["last_name"],
//         personalCountry: json["personal_country"],
//         personalCity: json["personal_city"],
//         personalAddress: json["personal_address"],
//         idCard: json["id_card"],
//         tagline: json["tagline"],
//         hiringManager: json["hiring_manager"],
//         signDocument: json["sign_document"],
//         myClient: json["my_client"],
//         allRatings: json["all_ratings"],
//         totalRatings: json["total_ratings"],
//         percentage: json["percentage"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "uid": uid,
//         "email": email,
//         "mobile": mobile,
//         "password": password,
//         "otp": otp,
//         "user_otp": userOtp,
//         "created_date": createdDate,
//         "profile_picture": profilePicture,
//         "office_name": officeName,
//         "office_country": officeCountry,
//         "office_city": officeCity,
//         "office_address": officeAddress,
//         "first_name": firstName,
//         "last_name": lastName,
//         "personal_country": personalCountry,
//         "personal_city": personalCity,
//         "personal_address": personalAddress,
//         "id_card": idCard,
//         "tagline": tagline,
//         "hiring_manager": hiringManager,
//         "sign_document": signDocument,
//         "my_client": myClient,
//         "all_ratings": allRatings,
//         "total_ratings": totalRatings,
//         "percentage": percentage,
//     };
// }
