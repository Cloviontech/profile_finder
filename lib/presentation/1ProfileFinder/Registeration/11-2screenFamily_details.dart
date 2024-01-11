import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:profile_finder/core/utils/color_constant.dart';
import 'package:profile_finder/core/utils/size_utils.dart';
import 'package:profile_finder/presentation/1ProfileFinder/MatchingList/1screen_advertisement.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/CustomWidgetTextformfieldWithSuffixicon.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/WidgetTitleAndDropdown.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/WidgetTitleAndTextfield.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

import '../../../model_final/model_final.dart';

class Thirteen_Screen_Family_DetailsScreen extends StatefulWidget {
  @override
  State<Thirteen_Screen_Family_DetailsScreen> createState() =>
      _Thirteen_Screen_Family_DetailsScreenState();
}

class _Thirteen_Screen_Family_DetailsScreenState
    extends State<Thirteen_Screen_Family_DetailsScreen> {
  String? valueChoose;

  List<String> _dropdownItemList = ["Item One", "Item Two", "Item Three"];

  List<String> _dropdownItemListtwo = ["Item One", "Item Two", "Item Three"];

  int? _siblingYounger = 1;
  //
  //
  List<String> familyStatus = [
    "Lower Middle Class",
    "Middle Class",
    "Upper Middle class",
    "Higher class",
  ];

  saveToSharedPrefferences(String nameOfID, String valueToSave) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setString(nameOfID, valueToSave);
  }

  List<String> countryChoose = ["India", "USA", "UK", "Canada", "Sri Lanka"];

  List<String> stateChoose = [
    "Tamilnadu",
    "Kerala",
    "Karnataka",
    "AndhraPradesh"
  ];

  List<String> cityChoose = ["Chennai", "Delhi", "Mumbai", "Kolkatta"];

  List<String> occupationChoose = [
    "Doctor",
    "Engineer",
    "Government Job",
    "Teacher"
  ];

  List<String> typeOfRelation = [
    "Father",
    "Mother",
    "Brother",
    "Sister",
    "Uncle",
    "Cousin"
  ];

  List<String> maritalSts = ["Single", "Married", "Divorced", "Widow"];

  late String uidUser;

  //
  //

  Future uploadDataFamilyDetails() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    uidUser = preferences.getString("uid2").toString();

    print("uid is $uidUser ");

    final url =
        Uri.parse("http://${ApiService.ipAddress}/familydetails/$uidUser");
    final request = http.MultipartRequest('POST', url);

    /*
    request.fields['family_status'] =
        preferences.getString("family_status_value").toString();

    request.fields['father_name'] =
        preferences.getString("family_status_value").toString();
    request.fields['father_country'] =
        preferences.getString("family_status_value").toString();
    request.fields['father_city'] =
        preferences.getString("father_city_value").toString();
    '';
    request.fields['father_job'] =
        preferences.getString("father_job_value").toString();
    request.fields['father_family_name'] =
        preferences.getString("father_family_name").toString();
    request.fields['mother_name'] =
        preferences.getString("mother_name_value").toString();
    request.fields['mother_country'] =
        preferences.getString("mother_country_value").toString();
    request.fields['mother_city'] =
        preferences.getString("mother_city_value").toString();
    request.fields['mother_job'] =
        preferences.getString("mother_job_value").toString();
    request.fields['mother_family_name'] =
        preferences.getString("mother_family_name").toString();
    request.fields['sibling_name'] =
        preferences.getString("sibling_name_value").toString();
    request.fields['sibling_relation'] =
        preferences.getString("sibling_relation_value").toString();
    request.fields['sibling_young_or_old'] =
        preferences.getString("sibling_young_or_old_value").toString();
    request.fields['sibling_occupation'] =
        preferences.getString("sibling_occupation_value").toString();
    request.fields['sibling_marital'] =
        preferences.getString("sibling_marital_value").toString();
    request.fields['sibling_email'] =
        preferences.getString("sibling_email_value").toString();
    request.fields['sibling_dob'] =
        preferences.getString("sibling_dob_value").toString();
    request.fields['sibling_job'] =
        preferences.getString("sibling_job_value").toString();
    request.fields['about_candidate'] =
        preferences.getString("about_candidate_value").toString();
    request.fields['current_status'] =
        preferences.getString("current_status_value").toString();
        */

        request.fields['family_status'] ='middle';
       

    request.fields['father_name'] = 'fatherr';
       
    request.fields['father_country'] = 'india';  preferences.getString("family_status_value").toString();
    request.fields['father_city'] = 'chennai'
       
    '';
    request.fields['father_job'] ='doctor';
       
    request.fields['father_family_name'] = 'appa';
        
    request.fields['mother_name'] = 'motherr';
        
    request.fields['mother_country'] = 'malasiya';
       
    request.fields['mother_city'] = 'hongknk';
        
    request.fields['mother_job'] = 'teacher';
        
    request.fields['mother_family_name'] = 'amma';
       
    request.fields['sibling_name'] = 'siblingg';
       
    request.fields['sibling_relation'] ='bro';
        
    request.fields['sibling_young_or_old'] ='young';
       
    request.fields['sibling_occupation'] = 'eng';
       
    request.fields['sibling_marital'] = 'single';
       
    request.fields['sibling_email'] = 'bro@gmail.com';
         request.fields['sibling_dob'] = '05/06/2000';
         request.fields['sibling_job'] = 'engg';
         request.fields['about_candidate'] ='good';
      request.fields['current_status'] = 'working';
       


    try {
      final send = await request.send();
      final response = await http.Response.fromStream(send);
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        // Navigator.pushNamed(context, AppRoutes.FourteenScreenscr);
        Fluttertoast.showToast(
          msg: "Family Deatails Uploaded Successfully...!",
          backgroundColor: ColorConstant.deepPurpleA200,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_SHORT,
        );
      }
    } catch (e) {
      print("Error While UploadingFile$e");
    }
  }


    Users _users = Users();
  bool isLoading = true;

  void getData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    uidUser = preferences.getString("uid2").toString();

    final response = await http
        .get(Uri.parse("http://${ApiService.ipAddress}/alldata/$uidUser"));
    var json = jsonDecode(response.body);

    print("statusCodeIs${response.statusCode}");

    if (response.statusCode == 200) {
      _users = Users.fromJson(json);
      print(response.body);
      setState(() {
        isLoading = false;
      });
    } else {
      print("error");
      print(response.statusCode);
      setState(() {
        isLoading = false;
      });
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
    // getUid();
    getData();
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 65),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Center(
                  child: Text(
                    'Family Details',
                    // textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),

                // D10HCustomClSizedBoxWidget(
                //   height: 1.5,
                // ),

                WidgetTitleAndDropdown(
                  DdbTitle: "Family Status*",
                  DdbHint: "Select",
                  DbdItems: familyStatus,
                  onChanged: (newValue) {
                    saveToSharedPrefferences("family_status_value", newValue);
                  },
                ),
                Text(
                  "Father's Details",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                D10HCustomClSizedBoxWidget(),

                WidgetTitleAndTextfield(
                  textFieldHint: 'Enter',
                  textFieldTitle: "Father's Name*",
                  onChanged: (newValue) {
                    saveToSharedPrefferences("father_name_value", newValue);
                  },
                ),
                WidgetTitleAndDropdown(
                  DdbTitle: "Father's Birth Country*",
                  DdbHint: "Select",
                  DbdItems: countryChoose,
                  onChanged: (newValue) {
                    saveToSharedPrefferences("father_country_value", newValue);
                  },
                ),
                WidgetTitleAndDropdown(
                  DdbTitle: "Family Status*",
                  DdbHint: "Select",
                  DbdItems: familyStatus,
                  onChanged: (newValue) {
                    saveToSharedPrefferences("father_family_name", newValue);
                  },
                ),
                WidgetTitleAndDropdown(
                  DdbTitle: "City*",
                  DdbHint: "Select",
                  DbdItems: cityChoose,
                  onChanged: (newValue) {
                    saveToSharedPrefferences("cityChoose", newValue);
                  },
                ),
                D10HCustomClSizedBoxWidget(),

                Text(
                  "Mother's Details",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                D10HCustomClSizedBoxWidget(),

                WidgetTitleAndTextfield(
                  textFieldHint: 'Enter',
                  textFieldTitle: "Mother's Name*",
                  onChanged: (newValue) {
                    saveToSharedPrefferences("mother_name_value", newValue);
                  },
                ),
                WidgetTitleAndDropdown(
                  DdbTitle: "Mother's Birth Country*",
                  DdbHint: "Select",
                  DbdItems: countryChoose,
                  onChanged: (newValue) {
                    saveToSharedPrefferences("mother_country_value", newValue);
                  },
                ),

                WidgetTitleAndDropdown(
                  DdbTitle: "City*",
                  DdbHint: "Select",
                  DbdItems: cityChoose,
                  onChanged: (newValue) {
                    saveToSharedPrefferences("mother_city_value", newValue);
                  },
                ),

                WidgetTitleAndDropdown(
                  DdbTitle: "Mother's Job*",
                  DdbHint: "Select",
                  DbdItems: occupationChoose,
                  onChanged: (newValue) {
                    saveToSharedPrefferences("mother_job_value", newValue);
                  },
                ),

                D10HCustomClSizedBoxWidget(),

                Text(
                  "Sibling's Details",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                D10HCustomClSizedBoxWidget(),

                WidgetTitleAndTextfield(
                  textFieldHint: 'Enter',
                  textFieldTitle: "Full Name*",
                  onChanged: (newValue) {
                    saveToSharedPrefferences("sibling_name_value", newValue);
                  },
                ),

                WidgetTitleAndDropdown(
                  DdbTitle: "Type of Relation*",
                  DdbHint: "Select",
                  DbdItems: typeOfRelation,
                  onChanged: (newValue) {
                    saveToSharedPrefferences(
                        "sibling_relation_value", newValue);
                  },
                ),
                //   WidgetTitleAndTextfield(
                //   textFieldHint: 'Enter',
                //   textFieldTitle: "Email ID*",
                //   onChanged: (newValue) {
                //     saveToSharedPrefferences("sibling_email_value", newValue);
                //   },
                // ),

                Row(
                  children: [
                    Radio(
                        value: 1,
                        groupValue: _siblingYounger,
                        onChanged: (value) {
                          setState(() {
                            _siblingYounger = value as int;
                            saveToSharedPrefferences(
                                "sibling_young_or_old_value",
                                _siblingYounger == 1 ? "Younger" : "Older");
                          });
                        }),
                    const SizedBox(
                      width: 2,
                    ),
                    const Text("Younger")
                  ],
                ),
                Row(
                  children: [
                    Radio(
                        value: 2,
                        groupValue: _siblingYounger,
                        onChanged: (value) {
                          setState(() {
                            _siblingYounger = value as int;
                          });
                          saveToSharedPrefferences("youngerOrElder",
                              _siblingYounger == 2 ? "Older " : "Younger");
                        }),
                    const SizedBox(
                      width: 2,
                    ),
                    const Text("Older")
                  ],
                ),

                WidgetTitleAndDropdown(
                  DdbTitle: "Occupation*",
                  DdbHint: "Select",
                  DbdItems: occupationChoose,
                  onChanged: (newValue) {
                    saveToSharedPrefferences(
                        "sibling_occupation_value", newValue);
                  },
                ),

                WidgetTitleAndDropdown(
                  DdbTitle: "Marital Status*",
                  DdbHint: "Select",
                  DbdItems: maritalSts,
                  onChanged: (newValue) {
                    saveToSharedPrefferences("sibling_marital_value", newValue);
                  },
                ),

                WidgetTitleAndTextfield(
                  textFieldHint: 'Enter',
                  textFieldTitle: "Email ID*",
                  onChanged: (newValue) {
                    saveToSharedPrefferences("sibling_email_value", newValue);
                  },
                ),

                // WidgetTitleAndTextfield(
                //   textFieldHint: 'YYYY:MM:DD',
                //   textFieldTitle: "DOB*",
                //   onChanged: (newValue) {
                //     saveToSharedPrefferences("sibling_dob_value", newValue);
                //   },
                // ),
                // 
                 WidgetTitleAndTextfieldSuffixCalendar(
                      textFieldHint: _users.dob.toString() == "null"
                          ? 'YYYY-MM-DD'
                          : _users.dob
                              .toString()
                              .substring(0, _users.dob.toString().length - 12),
                      textFieldTitle: "Date of Birth*",
                      suffixIcon: Icon(Icons.calendar_today),
                      onChanged: (newValue) {
                        saveToSharedPrefferences(
                            "dateofBirthPrimary", newValue);
                      },
                    ),

                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Add More",
                    style: TextStyle(color: Colors.blue.shade700),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      minimumSize: Size(width, 50),
                      elevation: 0,
                      side: const BorderSide(width: 1, color: Colors.blue),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                ),

                CustomWidgetTextformfieldWithSuffixicon(
                  name: "About Candidates",
                  fontWeight: FontWeight.w700,
                  onChangedd: (p0) async {
                    SharedPreferences preferences =
                        await SharedPreferences.getInstance();

                    preferences.setString("about_candidate_value", p0);
                  },
                ),

                CustomWidgetTextformfieldWithSuffixicon(
                  name: "Current Status",
                  fontWeight: FontWeight.w700,
                  onChangedd: (p0) async {
                    SharedPreferences preferences =
                        await SharedPreferences.getInstance();

                    preferences.setString("current_status_value", p0);
                  },
                ),
                D10HCustomClSizedBoxWidget(),

                // MyElevatedButton(
                //     onPressed: uploadDataFamilyDetails,
                //     // () {
                //       // Navigator.push(context, MaterialPageRoute(builder: (context) {
                //       //   return HappyCouplesPackagesThirtySixScreen();
                //       // }));
                //     // },
                //     child: const Text('Ok'),
                //     borderRadius: BorderRadius.circular(10),
                //     backgroundColor: Colors.transparent,
                //     width: double.maxFinite
                //   ),

                const SizedBox(
                  height: 100,
                ),
              ]),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: ColorConstant.deepPurpleA200),
                      borderRadius: BorderRadius.circular(10)),
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_back,
                        color: ColorConstant.deepPurpleA200,
                      ))),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 6,
              child: Container(
                  // width: double.maxFinite,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 4),
                          blurRadius: 5.0)
                    ],
                    gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      stops: [0.0, 1.0],
                      colors: [
                        Colors.deepPurple.shade600,
                        // Colors.deepPurple.shade400,
                        Colors.deepPurple.shade200,
                      ],
                    ),
                    color: Colors.deepPurple.shade300,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextButton(
                      onPressed: () {
                        uploadDataFamilyDetails();
                        // print("Uploading Data to aws");

                        // uploadDataAbijith();

                        // Navigator.pushNamed(
                        //     context, AppRoutes.ThirteenScreenscr);
                      },
                      child: Text(
                        "Go Next",
                        style: TextStyle(color: Colors.white),
                      ))),
            ),
          ],
        ),
      ),
    );
  }

  // void _printResizeInfo(List<WidgetSizeInfo> dataList) {
  //   // ignore: avoid_print
  //   print(dataList.map((x) => '(${x.size}, ${x.percentage}%)').join(", "));
  // }
}
