import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:profile_finder/core/utils/color_constant.dart';
import 'package:profile_finder/model_final/model_final.dart';
import 'package:profile_finder/presentation/1ProfileFinder/MatchingList/1screen_advertisement.dart';
import 'package:profile_finder/routes/app_routes.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/ClCustomWidgets2.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/CustomWidgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NineteenGeneralDetails extends StatefulWidget {
  @override
  State<NineteenGeneralDetails> createState() => _NineteenGeneralDetailsState();
}

class _NineteenGeneralDetailsState extends State<NineteenGeneralDetails> {
  List<String> generalDetailsTitleItems = [
    "Height(cm)",
    "Weight(kg)",
    "Age",
    "Blood Type",
    "Marital Status",
    "Religion",
    "Email",
    "Phone",
    "Education & Qualification",
    "Profession",
    "Orphan",
  ];

  Future updateGeneralDetails() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    uidUser = preferences.getString("uid2").toString();

    print("uid is $uidUser ");

    final url =
        Uri.parse("http://${ApiService.ipAddress}/about_candidate/$uidUser");
    final request = http.MultipartRequest('POST', url);
    //  request.files
    //     .add(await http.MultipartFile.fromPath('files', "headsizeFile!.path"));
    // request.fields['height'] = preferences.getString("height").toString();
    // request.fields['weight'] = preferences.getString("weight").toString();
    // request.fields['age'] = preferences.getString("age").toString();
    // request.fields['blood_group'] =
    //     preferences.getString("blood_group").toString();
    // request.fields['marital_status'] =
    //     preferences.getString("marital_status").toString();
    // request.fields['religion'] = preferences.getString("religion").toString();
    // request.fields['primary_email'] =
    //     preferences.getString("contact_email").toString();
    // request.fields['primary_phone_number'] =
    //     preferences.getString("contact_phone").toString();
    // request.fields['education_course'] =
    //     preferences.getString("education_course").toString();
    // request.fields['profession'] =
    //     preferences.getString("profession").toString();
    // request.fields['orphan'] = preferences.getString("orphan").toString();

    request.fields['about_candidate'] = "prefe";

// request.fields['height'] = "12";
//     request.fields['weight'] = "13";
//     request.fields['age'] = "55";
//     request.fields['blood_group'] =
//         "preferences";
//     request.fields['marital_status'] =
//        "preferences";
//     request.fields['religion'] = "preferences";
//     request.fields['primary_email'] =
//        "preferences";
//     request.fields['primary_phone_number'] =
//         "preferences";
//     request.fields['education_school'] =
//        "preferences";
//     request.fields['profession'] =
//         "preferences";
//     request.fields['orphan'] = "preferences";

    try {
      final send = await request.send();
      final response = await http.Response.fromStream(send);
      print(response.statusCode);
      print(response.body);
      print("height ${preferences.getString("height")}");
      print("weight  ${preferences.getString("weight")}");
      print("age ${preferences.getString("age")}");
      print("blood_group ${preferences.getString("blood_group")}");
      print("marital_status  ${preferences.getString("marital_status")}");
      print("religion ${preferences.getString("religion")}");

      if (response.statusCode == 200) {
        Fluttertoast.showToast(
          msg: "General Details Uploaded Successfully...!",
          backgroundColor: ColorConstant.deepPurpleA200,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_SHORT,
        );
        // Future.delayed(const Duration(seconds: 10), () {});
        // Navigator.pushNamed(context, AppRoutes.FourteenScreenscr);
      }
    } catch (e) {
      print("Error While UploadingFile$e");
    }
  }

  bool isLoadingGetData = true;

  Users _users = Users();

  late String uidUser;
  late String nameOfBrideGroom;

  void getData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    uidUser = preferences.getString("uid2").toString();
    setState(() {
      nameOfBrideGroom = preferences.getString("nameOfBrideGroom").toString();
    });
    final response = await http
        .get(Uri.parse("http://${ApiService.ipAddress}/alldata/$uidUser"));
    var json = jsonDecode(response.body);

    print("statusCodeIs${response.statusCode}");

    if (response.statusCode == 200) {
      _users = Users.fromJson(json);
      print(response.body);
      setState(() {
        isLoadingGetData = false;
      });
    } else {
      print("error");
      print(response.statusCode);
    }

    // _users= Users.fromJson(json);
    // setState(() {
    //   isLoading= false;
    // });
  }

  @override
  void initState() {
    // TODO: implement initState
    // getData();
    getData();

    super.initState();
  }

  bool buttomClicked = false;

  saveToSharedPrefferences(String nameOfID, String valueToSave) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setString(nameOfID, valueToSave);
  }

  Future<String> dataFromSharedPrefferences(String nameOfID) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    return preferences.getString(nameOfID).toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorConstant.whiteA700,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: ColorConstant.black900,
                size: 16,
              )),
          actions: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.TwentyFamilyDetailsscr);
              },
              child: Row(
                children: [
                  SvgPicture.asset('assets/images/img_heartline.svg'),
                  SvgPicture.asset('assets/images/img_notification.svg'),
                  SizedBox(
                    width: 20,
                  )
                ],
              ),
            )
          ],
          elevation: 0,
        ),
        body: isLoadingGetData
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "General Details",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                        SizedBox(
                          height: 30,
                        ),

                        // GestureDetector(
                        //   onTap: () {
                        //      pickSingleFileHeadSize();
                        //   },

                        //  ] child: Text("data")),
                        //   SizedBox(height: 5,),

                        TwoTextLineAndUnderlineWidgetCl(
                          title: generalDetailsTitleItems[0],
                          cInivalue: _users.height.toString(),
                          buttonclicked: buttomClicked,
                          sharedPreffId: 'height',
                          onChanged: (value) {
                            saveToSharedPrefferences('height', value);
                            // dataFromSharedPrefferences('height');
                            print("saveToSharedPref");
                            print(
                                "saveToSharedPrefferences ${dataFromSharedPrefferences('height')}");
                            setState(() {
                              buttomClicked = !buttomClicked;
                            });
                          },
                        ),
                        TwoTextLineAndUnderlineWidgetCl(
                          title: generalDetailsTitleItems[1],
                          cInivalue: _users.weight.toString(),
                          buttonclicked: buttomClicked,
                          sharedPreffId: 'weight',
                        ),
                        TwoTextLineAndUnderlineWidgetCl(
                          title: generalDetailsTitleItems[2],
                          cInivalue: _users.age.toString(),
                          buttonclicked: buttomClicked,
                          sharedPreffId: 'age',
                        ),
                        TwoTextLineAndUnderlineWidgetCl(
                          title: generalDetailsTitleItems[3],
                          cInivalue: _users.bloodGroup.toString(),
                          buttonclicked: buttomClicked,
                          sharedPreffId: 'blood_group',
                        ),
                        TwoTextLineAndUnderlineWidgetCl(
                          title: generalDetailsTitleItems[4],
                          cInivalue: _users.maritalStatus.toString(),
                          buttonclicked: buttomClicked,
                          sharedPreffId: 'marital_status',
                        ),
                        TwoTextLineAndUnderlineWidgetCl(
                          title: generalDetailsTitleItems[5],
                          cInivalue: _users.religion.toString(),
                          buttonclicked: buttomClicked,
                          sharedPreffId: 'religion',
                        ),
                        TwoTextLineAndUnderlineWidgetCl(
                          title: generalDetailsTitleItems[6],
                          cInivalue: _users.primaryEmail.toString(),
                          buttonclicked: buttomClicked,
                          sharedPreffId: 'contact_email',
                        ),
                        TwoTextLineAndUnderlineWidgetCl(
                          title: generalDetailsTitleItems[7],
                          cInivalue: _users.primaryPhoneNumber.toString(),
                          buttonclicked: buttomClicked,
                          sharedPreffId: 'contact_phone',
                        ),
                        TwoTextLineAndUnderlineWidgetCl(
                          title: generalDetailsTitleItems[8],
                          cInivalue: _users.educationCourse.toString(),
                          buttonclicked: buttomClicked,
                          sharedPreffId: 'education_course',
                        ),
                        TwoTextLineAndUnderlineWidgetCl(
                          title: generalDetailsTitleItems[9],
                          // cInivalue: _users.profession.toString(),
                          cInivalue: _users.birthCity.toString(),

                          buttonclicked: buttomClicked,
                          sharedPreffId: 'position',
                        ),
                        TwoTextLineAndUnderlineWidgetCl(
                          title: generalDetailsTitleItems[10],
                          cInivalue: _users.orphan.toString(),
                          buttonclicked: buttomClicked,
                          sharedPreffId: 'orphan',
                        ),

                        SizedBox(
                          height: 6,
                        ),
                      ]),
                ),
              ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(20),
          child: MyElevatedButton(
            onPressed: () async {
              setState(() {
                buttomClicked = !buttomClicked;
                isLoadingGetData = true;
              });
              print("buttomClicked $buttomClicked");

              if (buttomClicked == false) {
                updateGeneralDetails();
              }

              getData();
            },
            borderRadius: BorderRadius.circular(10),
            backgroundColor: Colors.transparent,
            child: Text(
              buttomClicked ? "Update" : "Edit",
            ),
          ),
        ));
  }
}
