import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:profile_finder/core/utils/color_constant.dart';
import 'package:profile_finder/core/utils/size_utils.dart';
import 'package:profile_finder/model_final/model_final.dart';
import 'package:profile_finder/presentation/1ProfileFinder/MatchingList/1screen_advertisement.dart';
import 'package:profile_finder/presentation/1ProfileFinder/Profile/17screenContactDetails.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/CustomWidgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class TwentyFamilyDetails extends StatefulWidget {
  @override
  State<TwentyFamilyDetails> createState() => _TwentyFamilyDetailsState();
}

class _TwentyFamilyDetailsState extends State<TwentyFamilyDetails> {
  List<String> _familyDetailsTitleItems = [
    "Father Name",
    "Father Native Place*",
    "Father Job*",
    "Mother Name*",
    "Mother Native Place*",
    "Mother Job*",
    "Father Family Name*",
    "Mother Family Name*",
  ];

  static const String _title = "Family Details";

  String _email = "Please Update Email";

  String _phoneNumber = "Please Update PhoneNumber";

  String _whatsappNumber = "Please Update WhatsappNumber";

  bool _buttonClicked = false;

  static Users _users = Users();

  bool isLoading = true;

  late String uidUser;

  Future updateFamilyDetails() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    uidUser = preferences.getString("uid2").toString();

    print("uid for Update $uidUser ");

    final url =
        Uri.parse("http://${ApiService.ipAddress}/about_candidate/JJ30LIE1RVQ");
    final request = http.MultipartRequest('POST', url);
    setState(() {
      request.fields['father_name'] =
          preferences.getString(_sharedPreffId[0]).toString();
      request.fields['father_country'] =
          preferences.getString(_sharedPreffId[1]).toString();
      request.fields['father_job'] =
          preferences.getString(_sharedPreffId[2]).toString();
      request.fields['mother_name'] =
          preferences.getString(_sharedPreffId[3]).toString();
      request.fields['mother_country'] =
          preferences.getString(_sharedPreffId[4]).toString();
      request.fields['mother_job'] =
          preferences.getString(_sharedPreffId[5]).toString();
      request.fields['father_family_name'] =
          preferences.getString(_sharedPreffId[6]).toString();
      request.fields['mother_family_name'] =
          preferences.getString(_sharedPreffId[7]).toString();
    });

    print(preferences.getString(_sharedPreffId[0]).toString());
    print(preferences.getString(_sharedPreffId[1]).toString());
    print(preferences.getString(_sharedPreffId[2]).toString());
    print(preferences.getString(_sharedPreffId[3]).toString());
    print(preferences.getString(_sharedPreffId[4]).toString());

    try {
      final send = await request.send();
      final response = await http.Response.fromStream(send);
      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        Fluttertoast.showToast(
          msg: "Family Details Updated Successfully...!",
          backgroundColor: ColorConstant.deepPurpleA200,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_SHORT,
        );
        // getDataFamilyDetails();
        // Navigator.push(context,MaterialPageRoute(builder: (context) =>TwentyFamilyDetails()));
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) => super.widget));
        print("Family Details Updated ${_users.fatherName}");
        // Future.delayed(const Duration(seconds: 10), () {});
        // Navigator.pushNamed(context, AppRoutes.FourteenScreenscr);
      }
    } catch (e) {
      print("Error While Uploading$e");
    }
  }

  getDataFamilyDetails() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    uidUser = preferences.getString("uid2").toString();
    final response = await http
        .get(Uri.parse("http://${ApiService.ipAddress}/alldata/JJ30LIE1RVQ"));
    var json = await jsonDecode(response.body);

    print("statusCodeIs ${response.statusCode}");

    if (response.statusCode == 200) {
      setState(() {
        _users = Users.fromJson(json);
      });

      // Future.delayed(const Duration(seconds: 3)).then((value) => setState(() {
      //       isLoading = false;
      //     }));

      print(response.body);
      print("Family Details Retrieved");
      setState(() {
        isLoading = false;
      });

      //     setState(() {
      //      fatherName=  _users.fatherName.toString();
      //  fatherCountry= _users.fatherCountry.toString();
      //  fatherJob= _users.fatherJob.toString();
      //  motherName =  _users.motherName.toString();
      // motherCountry =   _users.motherCountry.toString();
      //  motherJob = _users.motherJob.toString();
      // fatherCity =  _users.fatherCity.toString();
      //  motherCity =  _users.motherCity.toString();

      //     });
    } else {
      print("error");
      print(response.statusCode);
    }
  }

//  late String fatherName ;
//  late String fatherCountry ;
//  late String  fatherJob;
//  late String  motherName;
//  late String  motherCity;
//  late String  motherJob;
//  late String  fatherCity;
//  late String  motherCountry;

  @override
  void initState() {
    getDataFamilyDetails();
    super.initState();
  }

  static List<String> familyDetailsSubTitleItems = [
    "Thomas Agustin",
    "Kochi. Kerala",
    "Bank Manager",
    "Any James",
    "Thomas Agustin",
    "Kochi. Kerala",
    "Bank Manager",
    "Any James",
  ];

  List<dynamic> _modelDatafromApi = [
    _users.fatherName.toString(),
    _users.fatherCountry.toString(),
    _users.fatherJob.toString(),
    _users.motherName.toString(),
    _users.motherCountry.toString(),
    _users.motherJob.toString(),
    _users.fatherFamilyName.toString(),
    _users.motherFamilyName.toString()
  ];

  //  List<dynamic> _modelDatafromApi = [

  //  fatherName,
  //   fatherCity,
  //   "fatherJob",
  //   "motherName",
  //   "motherCity",
  //   "motherJob",
  //   "fatherCity",
  //   "motherCity"
  // ];

  List<String> _sharedPreffId = [
    "father_name",
    "father_country",
    "father_job",
    "mother_name",
    "mother_country",
    "mother_job",
    "father_family_name",
    "mother_family_name"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        appBar: ClAppbarLeadGridSuffHeart(
            testingNextPage: SeventeenContactDetails()),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        _title,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                      const D10HCustomClSizedBoxWidget(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          //
                          //

                          SizedBox(
                            height: DeviceSize.screenHeight,
                            child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: _sharedPreffId.length,
                                itemBuilder: ((context, index) {
                                  return _buttonClicked
                                      ? TextndTextForm(
                                          iniValueTextForm:
                                              _modelDatafromApi[index],
                                          name: _familyDetailsTitleItems[index],
                                          idSharePreff: _sharedPreffId[index],
                                        )
                                      : TwoTextLineAndUnderlineNoButtonClickedWidgetCl(
                                          title:
                                              _familyDetailsTitleItems[index],
                                          // cInivalue: _users.fatherCountry.toString(),
                                          cInivalue: _modelDatafromApi[index],

                                          sharedPreffId: _sharedPreffId[index],
                                          userM: _users,
                                        );
                                })),
                          ),

                          const D10HCustomClSizedBoxWidget(
                            height: 50,
                          ),
                        ],
                      ),
                    ],
                  ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(20),
          child: MyElevatedButton(
            onPressed: () async {
              setState(() {
                _buttonClicked = !_buttonClicked;
                // isLoading = true;
              });
              print("Button $_buttonClicked");
              if (_buttonClicked == false) {
                updateFamilyDetails();
              }
              // setState(() {
              //   isLoading = true;
              // });
              // getDataFamilyDetails();
            },
            borderRadius: BorderRadius.circular(10),
            backgroundColor: Colors.transparent,
            child: Text(
              _buttonClicked ? "Update" : "Edit",
            ),
          ),
        ));
  }
}

/*
*/

class TextndTextForm extends StatefulWidget {
  final String name;

  final String iniValueTextForm;
  final String idSharePreff;

  const TextndTextForm(
      {super.key,
      required this.iniValueTextForm,
      required this.name,
      required this.idSharePreff});

  @override
  State<TextndTextForm> createState() => _TextndTextFormState();
}

class _TextndTextFormState extends State<TextndTextForm> {
  late String storeLocal;
  saveToSharedPrefferences(String nameOfID, String valueToSave) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    await preferences.setString(nameOfID, valueToSave);
  }

  String hintFromSharedPreff = "Select";

  valueFromSharedPrefferences(String nameOfID) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() async {
      hintFromSharedPreff = await preferences.getString(nameOfID).toString();
    });

    hintFromSharedPreff = await preferences.getString(nameOfID).toString();
// return hintFromSharedPreff;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.name),
        const SizedBox(
          height: 5,
        ),
        Container(
          // height: DeviceSize.screenHeight - 150,
          decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8)),
          child: TextFormField(
            initialValue: widget.iniValueTextForm,
            style: const TextStyle(
              fontSize: 15,
            ),
            onChanged: (value) {
              setState(() async {
                storeLocal = value;
                // await saveToSharedPrefferences(value, widget.idSharePreff);
                // await valueFromSharedPrefferences(widget.idSharePreff);
                // print("sharedPref Value $hintFromSharedPreff");
                await PreferenceMS.saveInfo(widget.idSharePreff, value);

                //  TwentyFamilyDetails().

                //  familyDetailsSubTitleItems[0]=value;
              });
            },
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(10),
              border: InputBorder.none,
            ),
          ),
        ),
        const D10HCustomClSizedBoxWidget(),
      ],
    );
  }
}

class TextndTextFormList extends StatefulWidget {
  final String name;

  final String iniValueTextForm;
  final String idSharePreff;

  const TextndTextFormList(
      {super.key,
      required this.iniValueTextForm,
      required this.name,
      required this.idSharePreff});

  @override
  State<TextndTextFormList> createState() => _TextndTextFormListState();
}

class _TextndTextFormListState extends State<TextndTextFormList> {
  late String storeLocal;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.name),
        const SizedBox(
          height: 5,
        ),
        Container(
          // height: DeviceSize.screenHeight - 150,
          decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8)),
          child: TextFormField(
            initialValue: widget.iniValueTextForm,
            style: const TextStyle(
              fontSize: 15,
            ),
            onChanged: (value) {
              setState(() async {
                storeLocal = value;
                // await saveToSharedPrefferences(value, widget.idSharePreff);
                // await valueFromSharedPrefferences(widget.idSharePreff);
                // print("sharedPref Value $hintFromSharedPreff");
                await PreferenceMS.savelistInfo(widget.idSharePreff, value);

                //  TwentyFamilyDetails().

                //  familyDetailsSubTitleItems[0]=value;
              });
            },
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(10),
              border: InputBorder.none,
            ),
          ),
        ),
        const D10HCustomClSizedBoxWidget(),
      ],
    );
  }
}

class TwoTextLineAndUnderlineNoButtonClickedWidgetCl extends StatefulWidget {
  const TwoTextLineAndUnderlineNoButtonClickedWidgetCl(
      {super.key,
      required this.title,
      required this.cInivalue,
      required this.sharedPreffId,
      this.onChanged,
      required this.userM});

  final String title;
  final String cInivalue;
  final String sharedPreffId;
  final Users userM;
  final onChanged;

  //  OnChanged onChanged;

  @override
  State<TwoTextLineAndUnderlineNoButtonClickedWidgetCl> createState() =>
      _TwoTextLineAndUnderlineNoButtonClickedWidgetClState();
}

class _TwoTextLineAndUnderlineNoButtonClickedWidgetClState
    extends State<TwoTextLineAndUnderlineNoButtonClickedWidgetCl> {
  saveToSharedPrefferences(String nameOfID, String valueToSave) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setString(nameOfID, valueToSave);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(
            fontSize: 11,
          ),
        ),

        SizedBox(
          height: 3,
        ),

        Text(
          widget.cInivalue.toString(),
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
        ),

        D10HCustomClSizedBoxWidget(
          height: 50,
        ),
        Divider(),
        // widget.buttonclicked ? SizedBox() : Divider(),
        D10HCustomClSizedBoxWidget(
          height: 50,
        ),
      ],
    );
  }
}

class PreferenceMS {
  static Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  static String returnData = "Default";
  static saveInfo(dynamic idSharedPre, dynamic dataToSave) async {
    SharedPreferences pref = await _prefs;
    pref
        .setString(idSharedPre, dataToSave)
        .then((value) => print('father_name Value Saved : $value'));
  }

  static savelistInfo(dynamic idSharedPre, dynamic dataToSave) async {
    SharedPreferences pref = await _prefs;
    pref
        .setStringList(idSharedPre, dataToSave)
        .then((value) => print('$dataToSave Value Saved : $value'));
  }

  static Future<bool> getDataFromSharedPrefMS(dynamic idShared) async {
    SharedPreferences pref = await _prefs;

    returnData = pref.getString(idShared).toString();

    return pref.getString(idShared) != null;
  }
}

/*
*******CorrectRunning Code********
class PreferenceMS {
  static Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  static saveLoginInfo( dynamic verifyUserLoginResult) async {
    SharedPreferences pref = await _prefs;
    pref
        .setString("father_name", verifyUserLoginResult)
        .then((value) => print('father_name Value Saved : $value'));
  }

  static Future<bool> isLoggedIn() async {
    SharedPreferences pref = await _prefs;
    return pref.getString("user_login") != null;
  }
}
*/
