import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:profile_finder/core/utils/color_constant.dart';
import 'package:profile_finder/model_final/model_final.dart';
import 'package:profile_finder/presentation/1ProfileFinder/MatchingList/1screen_advertisement.dart';
import 'package:profile_finder/presentation/1ProfileFinder/Profile/17screenContactDetails.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/CustomWidgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class EighteenContactDetails extends StatefulWidget {
  const EighteenContactDetails({Key? key}) : super(key: key);

  @override
  State<EighteenContactDetails> createState() => _EighteenContactDetailsState();
}

class _EighteenContactDetailsState extends State<EighteenContactDetails> {
  static const String _title = "Other Details";

  String _email = "Please Update Email";
  String _phoneNumber = "Please Update PhoneNumber";
  String _whatsappNumber = "Please Update WhatsappNumber";

  bool _buttonClicked = false;
  Users _users = Users();
  bool isLoading = true;

  late String uidUser;

  Future updateOtherDetails() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    uidUser = preferences.getString("uid2").toString();

    print("uid for Update $uidUser ");

    final url =
        Uri.parse("http://${ApiService.ipAddress}/about_candidate/JJ30LIE1RVQ");
    final request = http.MultipartRequest('POST', url);
    request.fields['contact_phone'] = _phoneNumber.toString();
    request.fields['contact_email'] = _email.toString();
    request.fields['whatsapp '] = _whatsappNumber.toString();

    try {
      final send = await request.send();
      final response = await http.Response.fromStream(send);
      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        Fluttertoast.showToast(
          msg: "Other Details Updated Successfully...!",
          backgroundColor: ColorConstant.deepPurpleA200,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_SHORT,
        );

        print("Other Details Updated ${_users.contactEmail}");
        // Future.delayed(const Duration(seconds: 10), () {});
        // Navigator.pushNamed(context, AppRoutes.FourteenScreenscr);
      }
    } catch (e) {
      print("Error While Uploading$e");
    }
  }

  void getDataOtherDetails() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    uidUser = preferences.getString("uid2").toString();
    final response = await http
        .get(Uri.parse("http://${ApiService.ipAddress}/alldata/JJ30LIE1RVQ"));
    var json = jsonDecode(response.body);

    print("statusCodeIs ${response.statusCode}");

    if (response.statusCode == 200) {
      _users = Users.fromJson(json);
      // Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {
      //       isLoading = false;
      //     }));

      print(response.body);
      print("Other Details Retrieved");
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
    getDataOtherDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        appBar: ClAppbarLeadGridSuffHeart(
            testingNextPage: SeventeenContactDetails()),
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
                        _title,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                      D10HCustomClSizedBoxWidget(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buttonClicked
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Email ID*"),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      // height: DeviceSize.screenHeight - 150,
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade100,
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: TextFormField(
                                        initialValue: _users.contactEmail,
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                        onChanged: (value) {
                                          setState(() {
                                            _email = value;
                                          });
                                        },
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(10),
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : Row(
                                  children: [
                                    Image.asset("assets/images/Group 285.png"),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      _users.contactEmail ?? _email,
                                      style: const TextStyle(
                                          fontSize: 15, color: Colors.black),
                                    ),
                                  ],
                                ),
                          D10HCustomClSizedBoxWidget(),
                          _buttonClicked
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Phone Number*"),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      // height: DeviceSize.screenHeight - 150,
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade100,
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: TextFormField(
                                        initialValue: _users.contactPhone,
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                        onChanged: (value) {
                                          setState(() {
                                            _phoneNumber = value;
                                          });
                                        },
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(10),
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : Row(
                                  children: [
                                    Image.asset("assets/images/Group 284.png"),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      _users.contactPhone ?? _phoneNumber,
                                      style: const TextStyle(
                                          fontSize: 15, color: Colors.black),
                                    ),
                                  ],
                                ),
                          D10HCustomClSizedBoxWidget(),
                          _buttonClicked
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Whatsapp*"),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      // height: DeviceSize.screenHeight - 150,
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade100,
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: TextFormField(
                                        initialValue: _users.whatsapp,
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                        onChanged: (value) {
                                          setState(() {
                                            _whatsappNumber = value;
                                          });
                                        },
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(10),
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/whatsapp 1.png",
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      _users.whatsapp ?? _whatsappNumber,
                                      style: const TextStyle(
                                          fontSize: 15, color: Colors.black),
                                    ),
                                  ],
                                ),
                          D10HCustomClSizedBoxWidget(),

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
                _buttonClicked = !_buttonClicked;
                // isLoading = true;
              });
              print("Button $_buttonClicked");
              if (_buttonClicked == false) {
                updateOtherDetails();
              }
              setState(() {
                isLoading = true;
              });
              getDataOtherDetails();
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
