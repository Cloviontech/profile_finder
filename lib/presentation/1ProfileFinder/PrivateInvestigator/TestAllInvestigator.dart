import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:profile_finder/presentation/1ProfileFinder/MatchingList/1screen_advertisement.dart';

// To parse this JSON data, do
//
//     final testAllPiDataModel = testAllPiDataModelFromJson(jsonString);

import 'dart:convert';

TestAllPiDataModel testAllPiDataModelFromJson(String str) => TestAllPiDataModel.fromJson(json.decode(str));

String testAllPiDataModelToJson(TestAllPiDataModel data) => json.encode(data.toJson());

class TestAllPiDataModel {
    String? uid;
    String? email;
    String? mobile;
    String? password;
    int? otp;
    int? userOtp;
    String? createdDate;
    String? profilePicture;
    dynamic officeName;
    dynamic officeCountry;
    dynamic officeCity;
    dynamic officeAddress;
    dynamic firstName;
    dynamic lastName;
    dynamic personalCountry;
    dynamic personalCity;
    dynamic personalAddress;
    dynamic hiringManager;
    dynamic idCard;
    dynamic tagline;
    String? myClient;
    int? totalRatings;

    TestAllPiDataModel({
        this.uid,
        this.email,
        this.mobile,
        this.password,
        this.otp,
        this.userOtp,
        this.createdDate,
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
        this.hiringManager,
        this.idCard,
        this.tagline,
        this.myClient,
        this.totalRatings,
    });

    factory TestAllPiDataModel.fromJson(Map<String, dynamic> json) => TestAllPiDataModel(
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






class TestAllInvestigatorScreen extends StatefulWidget {
  const TestAllInvestigatorScreen({super.key});

  @override
  State<TestAllInvestigatorScreen> createState() => _TestAllInvestigatorScreenState();
}

class _TestAllInvestigatorScreenState extends State<TestAllInvestigatorScreen> {



List <TestAllPiDataModel> _AllpiDataTest = [];
  // 
   Future<String?> _fetchDataTest() async {
    final response = await http.get(Uri.parse(
        "http://${ApiService.ipAddress}/all_private_investigator_data"));

    if (response.statusCode == 200) {
    final  jsonoutput =  jsonDecode(response.body);
    print(_AllpiDataTest);
    _AllpiDataTest = [

      for (final data in jsonoutput)
        TestAllPiDataModel.fromJson(data)

      
    ];
    print(_AllpiDataTest);

    }
   }
    // 

    @override
  void initState() {
    _fetchDataTest();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       body: ListView.builder(
        itemCount: _AllpiDataTest.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Text("${_AllpiDataTest[index].email}"),
              Text("${_AllpiDataTest[index].createdDate}"),
              Text("${_AllpiDataTest[index].firstName}"),
              Text("${_AllpiDataTest[index].hiringManager}"),
              Text("${_AllpiDataTest[index].idCard}"),
              Text("${_AllpiDataTest[index].myClient}"),
              
            ],

          );
        },
       )
    );
  }
   }


