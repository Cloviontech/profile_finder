// To parse this JSON data, do
//
//     final allPmDataList = allPmDataListFromJson(jsonString);

import 'dart:convert';

List<AllPmDataList> allPmDataListFromJson(String str) => List<AllPmDataList>.from(json.decode(str).map((x) => AllPmDataList.fromJson(x)));

String allPmDataListToJson(List<AllPmDataList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllPmDataList {
    String? uid;
    String? email;
    String? mobile;
    String? password;
    int? otp;
    int? userOtp;
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
    String? notary;
    String? idCard;
    String? createdDate;

    AllPmDataList({
        this.uid,
        this.email,
        this.mobile,
        this.password,
        this.otp,
        this.userOtp,
        this.profilePicture,
        this.officeName,
        this.officeCountry,
        this.officeCity,
        this.officeAddress,
        this.firstName,
        this.lastName,
        this.personalCountry,
        this.personalCity,
        this.personalAddress,
        this.notary,
        this.idCard,
        this.createdDate,
    });

    factory AllPmDataList.fromJson(Map<String, dynamic> json) => AllPmDataList(
        uid: json["uid"],
        email: json["email"],
        mobile: json["mobile"],
        password: json["password"],
        otp: json["otp"],
        userOtp: json["user_otp"],
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
        notary: json["notary"],
        idCard: json["id_card"],
        createdDate: json["created_date"],
    );

    Map<String, dynamic> toJson() => {
        "uid": uid,
        "email": email,
        "mobile": mobile,
        "password": password,
        "otp": otp,
        "user_otp": userOtp,
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
        "notary": notary,
        "id_card": idCard,
        "created_date": createdDate,
    };
}
