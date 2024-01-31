import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;
import 'package:profile_finder/core/utils/color_constant.dart';
import 'package:profile_finder/core/utils/size_utils.dart';
import 'package:profile_finder/model_final/model_final.dart';
import 'package:profile_finder/presentation/1ProfileFinder/MatchingList/1screen_advertisement.dart';
import 'package:profile_finder/presentation/1ProfileFinder/PrivateInvestigator/WhereIsTheSanFourtyThreeScreen.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/CustomWidgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FifteenAboutMe extends StatefulWidget {
  @override
  State<FifteenAboutMe> createState() => _FifteenAboutMeState();
}

class _FifteenAboutMeState extends State<FifteenAboutMe> {
  String title = "About Me";

  String aboutMee = "Please Update";

  bool buttomClicked = false;
  Users _users = Users();
  bool isLoading = true;

  late String uidUser;

  Future updateAboutDetails() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    uidUser = preferences.getString("uid2").toString();

    print("uid for Update $uidUser ");

    final url =
        Uri.parse("http://${ApiService.ipAddress}/about_candidate/$uidUser");
    final request = http.MultipartRequest('POST', url);
    //  request.files
    //     .add(await http.MultipartFile.fromPath('files', "headsizeFile!.path"));
    // request.fields['about_candidate_value'] = "aboutMee";
    request.fields['about_candidate'] = aboutMee;

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
        getDataAboutcandidate();
        print("about candidate ${_users.aboutCandidate}");
        // Future.delayed(const Duration(seconds: 10), () {});
        // Navigator.pushNamed(context, AppRoutes.FourteenScreenscr);
      }
    } catch (e) {
      print("Error While Uploading$e");
    }
  }

  void getDataAboutcandidate() async {
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
        // aboutMee = _users.aboutCandidate;
      });
    } else {
      print("error");
      print(response.statusCode);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    // getData();
    getDataAboutcandidate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        appBar: ClAppbarLeadArrowBackSuffNo(
          title: '',
            // testingNextPage: WhereIsTheSanFourtyThreeScreen(private_investicator_id: '',)
            ),
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
                        "About Me",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buttomClicked
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
                                    initialValue: _users.aboutCandidate,
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        aboutMee = value;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      isDense: true,
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                )
                              : Text(
                                  _users.aboutCandidate.toString(),
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
                buttomClicked = !buttomClicked;
              });
              if (buttomClicked == false) {
                updateAboutDetails();
              }
            },
            borderRadius: BorderRadius.circular(10),
            backgroundColor: Colors.transparent,
            child: Text(
              buttomClicked ? "Update" : "Edit",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ));
  }
}
