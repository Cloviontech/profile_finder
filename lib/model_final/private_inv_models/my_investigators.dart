// // // To parse this JSON data, do
// // //
// // //     final myInvestigators = myInvestigatorsFromJson(jsonString);


// // //  int? id;
// // //     String? uid;
// // //     String? email;
// // //     String? mobile;
// // //     String? password;
// // //     int? otp;
// // //     int? userOtp;
// // //     String? createdDate;
// // //     String? profilePicture;
// // //     String? officeName;
// // //     String? officeCountry;
// // //     String? officeCity;
// // //     String? officeAddress;
// // //     String? firstName;
// // //     String? lastName;
// // //     String? personalCountry;
// // //     String? personalCity;
// // //     String? personalAddress;
// // //     String? idCard;
// // //     String? tagline;
// // //     String? hiringManager;
// // //     String? signDocument;
// // //     String? myClient;
// // //     String? allRatings;
// // //     String totalRatings;
// // //     int? percentage;


// // import 'dart:convert';

// // MyInvestigators myInvestigatorsFromJson(String str) => MyInvestigators.fromJson(json.decode(str));

// // String myInvestigatorsToJson(MyInvestigators data) => json.encode(data.toJson());

// // class MyInvestigators {
// //     List<Qkokamx1Qqf>? qkokamx1Qqf;

// //     MyInvestigators({
// //         this.qkokamx1Qqf,
// //     });

// //     factory MyInvestigators.fromJson(Map<String, dynamic> json) => MyInvestigators(
// //         qkokamx1Qqf: json["QKOKAMX1QQF"] == null ? [] : List<Qkokamx1Qqf>.from(json["QKOKAMX1QQF"]!.map((x) => Qkokamx1Qqf.fromJson(x))),
// //     );

// //     Map<String, dynamic> toJson() => {
// //         "QKOKAMX1QQF": qkokamx1Qqf == null ? [] : List<dynamic>.from(qkokamx1Qqf!.map((x) => x.toJson())),
// //     };
// // }

// // class Qkokamx1Qqf {

// //    int? id;
// //     String? uid;
// //     String? email;
// //     String? mobile;
// //     String? password;
// //     int? otp;
// //     int? userOtp;
// //     String? createdDate;
// //     String? profilePicture;
// //     String? officeName;
// //     String? officeCountry;
// //     String? officeCity;
// //     String? officeAddress;
// //     String? firstName;
// //     String? lastName;
// //     String? personalCountry;
// //     String? personalCity;
// //     String? personalAddress;
// //     String? idCard;
// //     String? tagline;
// //     String? hiringManager;
// //     String? signDocument;
// //     String? myClient;
// //     String? allRatings;
// //     String? totalRatings;
// //     int? percentage;

// //     // int? id;
// //     // Uid? uid;
// //     // Email? email;
// //     // String? mobile;
// //     // String? password;
// //     // int? otp;
// //     // int? userOtp;
// //     // CreatedDate? createdDate;
// //     // String? profilePicture;
// //     // OfficeName? officeName;
// //     // OfficeCountry? officeCountry;
// //     // OfficeCity? officeCity;
// //     // Address? officeAddress;
// //     // FirstName? firstName;
// //     // LastName? lastName;
// //     // PersonalCountry? personalCountry;
// //     // PersonalCity? personalCity;
// //     // Address? personalAddress;
// //     // String? idCard;
// //     // Tagline? tagline;
// //     // HiringManager? hiringManager;
// //     // String? signDocument;
// //     // MyClient? myClient;
// //     // AllRatings? allRatings;
// //     // dynamic totalRatings;
// //     // int? percentage;

// //     Qkokamx1Qqf({
// //         this.id,
// //         this.uid,
// //         this.email,
// //         this.mobile,
// //         this.password,
// //         this.otp,
// //         this.userOtp,
// //         this.createdDate,
// //         this.profilePicture,
// //         this.officeName,
// //         this.officeCountry,
// //         this.officeCity,
// //         this.officeAddress,
// //         this.firstName,
// //         this.lastName,
// //         this.personalCountry,
// //         this.personalCity,
// //         this.personalAddress,
// //         this.idCard,
// //         this.tagline,
// //         this.hiringManager,
// //         this.signDocument,
// //         this.myClient,
// //         this.allRatings,
// //         this.totalRatings,
// //         this.percentage,
// //     });

// //     // factory Qkokamx1Qqf.fromJson(Map<String, dynamic> json) => Qkokamx1Qqf(
// //     //     id: json["id"],
// //     //     uid: uidValues.map[json["uid"]]!,
// //     //     email: emailValues.map[json["email"]]!,
// //     //     mobile: json["mobile"],
// //     //     password: json["password"],
// //     //     otp: json["otp"],
// //     //     userOtp: json["user_otp"],
// //     //     createdDate: createdDateValues.map[json["created_date"]]!,
// //     //     profilePicture: json["profile_picture"],
// //     //     officeName: officeNameValues.map[json["office_name"]]!,
// //     //     officeCountry: officeCountryValues.map[json["office_country"]]!,
// //     //     officeCity: officeCityValues.map[json["office_city"]]!,
// //     //     officeAddress: addressValues.map[json["office_address"]]!,
// //     //     firstName: firstNameValues.map[json["first_name"]]!,
// //     //     lastName: lastNameValues.map[json["last_name"]]!,
// //     //     personalCountry: personalCountryValues.map[json["personal_country"]]!,
// //     //     personalCity: personalCityValues.map[json["personal_city"]]!,
// //     //     personalAddress: addressValues.map[json["personal_address"]]!,
// //     //     idCard: json["id_card"],
// //     //     tagline: taglineValues.map[json["tagline"]]!,
// //     //     hiringManager: hiringManagerValues.map[json["hiring_manager"]]!,
// //     //     signDocument: json["sign_document"],
// //     //     myClient: myClientValues.map[json["my_client"]]!,
// //     //     allRatings: allRatingsValues.map[json["all_ratings"]]!,
// //     //     totalRatings: json["total_ratings"],
// //     //     percentage: json["percentage"],


// //      factory Qkokamx1Qqf.fromJson(Map<String, dynamic> json) => Qkokamx1Qqf(
// //         id: json["id"],
// //         uid: json["uid"]!,
// //         email: json["email"]!,
// //         mobile: json["mobile"],
// //         password: json["password"],
// //         otp: json["otp"],
// //         userOtp: json["user_otp"],
// //         createdDate: json["created_date"]!,
// //         profilePicture: json["profile_picture"],
// //         officeName: json["office_name"]!,
// //         officeCountry:json["office_country"]!,
// //         officeCity: json["office_city"]!,
// //         officeAddress: json["office_address"]!,
// //         firstName:json["first_name"]!,
// //         lastName: json["last_name"]!,
// //         personalCountry: json["personal_country"]!,
// //         personalCity:json["personal_city"]!,
// //         personalAddress: json["personal_address"]!,
// //         idCard: json["id_card"],
// //         tagline: json["tagline"]!,
// //         hiringManager: json["hiring_manager"]!,
// //         signDocument: json["sign_document"],
// //         myClient: json["my_client"]!,
// //         allRatings: json["all_ratings"]!,
// //         totalRatings: json["total_ratings"],
// //         percentage: json["percentage"],
// //     );

// //     Map<String, dynamic> toJson() => {
// //         "id": id,
// //         "uid": uidValues.reverse[uid],
// //         "email": emailValues.reverse[email],
// //         "mobile": mobile,
// //         "password": password,
// //         "otp": otp,
// //         "user_otp": userOtp,
// //         "created_date": createdDateValues.reverse[createdDate],
// //         "profile_picture": profilePicture,
// //         "office_name": officeNameValues.reverse[officeName],
// //         "office_country": officeCountryValues.reverse[officeCountry],
// //         "office_city": officeCityValues.reverse[officeCity],
// //         "office_address": addressValues.reverse[officeAddress],
// //         "first_name": firstNameValues.reverse[firstName],
// //         "last_name": lastNameValues.reverse[lastName],
// //         "personal_country": personalCountryValues.reverse[personalCountry],
// //         "personal_city": personalCityValues.reverse[personalCity],
// //         "personal_address": addressValues.reverse[personalAddress],
// //         "id_card": idCard,
// //         "tagline": taglineValues.reverse[tagline],
// //         "hiring_manager": hiringManagerValues.reverse[hiringManager],
// //         "sign_document": signDocument,
// //         "my_client": myClientValues.reverse[myClient],
// //         "all_ratings": allRatingsValues.reverse[allRatings],
// //         "total_ratings": totalRatings,
// //         "percentage": percentage,
// //     };
// // }

// // enum AllRatings {
// //     EMPTY_EMPTY_EMPTY_EMPTY_EMPTY
// // }

// // final allRatingsValues = EnumValues({
// //     "['empty', 'empty', 'empty', 'empty', 'empty']": AllRatings.EMPTY_EMPTY_EMPTY_EMPTY_EMPTY
// // });

// // enum CreatedDate {
// //     THE_09_DECEMBER_2023
// // }

// // final createdDateValues = EnumValues({
// //     "09 December,2023": CreatedDate.THE_09_DECEMBER_2023
// // });

// // enum Email {
// //     SUNDERSHROFF_GMAIL_COM
// // }

// // final emailValues = EnumValues({
// //     "sundershroff@gmail.com": Email.SUNDERSHROFF_GMAIL_COM
// // });

// // enum FirstName {
// //     SUNDER
// // }

// // final firstNameValues = EnumValues({
// //     "sunder": FirstName.SUNDER
// // });

// // enum HiringManager {
// //     AV12345_GF
// // }

// // final hiringManagerValues = EnumValues({
// //     "AV12345GF": HiringManager.AV12345_GF
// // });

// // enum LastName {
// //     A
// // }

// // final lastNameValues = EnumValues({
// //     "A": LastName.A
// // });

// // enum MyClient {
// //     QKOKAMX1_QQF_XX18_SI4_IQUS
// // }

// // final myClientValues = EnumValues({
// //     "['', 'QKOKAMX1QQF', 'XX18SI4IQUS']": MyClient.QKOKAMX1_QQF_XX18_SI4_IQUS
// // });

// // enum Address {
// //     NGL
// // }

// // final addressValues = EnumValues({
// //     "ngl": Address.NGL
// // });

// // enum OfficeCity {
// //     BADAKHSHAN
// // }

// // final officeCityValues = EnumValues({
// //     "Badakhshan": OfficeCity.BADAKHSHAN
// // });

// // enum OfficeCountry {
// //     AFGHANISTAN
// // }

// // final officeCountryValues = EnumValues({
// //     "Afghanistan": OfficeCountry.AFGHANISTAN
// // });

// // enum OfficeName {
// //     ELECTRIC
// // }

// // final officeNameValues = EnumValues({
// //     "electric": OfficeName.ELECTRIC
// // });

// // enum PersonalCity {
// //     BENGO_PROVINCE
// // }

// // final personalCityValues = EnumValues({
// //     "Bengo Province": PersonalCity.BENGO_PROVINCE
// // });

// // enum PersonalCountry {
// //     ANGOLA
// // }

// // final personalCountryValues = EnumValues({
// //     "Angola": PersonalCountry.ANGOLA
// // });

// // enum Tagline {
// //     MJBHVGC
// // }

// // final taglineValues = EnumValues({
// //     "mjbhvgc": Tagline.MJBHVGC
// // });

// // enum Uid {
// //     ARUO0_C6_N78_J
// // }

// // final uidValues = EnumValues({
// //     "ARUO0C6N78J": Uid.ARUO0_C6_N78_J
// // });

// // class EnumValues<T> {
// //     Map<String, T> map;
// //     late Map<T, String> reverseMap;

// //     EnumValues(this.map);

// //     Map<T, String> get reverse {
// //         reverseMap = map.map((k, v) => MapEntry(v, k));
// //         return reverseMap;
// //     }
// // }



// // import 'package:http/http.dart' as http;
// // import 'dart:convert';

// // const link = "http://192.168.226.154:8000";



// // Future<FetchHiredInvestigators> pi_my_data() async {
// //   const private_investicator_id = "Y9M0YCN82YA";
// //   final url = Uri.parse("$link/pi_my_data/$private_investicator_id");
// //   final response = await http.get(url);
// //   final data = jsonDecode(response.body);
// //   return FetchHiredInvestigators.fromJson(data[0]);
// // }


// // void main() async{
// //   final data = await pi_my_data();
// //   print(data.firstName);
// // }


// class FetchHiredInvestigators {
//   // final String uid;
//   // final String email;
//   // final String mobile;
//   // final String password;
//   // final String otp;
//   // final String user_otp;
//   // final String date;
//   // final Uri profile_picture;
//   // final String office_name;
//   // final String office_country;
//   // final String office_city;
//   // final String office_address;
//   // final String first_name;
//   // final String last_name;
//   // final String personal_country;
//   // final String personal_city;
//   // final String personal_address;
//   // final String hiring_manager;
//   // final Uri id_card;
//   // final String tagline;
//   // final String my_client;
//   // final int total_ratings;



//    final String id;
//     final String uid;
//     final String email;
//     final String mobile;
//     final String password;
//     final int otp;
//     final int userOtp;
//     final String createdDate;
//     final String profilePicture;
//     final String officeName;
//     final String officeCountry;
//     final String officeCity;
//     final String officeAddress;
//     final String firstName;
//     final String lastName;
//     final String personalCountry;
//     final String personalCity;
//     final String personalAddress;
//     final String idCard;
//     final String tagline;
//     final String hiringManager;
//     final String signDocument;
//     final String myClient;
//     final String allRatings;
//     final String totalRatings;
//     final int percentage;

//   const FetchHiredInvestigators({
//     required this.id,
//     required this.uid,
//     required this.email,
//     required this.mobile,
//     required this.password,
//     required this.otp,
//     required this.userOtp,
//     required this.createdDate,
//     required this.profilePicture,
//     required this.officeName,
//     required this.officeCountry,
//     required this.officeCity,
//     required this.officeAddress,
//     required this.firstName,
//     required this.lastName,
//     required this.personalCountry,
//     required this.personalCity,
//     required this.personalAddress,
//     required this.idCard,
//     required this.tagline,
//     required this.hiringManager,
//     required this.signDocument,
//     required this.myClient,
//     required this.allRatings,
//     required this.totalRatings,
//     required this.percentage,
    
    
    
    
//     });

//   factory FetchHiredInvestigators.fromJson(Map<String, dynamic> json) =>
//       FetchHiredInvestigators(
//          id: json['id'].toString(),
//         uid: json['uid'].toString(),
//         email: json['email'].toString(),
//         mobile: json['mobile'].toString(),
//         password: json['password'].toString(),
//         otp: json['otp'],
//         userOtp: json['userOtp'],
//         createdDate: json['createdDate'].toString(),
//         profilePicture: json['profilePicture'].toString(),
//         officeName: json['officeName'].toString(),
//         officeCountry: json['officeCountry'].toString(),
//         officeCity: json['officeCity'].toString(),
//         officeAddress: json['officeAddress'].toString(),
//         firstName: json['firstName'].toString(),
//         lastName: json['lastName'].toString(),
//         personalCountry: json['personalCountry'].toString(),
//         personalCity: json['personalCity'].toString(),
//         personalAddress: json['personalAddress'].toString(),
//         idCard: json['idCard'].toString(),
//         tagline: json['tagline'].toString(),
//         hiringManager: json['hiringManager'].toString(),
//         signDocument: json['signDocument'].toString(),
//         myClient: json['myClient'].toString(),
//         allRatings: json['allRatings'].toString(),
//         totalRatings: json['totalRatings'].toString(),
//         percentage: json['percentage'] as int,
        
//       );
// }
// 9994447326 sathya usp


class PrivateInvestigatorModel{
  final int? id;
  final String? uid;
  final String? email;
  final String? mobile;
  final String? password;
  final int? otp;
  final int? user_otp;
  final String? created_date;
  final String? profile_picture;
  final String? office_name;
  final String? office_country;
  final String? office_city;
  final String? office_address;
  final String? first_name;
  final String? last_name;
  final String? personal_country;
  final String? personal_city;
  final String? personal_address;
  final String? id_card;
  final String? tagline;
  final String? hiring_manager;
  final String? sign_document;
  final String? my_client;
  final String? all_ratings;
  final int? total_ratings;
  final int? percentage;

  const PrivateInvestigatorModel({
    required this.id, required this.uid, required this.email, required this.mobile, required this.password, required this.otp, required this.user_otp,
    required this.created_date, required this.profile_picture, required this.office_name, required this.office_country, required this.office_city,
    required this.office_address, required this.first_name, required this.last_name, required this.personal_country, required this.personal_city,
    required this.personal_address, required this.id_card, required this.tagline, required this.hiring_manager, required this.sign_document,
    required this.my_client, required this.all_ratings, required this.total_ratings, required this.percentage,
  });

  factory PrivateInvestigatorModel.fromJson(Map<String, dynamic> json){
    return PrivateInvestigatorModel(
      id: json['id'] as int?,
      uid: json['uid'] as String?,
      email: json['email'] as String?,
      mobile: json['mobile'] as String?,
      password: json['password'] as String?,
      otp: json['otp'] as int?,
      user_otp: json['json_otp'] as int?,
      created_date: json['created_date'] as String?,
      profile_picture: json['profile_picture'] as String?,
      office_name: json['office_name'] as String?,
      office_country: json['office_country'] as String?,
      office_city: json['office_city'] as String?,
      office_address: json['office_address'] as String?,
      first_name: json['first_name'] as String?,
      last_name: json['last_name'] as String?,
      personal_country: json['personal_country'] as String?,
      personal_city: json['personal_city'] as String?,
      personal_address: json['personal_address'] as String?,
      id_card: json['id_card'] as String?,
      tagline: json['tagline'] as String?,
      hiring_manager: json['hiring_manager'] as String?,
      sign_document: json['sign_document'] as String?,
      my_client: json['my_client'] as String?,
      all_ratings: json['all_ratings'] as String?,
      total_ratings: json['total_ratings'] as int?,
      percentage: json['percentage'] as int?,
    );
  }
}