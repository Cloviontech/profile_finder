import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:profile_finder/core/utils/color_constant.dart';
import 'package:profile_finder/core/utils/size_utils.dart';
import 'package:profile_finder/model_final/complaints/all_pm_data_list_model.dart';
import 'package:profile_finder/model_final/model_final.dart';
import 'package:profile_finder/model_final/private_inv/all_private_inv.dart';
import 'package:profile_finder/model_final/private_inv/my_investigators.dart';
import 'package:profile_finder/model_final/profile_manager/my_manager_model.dart';
import 'package:profile_finder/model_final/profile_manager/pm_my_clients.dart';
import 'package:profile_finder/presentation/1ProfileFinder/MatchingList/1screen_advertisement.dart';
import 'package:profile_finder/presentation/1ProfileFinder/PrivateInvestigator/CloseDealFourtyOneScreen.dart';
import 'package:profile_finder/presentation/1ProfileFinder/PrivateInvestigator/PaymentOfInvestigatorFourtyScreen.dart';
import 'package:profile_finder/presentation/1ProfileFinder/PrivateInvestigator/TaskCompleteThirtyNineScreen.dart';
import 'package:profile_finder/presentation/1ProfileFinder/PrivateInvestigator/TestAllInvestigator.dart';
import 'package:profile_finder/presentation/1ProfileFinder/Profile%20Manager/PaymentOfManagerScreen.dart';
import 'package:profile_finder/presentation/1ProfileFinder/Profile%20Manager/PmCloseDealScreen.dart';
import 'package:profile_finder/routes/app_routes.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/CustomWidgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
/*
class PrivateInvestigator {
  final String profile_finder_id;

  static List<PrivateInvestigatorModel> privateInvestigatorCollection = [];

  PrivateInvestigator({required this.profile_finder_id});

   callApi() async {
    final response = await http.get(Uri.parse(
        "http://${ApiService.ipAddress}/my_investigator/$profile_finder_id"));
    final _data = jsonDecode(response.body) as Map;
    final idd = _data.keys.first;
    for (final pi in _data[idd]) {
      privateInvestigatorCollection.add(PrivateInvestigatorModel.fromJson(pi));
    }
  }
}
*/

// To parse this JSON data, do
//
//     final allPmDataModel = allPmDataModelFromJson(jsonString);

import 'dart:convert';

List<AllPmDataModel> allPmDataModelFromJson(String str) =>
    List<AllPmDataModel>.from(
        json.decode(str).map((x) => AllPmDataModel.fromJson(x)));

String allPmDataModelToJson(List<AllPmDataModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllPmDataModel {
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

  AllPmDataModel({
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
  });

  factory AllPmDataModel.fromJson(Map<String, dynamic> json) => AllPmDataModel(
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
      };
}

class AllProfileManagerScreen extends StatefulWidget {
  @override
  State<AllProfileManagerScreen> createState() =>
      _AllProfileManagerScreenState();
}

class _AllProfileManagerScreenState extends State<AllProfileManagerScreen> {
  final double itemHeight = (size.height - kToolbarHeight - 24) / 4;

  final double itemWidth = size.width / 2;

  List<bool> hire = [];

  List<String> pi_my_Clients = [];

  // late String private_investicator_id;
  String profile_finder_id = '';

  String private_investigator_id_my_inv = '';

  static late List<AllPiData> _allPiData;

  // Future<void> _fetchData(int index) async {
  //   final response = await http.get(Uri.parse(
  //       "http://${ApiService.ipAddress}/all_private_investigator_data"));

  //   if (response.statusCode == 200) {
  //     print('fetch data function calling');
  //     List<dynamic> jsonResponse = jsonDecode(response.body);
  //     setState(() {
  //       _allPiData =
  //           jsonResponse.map((data) => AllPiData.fromJson(data)).toList();

  //       pi_my_Clients.add(_allPiData[index].myClient.toString());
  //       // print("profile pic : ${_allPiData[index].profilePicture}");
  //       // print("fetchData_myclients : ${_allPiData[index].myClient}");
  //       // print(
  //       //     "hire alldata bool :${_allPiData[index].myClient.toString().contains(profile_finder_id)}");
  //       // print(
  //       //     "hire alldata bool :${_allPiData[index].myClient.toString().contains('abcdef')}");

  //       // print(_allPiData[index].createdDate);
  //       //

  //       // print(_allPiData.toString());

  //       print(jsonResponse[0]);
  //     });

  //     // debugPrint(_allPiData[0].profilePicture);
  //   } else {
  //     throw Exception('Failed to load data');
  //   }
  // }

  my_manager_select(
    String private_manager_id,
  ) async {
    print('my investigator select function1 start');
    final statusCode;
    final statusCode1;

    final body1;

    final body;

    // await Future.delayed(Duration(seconds: 2));
    // debugPrint("My investigator start");

    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      profile_finder_id = preferences.getString("uid2").toString();
    });

    final url = Uri.parse(
        "http://${ApiService.ipAddress}/my_manager/$profile_finder_id");

    print("prof_find_id : $profile_finder_id");
    print("private_inv_id : $private_manager_id");

    var request = http.MultipartRequest('POST', url);

    request.fields['pf_id'] = profile_finder_id;
    request.fields['pm_id'] = private_manager_id;

    try {
      final response = await request.send();
      statusCode = response.statusCode;
      body = await response.stream.bytesToString();
      print("Status Code : $statusCode");
      print("UID : $body");

      // }

      if (response.statusCode == 200) {
        final pm_client = Uri.parse(
            "http://${ApiService.ipAddress}/pm_my_clients/$private_manager_id");

        print("prof_find_id : $profile_finder_id");
        print("private_inv_id : $private_manager_id");

        var request1 = http.MultipartRequest('POST', pm_client);

        request1.fields['pf_id'] = profile_finder_id;
        request1.fields['pm_id'] = private_manager_id;

        try {
          // }

          final response1 = await request1.send();
          statusCode1 = response1.statusCode;
          body1 = await response1.stream.bytesToString();

          print("Status Code1 : $statusCode1");
          print("UID1 : $body1");
          print(
              "Profile Manager selected succesfully, Uid : $private_manager_id");

          if (response1.statusCode == 200) {
            // setState(() {
            //   hire[hiree] = true;
            // });

            // Navigator.pushNamed(context, AppRoutes.paymentOfInvestigatorFourtyScreen);

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return PaymentOfManagerScreen(
                  profile_manager_id: private_manager_id,
                );
              }),
            );
          }
        } catch (e) {
          print("Do Something When Error Occurs");
        }
        // setState(() {
        //   hire[hiree] = true;
        // });

        // Navigator.pushNamed(context, AppRoutes.paymentOfInvestigatorFourtyScreen);

        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) {
        //     return PaymentOfInvestigatorFourtyScreen(
        //       private_investicator_id: private_investigator_id,
        //     );
        //   }),
        // );
      }
    } catch (e) {
      print("Do Something When Error Occurs");
    }
  }

  // my_investigator_select_1(
  //   String private_investigator_id,
  // ) async {

  //   print('my investigator select function2 start');

  //   final statusCode1;

  //   final body1;
  //   // await Future.delayed(Duration(seconds: 2));
  //   // debugPrint("My investigator start");

  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   setState(() {
  //     profile_finder_id = preferences.getString("uid2").toString();
  //   });

  //   final pi_client = Uri.parse(
  //       "http://${ApiService.ipAddress}/pi_my_clients/$private_investigator_id");

  //   print("prof_find_id : $profile_finder_id");
  //   print("private_inv_id : $private_investigator_id");

  //   var request1 = http.MultipartRequest('POST', pi_client);

  //   request1.fields['pf_id'] = profile_finder_id;
  //   request1.fields['pi_id'] = private_investigator_id;
  //   try {

  //     // }

  //     final response1 = await request1.send();
  //     statusCode1 = response1.statusCode;
  //     body1 = await response1.stream.bytesToString();

  //     print("Status Code1 : $statusCode1");
  //     print("UID1 : $body1");
  //     print(
  //         "Private Investigator selected succesfully, Uid : $private_investigator_id");

  //     if (response1.statusCode == 200) {
  //       // setState(() {
  //       //   hire[hiree] = true;
  //       // });

  //       // Navigator.pushNamed(context, AppRoutes.paymentOfInvestigatorFourtyScreen);

  //       // Navigator.push(
  //       //   context,
  //       //   MaterialPageRoute(builder: (context) {
  //       //     return PaymentOfInvestigatorFourtyScreen(
  //       //       private_investicator_id: private_investigator_id,
  //       //     );
  //       //   }),
  //       // );
  //     }
  //   } catch (e) {
  //     print("Do Something When Error Occurs");
  //   }
  // }

  Users _users = Users();
  bool isLoading = true;

  late String userUid;
  static String userUidLowerCase = '';
  static int myInvLength = 0;
  late String nameOfBrideGroom;

  void getData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    userUid = preferences.getString("uid2").toString();
    userUidLowerCase = preferences.getString("uid2").toString().toLowerCase();
    setState(() {
      userUidLowerCase = preferences.getString("uid2").toString().toLowerCase();
      userUid = preferences.getString("uid2").toString();
    });
    final response = await http
        .get(Uri.parse("http://${ApiService.ipAddress}/alldata/${userUid}"));
    var json = jsonDecode(response.body);

    print("statusCodeIs${response.statusCode}");

    if (response.statusCode == 200) {
      print('getdata function');
      _users = Users.fromJson(json);
      // print(response.body);
      setState(() {
        isLoading = false;
      });

      debugPrint(_users.profilePicture);
    } else {
      print("error");
      print(response.statusCode);
    }

    // _users= Users.fromJson(json);
    // setState(() {
    //   isLoading= false;
    // });
  }

  static bool displayInvestigator = true;

  // MyInvestigators _myInvestigators = MyInvestigators();

  bool isLoading1 = true;

//  void hiredInvestigators() async {
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//     userUid = preferences.getString("uid2").toString();

//     final response = await http
//         .get(Uri.parse("http://${ApiService.ipAddress}/my_investigator/${userUid}"));
//     var json = jsonDecode(response.body);

//     print("statusCodeIs${response.statusCode}");

//     if (response.statusCode == 200) {
//       _myInvestigators = MyInvestigators.fromJson(json);
//       print(response.body);
//       setState(() {
//         isLoading = false;
//         myInvLength = _myInvestigators.qkokamx1Qqf!.length;
//       });

//       debugPrint('My Hired Investigators');

//       debugPrint(_myInvestigators.qkokamx1Qqf![0].firstName.toString());
//        debugPrint(_myInvestigators.qkokamx1Qqf![0].profilePicture );
//        debugPrint("useruid lowercase :$userUidLowerCase");

//     }

//      else {
//       print("error");
//       print(response.statusCode);
//     }

//     // _users= Users.fromJson(json);
//     // setState(() {
//     //   isLoading= false;
//     // });
//   }

  // Future<PrivateInvestigatorModel> hiredInvestigators2() async {
  //   // const private_investicator_id = "Y9M0YCN82YA";
  //   final url =
  //       Uri.parse("http://${ApiService.ipAddress}/my_investigator/$userUid");
  //   final response = await http.get(url);
  //   final data = jsonDecode(response.body);
  //   return PrivateInvestigatorModel.fromJson(data[0]);
  // }

  // List<String> allIvestigatorExceptMyList = [];
  // List<String> allIvestigatorList = [];
  // List<String> myInvestigatorList = [];

  // _allPiInvListfilter() {
  //   for (var i = 0; i < _allPiData.length; i++) {
  //     allIvestigatorList.add(_allPiData[i].uid.toString());
  //   }
  // }

  // myInvestigatorFilter() {
  //   for (var i = 0;
  //       i <
  //           // PrivateInvestigator.
  //           privateInvestigatorCollection.length;
  //       i++) {
  //     myInvestigatorList.add(
  //         // PrivateInvestigator.
  //         privateInvestigatorCollection[i].uid.toString());
  //   }
  // }

  // allIvestigatorExceptMyFilter() {
  //   for (var i = 0; i < myInvestigatorList.length; i++) {
  //     if (allIvestigatorList.contains(myInvestigatorList[i])) {
  //       allIvestigatorExceptMyList.add(myInvestigatorList[i]);
  //     }
  //   }
  // }

  // int findLengthOfExceptMyInvestlength = 0;

  List<String> allIvestigatorExceptMyList = [];
  List<String> allIvestigatorList = [];
  List<String> myInvestigatorList = [];

  int findLengthOfExceptMyInvestlength = 0;

  // myManagerloop () {
  //   for (var i = 0; i < _allPiData.length; i++) {
  //     AllPiData.add(_allPiData[i]);

  //   }
  // }

  // findLengthOfExceptMyInvest() {
  //   for (var i = 0; i < allIvestigatorExceptMyList.length; i++) {
  //     allIvestigatorExceptMyList.contains(_allPiData[i].uid);
  //     setState(() {
  //       findLengthOfExceptMyInvestlength++;
  //     });
  //   }
  // }

  List<AllPmDataModel> _AllpmData = [];
  //
  Future<String?> _fetchAllPmData() async {
    print("_fetchAllPmData function start");
    final response = await http
        .get(Uri.parse("http://${ApiService.ipAddress}/all_pm_data/"));

    if (response.statusCode == 200) {
      final jsonoutput = jsonDecode(response.body);
      print(_AllpmData);
      _AllpmData = [
        for (final data in jsonoutput) AllPmDataModel.fromJson(data)
      ];
      print(_AllpmData);
      setState(() {
        isLoading1 = false;
      });
    }

    print("_AllpmData 0 length ${_AllpmData.length}");
  }

  List<PfMyManagerListModel> myManagerList = [];

  Future<String?> _fetchMyManagerList() async {
    setState(() {
      myManagerList = [];
    });
    SharedPreferences preferences = await SharedPreferences.getInstance();
    userUid = preferences.getString("uid2").toString();

    print("myManagerList function start");
    print(userUid);
    final response = await http
        .get(Uri.parse("http://${ApiService.ipAddress}/my_manager/$userUid"));
    print(response.body);
    final _data = jsonDecode(response.body) as Map;
    final idd = _data.keys.first;
    for (final pm in _data[idd]) {
      myManagerList.add(PfMyManagerListModel.fromJson(pm));
    }

    print('myManagerList ${findLengthOfExceptMyInvestlength}');
    print("_fetchMyManagerList function complete");
  }

  _allPiInvListfilter() {
    for (var i = 0; i < _AllpmData.length; i++) {
      allIvestigatorList.add(_AllpmData[i].uid.toString());
    }
  }

  myInvestigatorFilter() {
    for (var i = 0;
        i <
            // PrivateInvestigator.
            myManagerList.length;
        i++) {
      myInvestigatorList.add(
          // PrivateInvestigator.
          myManagerList[i].uid.toString());
    }
  }

  allIvestigatorExceptMyFilter() {
    for (var i = 0; i < myInvestigatorList.length; i++) {
      if (allIvestigatorList.contains(myInvestigatorList[i])) {
        allIvestigatorExceptMyList.add(myInvestigatorList[i]);
      }
    }
  }

  findLengthOfExceptMyInvest() {
    for (var i = 0; i < allIvestigatorExceptMyList.length; i++) {
      allIvestigatorExceptMyList.contains(_AllpmData[i].uid);
      setState(() {
        findLengthOfExceptMyInvestlength++;
      });
    }
  }

  //   static List<AllPmDataList> model = [];

  // Future<List<AllPmDataList>?> _fetchallPmDataList() async {
  //   debugPrint('entering getUsers function');
  //   try {
  //     // var url = Uri.parse("http://$ipAddress/alluserdata");
  //     var url = Uri.parse("http://${ApiService.ipAddress}/all_pm_data");
  //     //  var url = Uri.parse("http://127.0.0.1:3000/alluserdata");

  //     var response = await http.get(url);
  //     if (response.statusCode == 200) {
  //       List<AllPmDataList> model = allPmDataListFromJson(response.body);
  //       return model;
  //     }

  //     debugPrint('error code');
  //     print(response.statusCode);
  //   } catch (e) {
  //     // log(e.toString());
  //     print("error $e");
  //   }
  //   return model;
  // }

  _navigateToNextScreen() {
    print('private_investigator_id_my_inv : $private_investigator_id_my_inv');
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return PaymentOfManagerScreen(
        profile_manager_id: private_investigator_id_my_inv,
      );
    }));
  }

  late String _profile_finder_id;
  static List<PmMyClientsModel> _pmMyClientsList = [];
  //  static List<_pmMyClientsListTestModel> __pmMyClientsList1 = [];
  List my_manager = [];

  _fetchPmMyClients() async {
    print('_fetchPmMyClients function start');
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _profile_finder_id = preferences.getString("uid2").toString();

    for (var i = 0; i < _AllpmData.length; i++) {
      print(_AllpmData[i].uid);

      final response = await http.get(Uri.parse(
          "http://${ApiService.ipAddress}/pm_my_clients/${_AllpmData[i].uid}"));
      // if (response.statusCode == 200) {
      //   final jsonoutput = jsonDecode(response.body);

      // }

      // final json = jsonDecode(response.body);

      final data2 = jsonDecode(response.body) as Map;
      final id = data2.keys.first;
      for (final pm in data2[id]) {
        _pmMyClientsList.add(PmMyClientsModel.fromJson(pm));
      }
    }

    print("_AllpmData length ${_AllpmData.length}");

    print("_pmMyClientsList length ${_pmMyClientsList.length}");
  }

  find_length_of_my_manager() async {
    for (var i = 0; i < _AllpmData.length; i++) {
      print('length 0 of my_manager ${my_manager.length}');
      for (var j = 0; j < _pmMyClientsList.length; j++) {
        if (_pmMyClientsList[j]
            .myManager!
            .contains(_AllpmData[i].uid.toString())) {
          my_manager.add(_AllpmData[i].uid);
          print('length 1 of my_manager ${my_manager.length}');
        }
      }
    }
    print('length 2 of my_manager ${my_manager.length}');
  }

  @override
  void initState() {
    super.initState();

    _fetchAllPmData();
    //  _fetchPmMyClients();
    //  find_length_of_my_manager();
    _fetchMyManagerList().whenComplete(() {
      print('_fetchMyManagerList complete');
      _allPiInvListfilter();
      myInvestigatorFilter();
      allIvestigatorExceptMyFilter();
      findLengthOfExceptMyInvest();
      print(
          'findLengthOfExceptMyInvestlength ${findLengthOfExceptMyInvestlength}');
    });

    // myManagerList();
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold();
    return Scaffold(
      appBar: const ClAppbarLeadGridSuffHeart(
          testingNextPage: TaskCompleteThirtyNineScreen()),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: const BoxDecoration(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [


                // Text("Complaintsss"),
                TextField(
                  decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SvgPicture.asset(
                          'assets/images/img_clock_black_900.svg',
                        ),
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child:
                            SvgPicture.asset('assets/images/img_settings.svg'),
                      ),
                      hintText: "Search",
                      filled: true,
                      fillColor: ColorConstant.clTextFormfieldFilledColor,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10))),
                ),
                // Text(_AllpmData[0].email.toString()),
                // Text(myManagerList.length.toString()),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 8,
                        child: MyElevatedButton(
                          onPressed: () {
                            setState(() {
                              displayInvestigator = true;
                              debugPrint(displayInvestigator.toString());
                            });
                          },
                          borderRadius: BorderRadius.circular(30),
                          backgroundColor: displayInvestigator
                              ? ColorConstant.
                                  // clElevatedButtonFontColor
                                  clElevatedButtonColor
                              : ColorConstant.clElevatedButtonColor2,
                          child: Text(
                            "All Managers",
                            style: TextStyle(
                                color: displayInvestigator
                                    ? Colors.white
                                    : ColorConstant.clElevatedButtonColor
                                //  Color.fromRGBO(r, g, b, opacity)

                                ),
                          ),
                        ),
                      ),
                      const Expanded(
                          flex: 1,
                          child: SizedBox(
                            width: 20,
                          )),
                      Expanded(
                        flex: 8,
                        child: MyElevatedButton(
                          onPressed: () {
                            _fetchMyManagerList().whenComplete(() {
                             _allPiInvListfilter();
                              myInvestigatorFilter();
                              allIvestigatorExceptMyFilter();
                              findLengthOfExceptMyInvest();
                              });
                            setState(() {
                              displayInvestigator = false;
                            });

                            debugPrint(displayInvestigator.toString());
                            // hiredInvestigators2();
                          },
                          child: Text(
                            "My Manager",
                            style: TextStyle(
                                color: displayInvestigator
                                    ? ColorConstant.clElevatedButtonColor
                                    : Colors.white
                                // : ColorConstant.clElevatedButtonFontColor
                                ),
                          ),
                          borderRadius: BorderRadius.circular(30),
                          backgroundColor: displayInvestigator
                              ? ColorConstant.clElevatedButtonColor2
                              : ColorConstant.clElevatedButtonColor,
                        ),
                      )
                    ],
                  ),
                ),

                // if (displayInvestigator == true) {

                // Text(findLengthOfExceptMyInvestlength.toString()),

                ListView.builder(
                    controller: ScrollController(),
                    //  debugPrint(_myInvestigators.qkokamx1Qqf![0].firstName.toString());
                    itemCount: displayInvestigator
                        ? _AllpmData.length
                        // ? findLengthOfExceptMyInvestlength
                        : myManagerList.length,
                    shrinkWrap: true,
                    itemBuilder: ((context, index) {
                      return GestureDetector(
                        onTap: () {
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) {
                          //   return SuccessStoryThirtyFiveScreen(
                          //     index: index,
                          //   );
                          // }));
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Column(
                                children: [
                                  displayInvestigator
                                      ?

                                      // allIvestigatorExceptMyList.contains(_AllpiDataTest[index].uid) ?

                                      ClProfilePictureWithCover(
                                          itemHeight: itemHeight,
                                          profilePicturepath: _AllpmData[index]
                                              .profilePicture
                                              .toString(),
                                          coverPicturepath: _AllpmData[index]
                                              .profilePicture
                                              .toString(),
                                          name: _AllpmData[index]
                                              .firstName
                                              .toString(),
                                          place:
                                              '${_AllpmData[index].officeCity.toString()},  ${_AllpmData[index].officeCountry.toString()}',

                                          //  onPressed: my_investigator(_AllpmData[index].uid),
                                          // onPressed: testFunction(),
                                          onPressed: () {
                                            setState(() {
                                              private_investigator_id_my_inv =
                                                  _AllpmData[index]
                                                      .uid
                                                      .toString();
                                            });
                                            print(
                                                private_investigator_id_my_inv);

                                            _navigateToNextScreen();
                                            // Navigator.push(
                                            //   context,
                                            //   MaterialPageRoute(
                                            //       builder: (context) {
                                            //     return PaymentOfManagerScreen(
                                            //       profile_manager_id:
                                            //           private_investigator_id_my_inv,
                                            //     );
                                            //   }),
                                            // );
                                            // setState(() {
                                            //   private_investigator_id_my_inv =
                                            //       privateInvestigatorCollection[
                                            //               index]
                                            //           .uid
                                            //           .toString();
                                            // });

                                            // my_manager_select(
                                            //   // _allPiData[index].uid,
                                            //   "${_AllpmData[index].uid}",
                                            // );

                                            // _fetchData(index);

                                            // print("button$pi_my_Clients");
                                            // print(
                                            //     "hire :${pi_my_Clients[index].contains(profile_finder_id)}");
                                            // print(
                                            //     "hire alldata bool :${_AllpmData[index].myClient.toString().contains(profile_finder_id)}");

                                            // print(
                                            // "hire_allData :${_AllpmData[index]}");
                                            // print(
                                            //     "profilefind_myInv :${_users.myInvestigator.toString()}");
                                          },
                                          // hire: pi_my_Clients[index].contains(profile_finder_id)
                                          hire: _AllpmData[index]
                                              .email
                                              .toString()
                                              .contains(profile_finder_id),
                                          elevatedButtonText:
                                              'View Manager Details',

                                          // onPressed: my_investigator(_AllpiDataTest[index].uid), buttonData: '',
                                          // onTapHirePi:my_investigator(_AllpiDataTest[index].uid),
                                        )

                                      // : Container()
                                      : GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              private_investigator_id_my_inv =
                                                  myManagerList[index]
                                                      .uid
                                                      .toString();
                                            });
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return PmCloseDealScreen(
                                                 profile_manager_id_close_deal: private_investigator_id_my_inv,
                                              );
                                            }));
                                          },
                                          child:
                                              ClProfilePictureWithCoverWithLinearPercentIndicator(
                                            itemHeight: DeviceSize.itemHeight,
                                            // profilePicturepath: 'assets/images/img_ellipse76.png',
                                            profilePicturepath:
                                                myManagerList[index]
                                                    .profilePicture
                                                    .toString(),
                                            coverPicturepath:
                                                myManagerList[index]
                                                    .profilePicture
                                                    .toString(),
                                            name:myManagerList[index]
                                                .firstName
                                                .toString(),
                                            // place:
                                            //     '${myManagerList[index].officeCity} ${myManagerList[index].officeCountry}',
                                             place:
                                                myManagerList[index].uid .toString(),
                                           
                                            
                                            
                                            percentage: 55,
                                          ),
                                        ),
                                ],
                              )),
                        ),
                      );
                    })),

                // ListView.builder(
                //     controller: ScrollController(),
                //     itemCount: displayInvestigator
                //         ? _AllpiDataTest.length
                //         : _AllpiDataTest.length,
                //     shrinkWrap: true,
                //     itemBuilder: ((context, index) {
                //       return GestureDetector(
                //         onTap: () {
                //           // Navigator.push(context,
                //           //     MaterialPageRoute(builder: (context) {
                //           //   return SuccessStoryThirtyFiveScreen(
                //           //     index: index,
                //           //   );
                //           // }));
                //         },
                //         child: Padding(
                //           padding: const EdgeInsets.symmetric(vertical: 10),
                //           child: ClipRRect(
                //               borderRadius: BorderRadius.circular(8),
                //               child: Column(
                //                 children: [
                //                   ClProfilePictureWithCoverWithLinearPercentIndicator(
                //                     itemHeight: DeviceSize.itemHeight,
                //                     profilePicturepath:
                //                         'assets/images/img_ellipse76.png',
                //                     coverPicturepath:
                //                         'assets/images/img_rectangle690.png',
                //                     name: 'Ariene McCoy',
                //                     place: 'Dubai, United Arab Emirates',
                //                     percentage: 45,
                //                   ),
                //                 ],
                //               )),
                //         ),
                //       );
                //     })),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// }

// [ 'ARUO0C6N78J', 'ARUO0C6N78J', 'ARUO0C6N78J', 'ARUO0C6N78J', 'ARUO0C6N78J', 'ARUO0C6N78J',
// 'ARUO0C6N78J', 'ARUO0C6N78J', 'ARUO0C6N78J', 'ARUO0C6N78J', 'ARUO0C6N78J', 'ARUO0C6N78J',
// 'ARUO0C6N78J', 'ARUO0C6N78J', 'ARUO0C6N78J', 'ARUO0C6N78J', 'ARUO0C6N78J', 'ARUO0C6N78J',
// 'ARUO0C6N78J', 'ARUO0C6N78J', 'ARUO0C6N78J', 'ARUO0C6N78J', 'ARUO0C6N78J', 'ARUO0C6N78J',
// 'ARUO0C6N78J',
// 'ARUO0C6N78J', 'ARUO0C6N78J', 'ARUO0C6N78J', 'ARUO0C6N78J', 'ARUO0C6N78J', 'ARUO0C6N78J', 'ARUO0C6N78J']
