// To parse this JSON data, do
//
//     final pfMyManagerListModel = pfMyManagerListModelFromJson(jsonString);

import 'dart:convert';

List<PfMyManagerListModel> pfMyManagerListModelFromJson(String str) => List<PfMyManagerListModel>.from(json.decode(str).map((x) => PfMyManagerListModel.fromJson(x)));

String pfMyManagerListModelToJson(List<PfMyManagerListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PfMyManagerListModel {
    int? id;
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
    dynamic idCard;
    dynamic signDocument;
    String? createdDate;
    String? myClient;
    dynamic otp1;
    dynamic userOtp1;

    PfMyManagerListModel({
        this.id,
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
        this.signDocument,
        this.createdDate,
        this.myClient,
        this.otp1,
        this.userOtp1,
    });

    factory PfMyManagerListModel.fromJson(Map<String, dynamic> json) => PfMyManagerListModel(
        id: json["id"],
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
        signDocument: json["sign_document"],
        createdDate: json["created_date"],
        myClient: json["my_client"],
        otp1: json["otp1"],
        userOtp1: json["user_otp1"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
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
        "sign_document": signDocument,
        "created_date": createdDate,
        "my_client": myClient,
        "otp1": otp1,
        "user_otp1": userOtp1,
    };
}
