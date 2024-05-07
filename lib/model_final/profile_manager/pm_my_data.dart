// To parse this JSON data, do
//
//     final pmMyData = pmMyDataFromJson(jsonString);

import 'dart:convert';

List<PmMyData> pmMyDataFromJson(String str) => List<PmMyData>.from(json.decode(str).map((x) => PmMyData.fromJson(x)));

String pmMyDataToJson(List<PmMyData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PmMyData {
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
    dynamic otp1;
    dynamic userOtp1;
    String? levelEducation;
    String? fieldStudy;
    String? workJobTitle;
    String? workCompanyName;
    String? workJobLocation;
    String? exJobTitle;
    String? exCompanyName;
    String? yearExperience;
    String? exLocation;
    String? degreeCer;
    String? exCer;
    String? workType;
    String? gstNumber;
    String? gstCertificate;
    String? companyPanNo;
    String? arnNo;
    String? panCard;

    PmMyData({
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
        this.otp1,
        this.userOtp1,
        this.levelEducation,
        this.fieldStudy,
        this.workJobTitle,
        this.workCompanyName,
        this.workJobLocation,
        this.exJobTitle,
        this.exCompanyName,
        this.yearExperience,
        this.exLocation,
        this.degreeCer,
        this.exCer,
        this.workType,
        this.gstNumber,
        this.gstCertificate,
        this.companyPanNo,
        this.arnNo,
        this.panCard,
    });

    factory PmMyData.fromJson(Map<String, dynamic> json) => PmMyData(
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
        otp1: json["otp1"],
        userOtp1: json["user_otp1"],
        levelEducation: json["level_education"],
        fieldStudy: json["field_study"],
        workJobTitle: json["work_job_title"],
        workCompanyName: json["work_company_name"],
        workJobLocation: json["work_job_location"],
        exJobTitle: json["ex_job_title"],
        exCompanyName: json["ex_company_name"],
        yearExperience: json["year_experience"],
        exLocation: json["ex_location"],
        degreeCer: json["degree_cer"],
        exCer: json["ex_cer"],
        workType: json["work_type"],
        gstNumber: json["gst_number"],
        gstCertificate: json["gst_certificate"],
        companyPanNo: json["company_pan_no"],
        arnNo: json["arn_no"],
        panCard: json["pan_card"],
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
        "otp1": otp1,
        "user_otp1": userOtp1,
        "level_education": levelEducation,
        "field_study": fieldStudy,
        "work_job_title": workJobTitle,
        "work_company_name": workCompanyName,
        "work_job_location": workJobLocation,
        "ex_job_title": exJobTitle,
        "ex_company_name": exCompanyName,
        "year_experience": yearExperience,
        "ex_location": exLocation,
        "degree_cer": degreeCer,
        "ex_cer": exCer,
        "work_type": workType,
        "gst_number": gstNumber,
        "gst_certificate": gstCertificate,
        "company_pan_no": companyPanNo,
        "arn_no": arnNo,
        "pan_card": panCard,
    };
}
