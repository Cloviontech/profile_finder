import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:profile_finder/core/services/api_services.dart';
import 'package:profile_finder/core/utils/color_constant.dart';
import 'package:profile_finder/core/utils/size_utils.dart';
import 'package:profile_finder/model_final/private_inv/pi_my_data.dart';
import 'package:profile_finder/model_final/profile_manager/my_manager_model.dart';
import 'package:profile_finder/model_final/profile_manager/pm_my_clients.dart';
import 'package:profile_finder/presentation/1ProfileFinder/MatchingList/1screen_advertisement.dart';
import 'package:profile_finder/presentation/1ProfileFinder/PrivateInvestigator/CloseAndRateFourtyFourScreen.dart';
import 'package:profile_finder/presentation/1ProfileFinder/PrivateInvestigator/CloseDealFourtyOneScreen.dart';
import 'package:profile_finder/presentation/1ProfileFinder/Profile%20Manager/AllProfileManagerScreen.dart';
import 'package:profile_finder/presentation/1ProfileFinder/Profile%20Manager/PmCloseDealScreen.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/CustomWidgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

//
// PM MY DATA MODEL
//
// To parse this JSON data, do
//
//     final pmMyDataModel = pmMyDataModelFromJson(jsonString);

import 'dart:convert';

List<PmMyDataModel> pmMyDataModelFromJson(String str) =>
    List<PmMyDataModel>.from(
        json.decode(str).map((x) => PmMyDataModel.fromJson(x)));

String pmMyDataModelToJson(List<PmMyDataModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PmMyDataModel {
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
  int? otp1;
  int? userOtp1;

  PmMyDataModel({
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

  factory PmMyDataModel.fromJson(Map<String, dynamic> json) => PmMyDataModel(
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

class PaymentOfManagerScreen extends StatefulWidget {
  PaymentOfManagerScreen({super.key, required this.profile_manager_id});

  final String profile_manager_id;

  @override
  State<PaymentOfManagerScreen> createState() => _PaymentOfManagerScreenState();
}

class _PaymentOfManagerScreenState extends State<PaymentOfManagerScreen> {
  static List<PmMyDataModel> userList = [];

  Future<void> _fetchPmMyData() async {
    print('_fetchPmMyData start');

    // late String private_investicator_id;
    //  SharedPreferences preferences = await SharedPreferences.getInstance();
    //   private_investicator_id = preferences.getString("uid2").toString();

    final response = await http.get(Uri.parse(
        "http://${ApiServices.ipAddress}//pm_my_data/${widget.profile_manager_id}"));

    // if (response.statusCode == 200) {
    print(response.statusCode);
    print(response.body);
    List<dynamic> jsonResponse = jsonDecode(response.body);
    setState(() {
      userList =
          jsonResponse.map((data) => PmMyDataModel.fromJson(data)).toList();
    });
    // print(response.statusCode);
    // print(response.body);

    // print(userList);

    debugPrint(userList[0].email);
  }

  // else {
  //   throw Exception('Failed to load data');
  // }
  // }

  String profile_finder_id = '';

  _hire_manager(
    String profile_manager_id,
  ) async {
    final statusCode;
    final statusCode1;
    final body;
    final body1;
    // await Future.delayed(Duration(seconds: 2));
    // debugPrint("My investigator start");

    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      profile_finder_id = preferences.getString("uid2").toString();
    });

    final url = Uri.parse(
        "http://${ApiService.ipAddress}/my_manager/$profile_finder_id");
    final pm_client = Uri.parse(
        "http://${ApiService.ipAddress}/pm_my_clients/$profile_manager_id");
    print("profile_manager_id : $profile_manager_id");

    // var request =  http.MultipartRequest('POST', url);
    var request1 = http.MultipartRequest('POST', pm_client);
    // request.fields['pf_id'] = profile_finder_id;
    // request.fields['pi_id'] = private_investigator_id;

    request1.fields['pf_id'] = profile_finder_id;
    request1.fields['pm_id'] = profile_manager_id;
    try {
      // if (_users.myInvestigator.toString().contains(private_investigator_id))
      // {

      // }

      // else{
      var request = http.MultipartRequest('POST', url);
      request.fields['pf_id'] = profile_finder_id;
      request.fields['pm_id'] = profile_manager_id;

      final response = await request.send();
      statusCode = response.statusCode;
      body = await response.stream.bytesToString();
      print("Status Code : $statusCode");
      print("UID : $body");

      // }

      final response1 = await request1.send();
      statusCode1 = response1.statusCode;
      body1 = await response1.stream.bytesToString();

      print("Status Code1 : $statusCode1");
      print("UID1 : $body1");
      print("Profile Manager selected succesfully, Uid : $profile_manager_id");

      if (response.statusCode == 200) {
        // setState(() {
        //   hire[hiree] = true;
        // });

        // Navigator.pushNamed(context, AppRoutes.paymentOfInvestigatorFourtyScreen);

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return PmCloseDealScreen(
                profile_manager_id_close_deal: profile_manager_id);
          }),
        );
      }
    } catch (e) {
      print("Do Something When Error Occurs");
    }
  }

  late String _profile_finder_id;
  static List<PmMyClientsModel> _pmMyClientsList = [];
  //  static List<_pmMyClientsListTestModel> __pmMyClientsList1 = [];

  _fetchPmMyClients() async {
    print('_fetchPmMyClients function start');
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _profile_finder_id = preferences.getString("uid2").toString();
    print(widget.profile_manager_id);
    final response = await http.get(Uri.parse(
        "http://${ApiService.ipAddress}/pm_my_clients/${widget.profile_manager_id}"));
    if (response.statusCode == 200) {
      final jsonoutput = jsonDecode(response.body);
      print(jsonoutput);
      // _pmMyClientsList = [
      //   for (final data in jsonoutput) PmMyClientsModel.fromJson(data)
      // ];
      print(_pmMyClientsList);
      // setState(() {
      //   isLoading1=false;
      // });
    }

    print(response.statusCode);
    print(response.body);
    final json = jsonDecode(response.body);

    print(json);
    print(json[0]);

    // print('pmclientsTestBody ${(_pmMyClientsListTestModelFromJson(response.body))}');
    // print('pmclientsTestManager ${_pmMyClientsListTestModelFromJson(widget.profile_manager_id)}');

    final data = jsonDecode(response.body) as Map;
    final id = data.keys.first;
    for (final pm in data[id]) {
      _pmMyClientsList.add(PmMyClientsModel.fromJson(pm));
    }
    print('_pmMyClientsList ${_pmMyClientsList[0]}');
    print(_pmMyClientsList[0].email);
  }
  //

  bool isLoading1 = true;

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

  List<String> allIvestigatorExceptMyList = [];
  List<String> allIvestigatorList = [];
  List<String> myInvestigatorList = [];

  int findLengthOfExceptMyInvestlength = 0;

  List<PfMyManagerListModel> myManagerList = [];

  Future<String?> _fetchMyManagerList() async {
    setState(() {
      myManagerList = [];
    });
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _profile_finder_id = preferences.getString("uid2").toString();

    print("myManagerList function start");
    print(_profile_finder_id);
    final response = await http.get(Uri.parse(
        "http://${ApiService.ipAddress}/my_manager/$_profile_finder_id"));
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

  @override
  void initState() {
    _fetchPmMyData();
    // _fetchPmMyClients();
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold();
    return Scaffold(
      appBar: ClAppbarLeadGridSuffHeart(
          testingNextPage: CloseDealFourtyOneScreen(
        private_investicator_id_close_deal: '',
      )),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade300)),
                  // height: DeviceSize.itemHeight * 2.5,
                  height: DeviceSize.itemHeight * 3,

                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Column(
                        children: [
                          Container(
                            // cover pic
                            height: 200,

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.orange,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'assets/images/img_rectangle690.png', //cover pic
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        top: 150,
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.green,
                              image: DecorationImage(
                                  image:
                                      // AssetImage(
                                      //     'assets/images/img_ellipse76.png'),
                                      NetworkImage(
                                          "${userList[0].profilePicture}")
                                  //
                                  //// profile pic
                                  )),
                        ),
                      ),
                      Positioned(
                        top: 260,
                        bottom: 30,
                        child: Column(
                          // mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              userList[0].firstName ?? 'Ariene McCoy',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            Row(
                              children: [
                                Text("${userList[0].officeCity}"),
                                Text(",  "),
                                Text("${userList[0].officeCountry}"),
                              ],
                            ),
                            Text('Payment of Investigator'),
                            Text(
                              '₹ 1200',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40,
                                  color: ColorConstant.clgreenAmountColor),
                            ),
                            const Text('For one month'),
                            MyElevatedButton(
                              onPressed: () {
                                // _fetchMyManagerList().whenComplete(() {
                                //   print('_fetchMyManagerList complete');
                                //   _allPiInvListfilter();
                                //   myInvestigatorFilter();
                                //   allIvestigatorExceptMyFilter();
                                //   findLengthOfExceptMyInvest();
                                //   print(
                                //       'findLengthOfExceptMyInvestlength ${findLengthOfExceptMyInvestlength}');
                                // });

                                allIvestigatorExceptMyList
                                        .contains(userList[0].uid)
                                    ? Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) {
                                          return PmCloseDealScreen(
                                              profile_manager_id_close_deal:
                                                  widget.profile_manager_id);
                                        }),
                                      )
                                    : 
                                    // _fetchMyManagerList().whenComplete(() {
                                    //     print('_fetchMyManagerList complete');
                                    //     _allPiInvListfilter();
                                    //     myInvestigatorFilter();
                                    //     allIvestigatorExceptMyFilter();
                                    //     findLengthOfExceptMyInvest();
                                       
                                    //   });
                                       _hire_manager(
                                            widget.profile_manager_id);
                              },
                              borderRadius: BorderRadius.circular(10),
                              backgroundColor: Colors.transparent,
                              child: allIvestigatorExceptMyList
                                      .contains(userList[0].uid)
                                  ? Text("Hired",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ))
                                  : Text("Hire Manager",
                                      style: TextStyle(
                                        color: Colors.white,
                                      )),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: DeviceSize.itemHeight / 15),
              // Text(widget.profile_manager_id),
              // Text(_pmMyClientsList[0].id.toString()),
              // Text(_pmMyClientsList[0].email.toString()),
              Text(
                "Reviews",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: DeviceSize.itemWidth / 13,
                    color: ColorConstant.clgreenAmountColor),
              ),
              SizedBox(height: DeviceSize.itemHeight / 15),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/img_ticket.svg',
                    height: 20,
                  ),
                  Text(
                    "  4.2",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: DeviceSize.itemWidth / 13,
                    ),
                  ),
                ],
              ),
              SizedBox(height: DeviceSize.itemHeight / 15),
              ListTile(
                contentPadding: const EdgeInsets.all(10),
                title: Text(
                  '60%',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: DeviceSize.itemWidth / 13,
                  ),
                ),
                subtitle: const Text('Good Reviews'),
                leading: SvgPicture.asset(
                  'assets/images/img_location.svg',
                  height: 45,
                ),
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: ColorConstant.clgreyborderColor),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
              ),
              CustomClListtileWidget(
                  profilePic: 'assets/images/img_ellipse88.png',

                  // C:\Flutter projects\Saran\Official\Marriyo\Marriyo_17_May\marriyo_17_may\assets\images\img_ellipse88.png
                  title: "Jane Cooper",
                  subtitleImage: 'assets/images/img_ticket.svg',
                  subTitle:
                      "The investigator is very quick and collect all details what i request him. thanks lot for helping such a great job."),
              CustomClListtileWidget(
                  profilePic: 'assets/images/img_ellipse89.png',
                  title: "Darrel Steward",
                  subtitleImage: 'assets/images/img_ticket.svg',
                  subTitle:
                      "The investigator is very quick and collect all details what i request him. thanks lot for helping such a great job."),
              CustomClListtileWidget(
                  profilePic: 'assets/images/img_ellipse89_53x53.png',
                  title: "Kristin Watson",
                  subtitleImage: 'assets/images/img_ticket.svg',
                  subTitle:
                      "The investigator is very quick and collect all details what i request him. thanks lot for helping such a great job."),
              CustomClListtileWidget(
                  profilePic: 'assets/images/img_ellipse89_1.png',
                  title: "Brooklyn Simmons",
                  subtitleImage: 'assets/images/img_ticket.svg',
                  subTitle:
                      "The investigator is very quick and collect all details what i request him. thanks lot for helping such a great job."),
              CustomClListtileWidget(
                profilePic: 'assets/images/img_ellipse89_2.png',
                title: "Cody Fisher",
                subtitleImage: 'assets/images/img_ticket.svg',
                subTitle:
                    "The investigator is very quick and collect all details what i request him. thanks lot for helping such a great job.",
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
              ),
              SizedBox(height: DeviceSize.itemHeight / 15),
              ListTile(
                // minLeadingWidth: 5,
                // horizontalTitleGap: 100,
                contentPadding: const EdgeInsets.all(10),
                title: Text(
                  '40%',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: DeviceSize.itemWidth / 13,
                  ),
                ),
                subtitle: const Text('Bad Reviews'),
                leading: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    SvgPicture.asset(
                      'assets/images/img_group_red_400.svg',
                      height: 50,
                    ),
                  ],
                ),
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: ColorConstant.clgreyborderColor),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
              ),
              CustomClListtileWidget(
                  profilePic: 'assets/images/img_ellipse88_53x53.png',
                  title: "Cody Fisher",
                  subtitleImage: 'assets/images/img_ticket.svg',
                  subTitle:
                      "The investigator is very quick and collect all details what i request him. thanks lot for helping such a great job."),
              CustomClListtileWidget(
                  profilePic: 'assets/images/img_ellipse89_3.png',
                  title: "Brooklyn Simmons",
                  subtitleImage: 'assets/images/img_ticket.svg',
                  subTitle:
                      "The investigator is very quick and collect all details what i request him. thanks lot for helping such a great job."),
              CustomClListtileWidget(
                  profilePic: 'assets/images/img_ellipse89_4.png',
                  title: "Brooklyn Simmons",
                  subtitleImage: 'assets/images/img_ticket.svg',
                  subTitle:
                      "The investigator is very quick and collect all details what i request him. thanks lot for helping such a great job."),
              CustomClListtileWidget(
                  profilePic: 'assets/images/img_ellipse89_5.png',
                  title: "Brooklyn Simmons",
                  subtitleImage: 'assets/images/img_ticket.svg',
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  subTitle:
                      "The investigator is very quick and collect all details what i request him. thanks lot for helping such a great job."),
              SizedBox(
                height: DeviceSize.itemHeight / 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
