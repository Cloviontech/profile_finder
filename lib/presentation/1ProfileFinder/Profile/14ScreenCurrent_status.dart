import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:profile_finder/core/utils/color_constant.dart';
import 'package:profile_finder/core/utils/size_utils.dart';
import 'package:profile_finder/model_final/model_final.dart';
import 'package:profile_finder/presentation/1ProfileFinder/MatchingList/1screen_advertisement.dart';
import 'package:profile_finder/presentation/1ProfileFinder/PrivateInvestigator/WhereIsTheSanFourtyThreeScreen.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/CustomWidgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

class SixteenCurrentStatus extends StatefulWidget {
  @override
  State<SixteenCurrentStatus> createState() => _SixteenCurrentStatusState();
}

class _SixteenCurrentStatusState extends State<SixteenCurrentStatus> {
  String title = "Current Status";

  String content = "Please Update";

  bool buttonClicked = false;
  Users _users = Users();
  bool isLoading = true;

  late String uidUser;

  Future updateCurrentStatus() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    uidUser = preferences.getString("uid2").toString();

    print("uid for Update $uidUser ");

    final url =
        Uri.parse("http://${ApiService.ipAddress}/about_candidate/$uidUser");
    final request = http.MultipartRequest('POST', url);
    //  request.files
    //     .add(await http.MultipartFile.fromPath('files', "headsizeFile!.path"));
    // request.fields['about_candidate_value'] = "aboutMee";
    request.fields['current_status '] = content;

    try {
      final send = await request.send();
      final response = await http.Response.fromStream(send);
      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        Fluttertoast.showToast(
          msg: "About Yourself Updated Successfully...!",
          backgroundColor: ColorConstant.deepPurpleA200,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_SHORT,
        );
        getDataCurrentStatus();
        print("about candidate ${_users.aboutCandidate}");
        // Future.delayed(const Duration(seconds: 10), () {});
        // Navigator.pushNamed(context, AppRoutes.FourteenScreenscr);
      }
    } catch (e) {
      print("Error While Uploading$e");
    }
  }

  void getDataCurrentStatus() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    uidUser = preferences.getString("uid2").toString();
    final response = await http
        .get(Uri.parse("http://${ApiService.ipAddress}/alldata/$uidUser"));
    var json = jsonDecode(response.body);

    print("statusCodeIs ${response.statusCode}");

    if (response.statusCode == 200) {
      _users = Users.fromJson(json);
      print(response.body);
      setState(() {
        isLoading = false;
      });
    } else {
      print("error");
      print(response.statusCode);
    }
  }

  @override
  void initState() {
    getDataCurrentStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        appBar: ClAppbarLeadGridSuffHeart(
            testingNextPage: WhereIsTheSanFourtyThreeScreen()),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: isLoading
                ? Center(child: CircularProgressIndicator())
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buttonClicked
                              ? Container(
                                  height: DeviceSize.screenHeight - 150,
                                  decoration: BoxDecoration(
                                      // color:
                                      // widget.buttonclicked
                                      //     ?
                                      //  Colors.grey.shade100,
                                      // : Colors.transparent,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: TextFormField(
                                    initialValue: _users.currentStatus,
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        content = value;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      isDense: true,
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                )
                              : Text(
                                  _users.currentStatus.toString(),
                                  style: const TextStyle(
                                      fontSize: 15, color: Colors.black),
                                ),
                          D10HCustomClSizedBoxWidget(
                            height: 50,
                          ),
                          // widget.buttonclicked ? SizedBox() : Divider(),
                          D10HCustomClSizedBoxWidget(
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
                buttonClicked = !buttonClicked;
              });
              if (buttonClicked == false) {
                updateCurrentStatus();
              }
            },
            borderRadius: BorderRadius.circular(10),
            backgroundColor: Colors.transparent,
            child: Text(
              buttonClicked ? "Update" : "Edit",
            ),
          ),
        ));
  }
}
