import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:profile_finder/core/utils/color_constant.dart';
import 'package:profile_finder/core/utils/size_utils.dart';
import 'package:profile_finder/model_final/model_final.dart';
import 'package:profile_finder/model_final/private_inv/my_ques_ans.dart';
import 'package:profile_finder/model_final/private_inv/pi_my_data.dart';
import 'package:profile_finder/model_final/profile_manager/complaints_model.dart';
import 'package:profile_finder/model_final/profile_manager/pm_my_clients.dart';
import 'package:profile_finder/presentation/1ProfileFinder/MatchingList/1screen_advertisement.dart';
import 'package:profile_finder/presentation/1ProfileFinder/PrivateInvestigator/AnswerFourtyTwoScreen.dart';
import 'package:profile_finder/presentation/1ProfileFinder/PrivateInvestigator/WhereIsTheSanFourtyThreeScreen.dart';
import 'package:profile_finder/presentation/1ProfileFinder/PrivateInvestigator/WriteYourQuestionFourtyFiveScreen.dart';
import 'package:profile_finder/presentation/1ProfileFinder/Profile%20Manager/PaymentOfManagerScreen.dart';
import 'package:profile_finder/presentation/1ProfileFinder/Profile%20Manager/WriteYourComplaintPfScreen.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/CustomWidgets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PmCloseDealScreen extends StatefulWidget {
  PmCloseDealScreen({super.key, required this.profile_manager_id_close_deal});

  final String profile_manager_id_close_deal;

  @override
  State<PmCloseDealScreen> createState() => _PmCloseDealScreenState();
}

class _PmCloseDealScreenState extends State<PmCloseDealScreen> {
  static List<PmMyDataModel> userList = [];

  Future<void> _pm_my_data_fetchData() async {
    // late String private_investicator_id;
    //  SharedPreferences preferences = await SharedPreferences.getInstance();
    //   private_investicator_id = preferences.getString("uid2").toString();

    final response = await http.get(Uri.parse(
        "http://${ApiService.ipAddress}/pm_my_data/${widget.profile_manager_id_close_deal}"));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      setState(() {
        userList =
            jsonResponse.map((data) => PmMyDataModel.fromJson(data)).toList();
      });

      debugPrint(userList[0].profilePicture);
    } else {
      throw Exception('Failed to load data');
    }
  }

  String profile_finder_id = '';

  // my_investigator(
  //   String profile_manager_id,
  // ) async {
  //   final statusCode;
  //   final statusCode1;
  //   final body;
  //   final body1;
  //   // await Future.delayed(Duration(seconds: 2));
  //   // debugPrint("My investigator start");

  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   setState(() {
  //     profile_finder_id = preferences.getString("uid2").toString();
  //   });

  //   final url = Uri.parse(
  //       "http://${ApiService.ipAddress}/my_manager/$profile_finder_id");
  //   final pm_client = Uri.parse(
  //       "http://${ApiService.ipAddress}/pm_my_clients/$profile_manager_id");
  //   print("profile_manager_id : $profile_manager_id");

  //   // var request =  http.MultipartRequest('POST', url);
  //   var request1 = http.MultipartRequest('POST', pm_client);
  //   // request.fields['pf_id'] = profile_finder_id;
  //   // request.fields['pi_id'] = private_investigator_id;

  //   request1.fields['pf_id'] = profile_finder_id;
  //   request1.fields['pm_id'] = profile_manager_id;
  //   try {
  //     // if (_users.myInvestigator.toString().contains(private_investigator_id))
  //     // {

  //     // }

  //     // else{
  //     var request = http.MultipartRequest('POST', url);
  //     request.fields['pf_id'] = profile_finder_id;
  //     request.fields['pm_id'] = profile_manager_id;

  //     final response = await request.send();
  //     statusCode = response.statusCode;
  //     body = await response.stream.bytesToString();
  //     print("Status Code : $statusCode");
  //     print("UID : $body");

  //     // }

  //     final response1 = await request1.send();
  //     statusCode1 = response1.statusCode;
  //     body1 = await response1.stream.bytesToString();

  //     print("Status Code1 : $statusCode1");
  //     print("UID1 : $body1");
  //     print("Profile Manager selected succesfully, Uid : $profile_manager_id");

  //     if (response.statusCode == 200) {
  //       // setState(() {
  //       //   hire[hiree] = true;
  //       // });

  //       // Navigator.pushNamed(context, AppRoutes.paymentOfInvestigatorFourtyScreen);

  //       // Navigator.push(
  //       //   context,
  //       //   MaterialPageRoute(builder: (context) {
  //       //     return PmCloseDealScreen(
  //       //       profile_manager_id_close_deal: profile_manager_id,
  //       //     );
  //       //   }),
  //       // );
  //     }
  //   } catch (e) {
  //     print("Do Something When Error Occurs");
  //   }
  // }

  // late String _profile_finder_id;
  // List<MyComplaintsAndReplies> ComplaintsAndReplies = [];

  // _fetchComplaints() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   _profile_finder_id = preferences.getString("uid2").toString();
  //   final response = await http.get(Uri.parse(
  //       "http://${ApiService.ipAddress}/my_complaints/$_profile_finder_id"));
  //   final data = jsonDecode(response.body) as Map;
  //   final id = data.keys.first;
  //   for (final pi in data[id]) {
  //     ComplaintsAndReplies.add(MyComplaintsAndReplies.fromJson(pi));
  //   }
  // }

  // Users _users = Users();
  // bool isLoading = true;

  // late String userUid;
  // late String nameOfBrideGroom;

  // void _getallData() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   userUid = preferences.getString("uid2").toString();
  //   setState(() {
  //     userUid = preferences.getString("uid2").toString();
  //   });
  //   final response = await http
  //       .get(Uri.parse("http://${ApiService.ipAddress}/alldata/${userUid}"));
  //   var json = jsonDecode(response.body);

  //   print("statusCodeIs${response.statusCode}");

  //   if (response.statusCode == 200) {
  //     print('getdata function');
  //     _users = Users.fromJson(json);
  //     // print(response.body);
  //     setState(() {
  //       isLoading = false;
  //     });

  //     debugPrint(_users.profilePicture);
  //   } else {
  //     print("error");
  //     print(response.statusCode);
  //   }

  //   // _users= Users.fromJson(json);
  //   // setState(() {
  //   //   isLoading= false;
  //   // });
  // }

  bool _isLoading = true;

  static List<PmMyClientsModel> _pmMyClientsList = [];

  _fetchPmMyClients() async {
    print('_fetchPmMyClients function start');
    SharedPreferences preferences = await SharedPreferences.getInstance();
    profile_finder_id = preferences.getString("uid2").toString();
    print(widget.profile_manager_id_close_deal);
    final response = await http.get(Uri.parse(
        "http://${ApiService.ipAddress}/pm_my_clients/${widget.profile_manager_id_close_deal}"));
    if (response.statusCode == 200) {

      final data = jsonDecode(response.body) as Map;
      final id = data.keys.first;
      for (final pm in data[id]) {

        for (var i = 0; i <_pmMyClientsList.length; i++) {
          if (_pmMyClientsList[i].uid == PmMyClientsModel.fromJson(pm).uid.toString()) {
            null;
          }
          else{
            _pmMyClientsList.add(PmMyClientsModel.fromJson(pm));

          }
        }
        
      }
      setState(() {
        _isLoading = false;
      });
      print('_pmMyClientsList ${_pmMyClientsList[0]}');
      print(_pmMyClientsList[0].email);
      print(_pmMyClientsList[0].complaints);
      print(_pmMyClientsList[0].complaintsReplay);

      // final jsonoutput = jsonDecode(response.body);
      // print(jsonoutput);
      // // _pmMyClientsList = [
      // //   for (final data in jsonoutput) PmMyClientsModel.fromJson(data)
      // // ];
      // print(_pmMyClientsList[0].complaintsReplay);
      // // setState(() {
      // //   _isLoading1=false;
      // // });
    }

    // print(response.statusCode);
    // print(response.body);
    // final json = jsonDecode(response.body);

    // print('pmclientsTestBody ${(_pmMyClientsListTestModelFromJson(response.body))}');
    // print('pmclientsTestManager ${_pmMyClientsListTestModelFromJson(widget.profile_manager_id)}');
  }
  //

  @override
  void initState() {
    _pm_my_data_fetchData();
    // _fetchComplaints();
    _fetchPmMyClients();
    super.initState();
  }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   setState(() {
      
  //   _pmMyClientsList = [];
  //   });
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    //  return Scaffold();
    return Scaffold(
      appBar: const ClAppbarLeadGridSuffHeart(
          testingNextPage: AnswerFourtyTwoScreen()),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: 

          // _isLoading ? Center(child: CircularProgressIndicator())
          // :
          
          
          
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClProfilePictureWithCover(
                itemHeight: DeviceSize.itemHeight,
                profilePicturepath: userList[0].profilePicture.toString(),
                coverPicturepath: userList[0].profilePicture.toString(),
                name: userList[0].firstName ?? 'Ariene McCoy',

                place:
                    "${userList[0].officeCity}${',  '}${userList[0].officeCountry}",

                onPressed: () async {},
                hire: false, elevatedButtonText: 'Close Deal & Rate',
                //  onTapHirePi: () {  },
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: ColorConstant.clgreyborderColor)),
                height: DeviceSize.itemHeight * 1.5,
                width: double.maxFinite,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("Overall Task Stats"),
                    // SizedBox(
                    //   height: DeviceSize.itemHeight / 10,
                    // ),
                    CircularPercentIndicator(
                      radius: 70,
                      progressColor: Colors.green,
                      lineWidth: 7,
                      percent: 70 / 100,
                      center: const Text(
                        '70%',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      footer: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 25),
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: ColorConstant.clPurpleBorderColor,
                                    width: 2)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Notify To Complete",
                                style: TextStyle(
                                  color: ColorConstant.clPurple6,
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                            )),
                      ),
                    )
                  ],
                ),
              ),
              // Text(_pmMyClientsList.length.toString()),
              // Text(_pmMyClientsList[0].email.toString()),
              // Text(_pmMyClientsList[1].email.toString()),
              // Text(_pmMyClientsList[2].email.toString()),
              // Text(_pmMyClientsList[3].email.toString()),
              Text('Complaints'),

              ListView.builder(
                controller: ScrollController(),
                //  debugPrint(_myInvestigators.qkokamx1Qqf![0].firstName.toString());
                // itemCount: MyQuestionAndAnswer.privateInvestigatorCollection.length,
                itemCount: _pmMyClientsList.length,
                shrinkWrap: true,
                itemBuilder: ((context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return WhereIsTheSanFourtyThreeScreen(
                            private_investicator_id:
                                widget.profile_manager_id_close_deal,
                          );
                        }),
                      );
                    },
                    child: ListTile(
                      leading: Text(index.toString()),
                      title: Text(_pmMyClientsList[index].complaints.toString(),),
                      subtitle: Text(_pmMyClientsList[index].complaintsReplay .toString(),
                       style: TextStyle(
              color: ColorConstant.clPurpleFontColor,
              // fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
                      ),
                      trailing:  Container(
              decoration: BoxDecoration(
                  border: const Border.fromBorderSide(BorderSide.none),
                  color: ColorConstant.whiteA700,
                  shape: BoxShape.circle),
              height: 20,
              width: 20,
              child: Checkbox(
                // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,

                value: _pmMyClientsList[index].complaintsReplay == 'Empty' ? false : true,
                onChanged: (value) {},
                //  side: BorderSide.none,
                shape: const CircleBorder(side: BorderSide.none),
                side: const BorderSide(color: Colors.green),
                activeColor: Colors.green,
                // checkColor: Colors.black,
              ),
            ),
                      
                      
                      
                      
                      
                      //  CustomClCheckboxWithQuestionWidget(
                      //   question: _pmMyClientsList[index].complaints.toString(),
                      //   // 'where is the San Sebastian home? and she completed here graduation?',
                      //   completed: true,
                      //   answer:
                      //       _pmMyClientsList[index].complaintsReplay.toString(),
                      // ),
                    ),
                  );
                }),
              ),
              SizedBox(
                height: DeviceSize.itemHeight / 2,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: MyElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return WriteYourComplaintPfScreen(
                    profile_manager_id_ques:
                        widget.profile_manager_id_close_deal,
                  );
                }),
              );
            },
            borderRadius: BorderRadius.circular(10),
            backgroundColor: Colors.transparent,
            // gradient: LinearGradient(
            //     begin: Alignment(0, 0.56),
            //     end: Alignment(1, 0.56),
            //     colors: [ColorConstant.indigo500, ColorConstant.purpleA100]),
            child: const Text(
              '\u002b Add New Complaint',
              style: TextStyle(color: Colors.white),
            )),
      ),
    );
  }
}

// gradient: LinearGradient(begin: Alignment(0, 0.56), end: Alignment(1, 0.56), colors: [
//                                                                                 ColorConstant.indigo500,
//                                                                                 ColorConstant.purpleA100
//                                                                               ])
