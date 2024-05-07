import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:profile_finder/core/services/api_services.dart';
import 'package:profile_finder/core/utils/color_constant.dart';
import 'package:profile_finder/core/utils/size_utils.dart';
import 'package:profile_finder/model_final/model_final.dart';
import 'package:profile_finder/model_final/private_inv_models/all_private_inv.dart';
import 'package:profile_finder/model_final/private_inv_models/my_investigator1.dart';
import 'package:profile_finder/model_final/private_inv_models/my_investigators.dart';
import 'package:profile_finder/presentation/1ProfileFinder/MatchingList/1screen_advertisement.dart';
import 'package:profile_finder/presentation/1ProfileFinder/PrivateInvestigator/PiCloseDealScreen.dart';
import 'package:profile_finder/presentation/1ProfileFinder/PrivateInvestigator/CloseDealFourtyOneScreen.dart';
import 'package:profile_finder/presentation/1ProfileFinder/PrivateInvestigator/PaymentOfInvestigatorFourtyScreen.dart';
import 'package:profile_finder/presentation/1ProfileFinder/PrivateInvestigator/TaskCompleteThirtyNineScreen.dart';
import 'package:profile_finder/presentation/1ProfileFinder/PrivateInvestigator/TestAllInvestigator.dart';
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

class AllInvestigatorThirtyEightScreen extends StatefulWidget {
  @override
  State<AllInvestigatorThirtyEightScreen> createState() =>
      _AllInvestigatorThirtyEightScreenState();
}

class _AllInvestigatorThirtyEightScreenState
    extends State<AllInvestigatorThirtyEightScreen> {
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

  my_investigator_select(
    String private_investigator_id,
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
        "http://${ApiService.ipAddress}/my_investigator/$profile_finder_id");

    print("prof_find_id : $profile_finder_id");
    print("private_inv_id : $private_investigator_id");

    var request = http.MultipartRequest('POST', url);

    request.fields['pf_id'] = profile_finder_id;
    request.fields['pi_id'] = private_investigator_id;

    try {
      final response = await request.send();
      statusCode = response.statusCode;
      body = await response.stream.bytesToString();
      print("Status Code : $statusCode");
      print("UID : $body");

      // }

      if (response.statusCode == 200) {
        final pi_client = Uri.parse(
            "http://${ApiService.ipAddress}/pi_my_clients/$private_investigator_id");

        print("prof_find_id : $profile_finder_id");
        print("private_inv_id : $private_investigator_id");

        var request1 = http.MultipartRequest('POST', pi_client);

        request1.fields['pf_id'] = profile_finder_id;
        request1.fields['pi_id'] = private_investigator_id;

        try {
          // }

          final response1 = await request1.send();
          statusCode1 = response1.statusCode;
          body1 = await response1.stream.bytesToString();

          print("Status Code1 : $statusCode1");
          print("UID1 : $body1");

          if (response1.statusCode == 200) {
            print(
                "Private Investigator selected succesfully, Uid : $private_investigator_id");

            // setState(() {
            //   hire[hiree] = true;
            // });

            // Navigator.pushNamed(context, AppRoutes.paymentOfInvestigatorFourtyScreen);

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return PaymentOfInvestigatorFourtyScreen(
                  private_investicator_id: private_investigator_id,
                );
              }),
            );
          } else {
            print(
                "Private Investigator Not selected, Uid : $private_investigator_id");
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

  // // myManagerloop () {
  // //   for (var i = 0; i < _allPiData.length; i++) {
  // //     AllPiData.add(_allPiData[i]);

  // //   }
  // // }

  // findLengthOfExceptMyInvest() {
  //   for (var i = 0; i < allIvestigatorExceptMyList.length; i++) {
  //     allIvestigatorExceptMyList.contains(_allPiData[i].uid);
  //     setState(() {
  //       findLengthOfExceptMyInvestlength++;
  //     });
  //   }
  // }

  List<TestAllPiDataModel> _AllpiDataTest = [];
  //
  Future<String?> _fetchDataTest() async {
    final response = await http.get(Uri.parse(
        "http://${ApiService.ipAddress}/all_private_investigator_data"));

    if (response.statusCode == 200) {
      final jsonoutput = jsonDecode(response.body);
      print(_AllpiDataTest);
      _AllpiDataTest = [
        for (final data in jsonoutput) TestAllPiDataModel.fromJson(data)
      ];
      print(_AllpiDataTest);
      setState(() {
        isLoading1 = false;
      });
    }
  }

  static List<PrivateInvestigatorModel> privateInvestigatorCollection = [];

  Future<String?> callApi() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      profile_finder_id = preferences.getString("uid2").toString();
    });

    final response = await http.get(Uri.parse(
        "http://${ApiServices.ipAddress}/my_investigator/$profile_finder_id"));
    final _data = jsonDecode(response.body) as Map;
    final idd = _data.keys.first;
    for (final pi in _data[idd]) {
      privateInvestigatorCollection.add(PrivateInvestigatorModel.fromJson(pi));
    }
  }

//

  List<String>? MyInvestigatorsUidList = [];

  // getMyInvestigatorsUid() {
  //   for (var i = 0; i < privateInvestigatorCollection.length; i++) {
  //     MyInvestigatorsUidList!
  //         .add(privateInvestigatorCollection[i].uid.toString());
  //   }
  // }
  //

  List<MyInvestigator> myInvestigatorList = [];

  Future<String?> _fetchMyInvList() async {
    setState(() {
      myInvestigatorList = [];
    });
    SharedPreferences preferences = await SharedPreferences.getInstance();
    userUid = preferences.getString("uid2").toString();

    print("myInvestigatorList function start");
    print(userUid);
    final response = await http.get(
        Uri.parse("http://${ApiService.ipAddress}/my_investigator/$userUid"));
    print(response.body);
    // final _data = jsonDecode(response.body) as Map;
    final _data = jsonDecode(response.body) ;
    // debugPrint(     _data);
    
    final idd = _data.keys.first;
    for (final pm in _data[idd]) {
      myInvestigatorList.add(MyInvestigator.fromJson(pm));
    }

    // print('myInvestigatorList ${findLengthOfExceptMyInvestlength}');
    print("_fetchmyInvestigatorList function complete");
  }

  @override
  void initState() {
    // myManagerloop();
    // getData();
    // _fetchData(0);
    // PrivateInvestigator.callApi();
    // _allPiInvListfilter();
    // myInvestigatorFilter();
    // allIvestigatorExceptMyFilter();
    // findLengthOfExceptMyInvest();
    // print("allIvestigatorExceptMyList");
    // print(allIvestigatorExceptMyList);

    super.initState();

    _fetchDataTest();
    // callApi().whenComplete(() => getMyInvestigatorsUid());

    _fetchMyInvList();
    // getMyInvestigatorsUid();

    myInvestigatorList = [] ;
  }


  
  //  @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   // Your code here will be executed when the screen is returned to
  //   // after navigating back from another screen
  //    _fetchDataTest();
   

  //   _fetchMyInvList();

  //   myInvestigatorList = [] ;

  // }

  @override
  Widget build(BuildContext context) {
    //   return Scaffold(
    //     body: Text(_allPiData[0].email),
    //   );
    // }
    // }
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

                Text(myInvestigatorList.length.toString()),
                Center(
                  child: Text(
                    "Private Investigators",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),

                D10HCustomClSizedBoxWidget(),

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
                // Text(privateInvestigatorCollection.length.toString()),
                // Text(MyInvestigatorsUidList.toString()),
                // Text(profile_finder_id),

                // Text(MyInvestigatorsUidList![0]),

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
                            "All Investigator",
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
                            // callApi();
                            setState(() {
                              displayInvestigator = false;
                            });

                            debugPrint(displayInvestigator.toString());
                            // hiredInvestigators2();
                          },
                          child: Text(
                            "My Investigator",
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

                // Text(_AllpiDataTest.length.toString()),
                // Text(myInvestigatorList.length.toString()),

                // Text(_AllpiDataTest[0].email.toString()),

                // Text(_AllpiDataTest[1].email.toString()),
                // Text(_AllpiDataTest[2].email.toString()),
                // Text(_AllpiDataTest[3].email.toString()),
                // Text(_AllpiDataTest[4].email.toString()),
                // Text(_AllpiDataTest[5].email.toString()),
                // Text(displayInvestigator.toString()),

                ListView.builder(
                    controller: ScrollController(),
                    //  debugPrint(_myInvestigators.qkokamx1Qqf![0].firstName.toString());
                    itemCount: displayInvestigator
                        ? _AllpiDataTest.length
                        // ? findLengthOfExceptMyInvestlength
                        : myInvestigatorList.length,
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
                                  // Text(_AllpiDataTest.length.toString()),
                                  // Text(myInvestigatorList.length.toString()),
                                  displayInvestigator
                                      ?

                                      // allIvestigatorExceptMyList.contains(_AllpiDataTest[index].uid) ?

                                      ClProfilePictureWithCover(
                                          itemHeight: itemHeight,
                                          profilePicturepath:
                                              _AllpiDataTest[index]
                                                  .profilePicture
                                                  .toString(),
                                          coverPicturepath:
                                              _AllpiDataTest[index]
                                                  .profilePicture
                                                  .toString(),
                                          name: _AllpiDataTest[index]
                                              // .firstName
                                              .uid
                                              .toString(),
                                          place:
                                              '${_AllpiDataTest[index].officeCity.toString()},  ${_AllpiDataTest[index].officeCountry.toString()}',

                                          //  onPressed: my_investigator(_AllpiDataTest[index].uid),
                                          // onPressed: testFunction(),
                                          onPressed: () {
                                            // MyInvestigatorsUidList!.contains(
                                            //         _AllpiDataTest[index].uid)
                                            //     ? null
                                            //     :
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                                return PaymentOfInvestigatorFourtyScreen(
                                                  private_investicator_id:
                                                      _AllpiDataTest[index]
                                                          .uid
                                                          .toString(),
                                                );
                                              }),
                                            );
                                          },
                                          // hire: _AllpiDataTest[index]
                                          //     .myClient!
                                          //     // .toString()
                                          //     .contains(profile_finder_id),
                                          elevatedButtonText:
                                              // myInvestigatorList.contains(
                                              //         _AllpiDataTest[index].uid.toString())
                                              //     ? 'Hired'
                                              //     : 
                                                  'Hire Investigator',

                                          // onPressed: my_investigator(_AllpiDataTest[index].uid), buttonData: '',
                                          // onTapHirePi:my_investigator(_AllpiDataTest[index].uid),
                                        rating:  _AllpiDataTest[index].totalRatings == null ? 1: _AllpiDataTest[index].totalRatings!.toDouble() ,
                                        
                                        
                                        )

                                      // : Container()
                                      : GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              private_investigator_id_my_inv =
                                                  myInvestigatorList[index]
                                                      .uid
                                                      .toString();
                                            });
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return PfPiCloseDealScreen(
                                                private_investicator_id_close_deal:
                                                    private_investigator_id_my_inv,
                                                profile_manager_id_close_deal:
                                                    '',
                                              );
                                            }));
                                          },
                                          child:
                                              ClProfilePictureWithCoverWithLinearPercentIndicator(
                                            itemHeight: DeviceSize.itemHeight,
                                            // profilePicturepath: 'assets/images/img_ellipse76.png',
                                            profilePicturepath:
                                                myInvestigatorList[index]
                                                    .profilePicture
                                                    .toString(),
                                            coverPicturepath:
                                                myInvestigatorList[index]
                                                    .profilePicture
                                                    .toString(),
                                            name: myInvestigatorList[index]
                                                .uid
                                                .toString(),
                                            place:
                                                '${myInvestigatorList[index].officeCity.toString()} , ${myInvestigatorList[index].officeCountry}',
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
