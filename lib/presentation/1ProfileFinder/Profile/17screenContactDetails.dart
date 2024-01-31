import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:profile_finder/core/utils/color_constant.dart';
import 'package:profile_finder/model_final/model_final.dart';
import 'package:profile_finder/presentation/1ProfileFinder/MatchingList/1screen_advertisement.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/CustomWidgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SeventeenContactDetails extends StatefulWidget {
  @override
  State<SeventeenContactDetails> createState() =>
      _SeventeenContactDetailsState();
}

class _SeventeenContactDetailsState extends State<SeventeenContactDetails> {
  static const String title = "Contact Details";

  String _address = "address";
  String _email = "email";
  String _phoneNumber = "phoneNumber";
  String _country = "Country";
  String _city = "City";
  String _street = "City";

  bool buttonClicked = false;
  Users _users = Users();
  bool isLoading = true;

  late String uidUser;

  Future updateContactDetails() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    uidUser = preferences.getString("uid2").toString();

    print("uid for Update $uidUser ");

    final url =
        Uri.parse("http://${ApiService.ipAddress}/about_candidate/$uidUser");
    final request = http.MultipartRequest('POST', url);
    request.fields['primary_phone_number'] = _phoneNumber;
    request.fields['primary_email'] = _email;
    request.fields['address'] = _address;
    request.fields['contact_father_city'] = _city;
    request.fields['contact_father_street'] = _street;
    request.fields['contact_father_country'] = _country;

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
        getDataContactDetails();
        print("Contact Details ${_users.contactEmail}");
        // Future.delayed(const Duration(seconds: 10), () {});
        // Navigator.pushNamed(context, AppRoutes.FourteenScreenscr);
      }
    } catch (e) {
      print("Error While Uploading$e");
    }
  }

  void getDataContactDetails() async {
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
    getDataContactDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        appBar:  ClAppbarLeadArrowBackSuffNo(
          title: '',),
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
                      D10HCustomClSizedBoxWidget(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buttonClicked
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Address*"),
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
                                        initialValue: _users.address,
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                        onChanged: (value) {
                                          setState(() {
                                            _address = value;
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
                              : Text(
                                  _users.address.toString(),
                                  style: const TextStyle(
                                      fontSize: 15, color: Colors.black),
                                ),
                          D10HCustomClSizedBoxWidget(),
                          buttonClicked
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Street*"),
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
                                        initialValue:
                                            _users.contactFatherStreet,
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                        onChanged: (value) {
                                          setState(() {
                                            _street = value;
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
                              : Text(
                                  _users.contactFatherStreet.toString(),
                                  style: const TextStyle(
                                      fontSize: 15, color: Colors.black),
                                ),
                          D10HCustomClSizedBoxWidget(),
                          buttonClicked
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Country*"),
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
                                        initialValue:
                                            _users.contactFatherCountry,
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                        onChanged: (value) {
                                          setState(() {
                                            _country = value;
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
                              : Text(
                                  _users.contactFatherCountry.toString(),
                                  style: const TextStyle(
                                      fontSize: 15, color: Colors.black),
                                ),
                          D10HCustomClSizedBoxWidget(),

                          buttonClicked
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("City*"),
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
                                        initialValue: _users.primaryPhoneNumber,
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                        onChanged: (value) {
                                          setState(() {
                                            _city = value;
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
                              : Text(
                                  _users.primaryPhoneNumber.toString(),
                                  style: const TextStyle(
                                      fontSize: 15, color: Colors.black),
                                ),
                          D10HCustomClSizedBoxWidget(),

                          buttonClicked
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("PhoneNumber"),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Colors.grey.shade100,
                                      ),
                                      child: IntlPhoneField(
                                        flagsButtonPadding:
                                            const EdgeInsets.only(
                                                top: 20, left: 10),
                                        dropdownIconPosition:
                                            IconPosition.trailing,
                                        decoration: const InputDecoration(
                                          counterText: null,
                                          contentPadding: EdgeInsets.only(
                                            top: 40,
                                          ),
                                          isDense: false,
                                          labelText: '',
                                          border: InputBorder.none,
                                        ),
                                        initialCountryCode: 'IN',
                                        onChanged: (phone) {
                                          // print(phone.completeNumber);
                                          _phoneNumber = phone.toString();
                                        },
                                      ),
                                    )
                                    // Row(
                                    //   mainAxisSize: MainAxisSize.min,
                                    //   children: [
                                    //     // SizedBox(width: 5,),
                                    //     Expanded(
                                    //       flex: 3,
                                    //       child: Container(
                                    //           width: 100,
                                    //           height: 50,
                                    //           decoration: BoxDecoration(
                                    //             color: Colors.grey.shade100,
                                    //             borderRadius:
                                    //                 BorderRadius.circular(8)),
                                    //           child: IntlPhoneField(
                                    //             flagsButtonPadding:EdgeInsets.all(8),

                                    //             dropdownIconPosition:
                                    //                 IconPosition.trailing,
                                    //             decoration: InputDecoration(
                                    //                 labelText: 'Phone Number',
                                    //                 border: InputBorder.none),
                                    //             initialCountryCode: 'IN',
                                    //             onChanged: (phone) {
                                    //               print(phone.completeNumber);
                                    //             },
                                    //           )),
                                    //     ),
                                    // SizedBox(width: 5,),
                                    // Expanded(
                                    //   flex: 7,
                                    //   child: Container(
                                    //     // height: DeviceSize.screenHeight - 150,
                                    //     width: 100,
                                    //     decoration: BoxDecoration(
                                    //         color: Colors.grey.shade100,
                                    //         borderRadius:
                                    //             BorderRadius.circular(8)),
                                    //     child: TextFormField(
                                    //       initialValue:
                                    //           _users.primaryPhoneNumber,
                                    //       style: TextStyle(
                                    //         fontSize: 15,
                                    //       ),
                                    //       onChanged: (value) {
                                    //         setState(() {
                                    //           _phoneNumber = value;
                                    //         });
                                    //       },
                                    //       decoration: InputDecoration(
                                    //         contentPadding:
                                    //             EdgeInsets.all(10),
                                    //         border: InputBorder.none,
                                    //       ),
                                    //     ),
                                    //   ),
                                    // ),
                                    //   ],
                                    // ),
                                  ],
                                )
                              : Text(
                                  _users.primaryPhoneNumber.toString(),
                                  style: const TextStyle(
                                      fontSize: 15, color: Colors.black),
                                ),
                          D10HCustomClSizedBoxWidget(),
                          buttonClicked
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Email"),
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
                                        initialValue: _users.primaryEmail,
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
                              : Text(
                                  _users.primaryEmail.toString(),
                                  style: const TextStyle(
                                      fontSize: 15, color: Colors.black),
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
                buttonClicked = !buttonClicked;
              });
              if (buttonClicked == false) {
                updateContactDetails();
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
