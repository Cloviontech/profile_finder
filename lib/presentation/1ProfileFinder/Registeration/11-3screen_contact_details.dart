import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:profile_finder/core/utils/color_constant.dart';
import 'package:profile_finder/model_final/model_final.dart';
import 'package:profile_finder/presentation/1ProfileFinder/MatchingList/1screen_advertisement.dart';
import 'package:profile_finder/routes/app_routes.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/WidgetTitleAndDropdown.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/WidgetTitleAndTextfield.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ThirteenScreenContactDetails extends StatefulWidget {
  const ThirteenScreenContactDetails({Key? key}) : super(key: key);

  @override
  State<ThirteenScreenContactDetails> createState() =>
      _ThirteenScreenContactDetailsState();
}

class _ThirteenScreenContactDetailsState
    extends State<ThirteenScreenContactDetails> {
  String? valueChoose;

  final List<String> _dropdownItemList = ["Item One", "Item Two", "Item Three"];

  final List<String> _dropdownItemListtwo = [
    "Item One",
    "Item Two",
    "Item Three"
  ];

  saveToSharedPrefferences(String nameOfID, String valueToSave) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setString(nameOfID, valueToSave);
  }

  List<String> countryChoose = ["India", "USA", "UK", "Canada", "Sri Lanka"];
  List<String> cityChoose = ["Chennai", "Delhi", "Mumbai", "Kolkatta"];

  String countryCode = "+91";

  late String uidUser;

  Future uploadDataContactDetails() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    uidUser = preferences.getString("uid2").toString();

    print("uid is $uidUser ");

    final url =
        Uri.parse("http://${ApiService.ipAddress}/contactdetails/$uidUser");
    final request = http.MultipartRequest('POST', url);
   
   /*
    request.fields['contact_father_name'] =
        preferences.getString("contact_father_name").toString();
    request.fields['contact_father_street'] =
        preferences.getString("contact_father_street").toString();
    request.fields['contact_father_zipcode'] =
        preferences.getString("contact_father_zipcode").toString();
    request.fields['contact_father_country'] =
        preferences.getString("contact_father_country").toString();
    request.fields['contact_father_city'] =
        preferences.getString("contact_father_city").toString();
    request.fields['contact_father_housename'] =
        preferences.getString("contact_father_housename").toString();
    request.fields['contact_mother_housename'] =
        preferences.getString("contact_mother_housename").toString();
    request.fields['contact_email'] =
        preferences.getString("contact_email").toString();
    request.fields['contact_phone'] =
        preferences.getString("contact_phone").toString();
    request.fields['whatsapp'] = preferences.getString("whatsapp").toString();
    request.fields['facebook'] = preferences.getString("facebook").toString();
    request.fields['linkedin'] = preferences.getString("linkedin").toString();
    request.fields['instagram'] = preferences.getString("instagram").toString();
    request.fields['youtube'] = preferences.getString("youtube").toString();
    request.fields['twitter'] = preferences.getString("twitter").toString();
    request.fields['website'] = preferences.getString("website").toString();
*/

       request.fields['contact_father_name'] = 'fatherrr';
      
    request.fields['contact_father_street'] = 'father street';
       
    request.fields['contact_father_zipcode'] = '600001';
     request.fields['contact_father_country'] = 'america';
   request.fields['contact_father_city'] = 'new york';
    request.fields['contact_father_housename'] ='father house name';
    request.fields['contact_mother_housename'] = 'mother house name';
    request.fields['contact_email'] ='contact@gmail.com';
    request.fields['contact_phone'] ='9876543210';
    request.fields['whatsapp'] = 'whatsapp.com';
    request.fields['facebook'] ='fb.com' ;
    request.fields['linkedin'] = 'link.com';
    request.fields['instagram'] = 'insta.com';
    request.fields['youtube'] = 'yout.com';
    request.fields['twitter'] = 'twit.com';
    request.fields['website'] = 'web.com';
    if (preferences.getString("contact_father_name") == "null") {
      Fluttertoast.showToast(
        msg: "Kindly Upload All Data...!",
        backgroundColor: ColorConstant.deepPurpleA200,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT,
      );
    } else {
      try {
        final send = await request.send();
        final response = await http.Response.fromStream(send);
        print(response.statusCode);
        print(response.body);
        if (response.statusCode == 200) {
          Fluttertoast.showToast(
            msg:
                "Contact Details Uploaded Successfully...! ${preferences.getString("contact_father_name")}",
            backgroundColor: ColorConstant.deepPurpleA200,
            textColor: Colors.white,
            toastLength: Toast.LENGTH_SHORT,
          );
          // Future.delayed(const Duration(seconds: 10), () {});
          Navigator.pushNamed(
              context, AppRoutes.FourteenScreenBottomNavigationscr);
        }
      } catch (e) {
        print("Error While UploadingFile$e");
      }
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
      // await Future.delayed(const Duration(seconds: 1), () {});

      setState(() {
        isLoading = false;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          //  isLoading == true
          //     ? Center(child: CircularProgressIndicator())
          //     :
          SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Text(
                    'Contact Details',
                    // textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              // const D10HCustomClSizedBoxWidget(
              //   height: 1.5,
              // ),
              const Text(
                "Address",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),

              const D10HCustomClSizedBoxWidget(),

              WidgetTitleAndTextfield(
                initialValueExisitingCust: _users.contactFatherName,
                textFieldHint: _users.contactFatherName.toString() == "null"
                    ? 'Enter'
                    : _users.contactFatherName.toString(),
                textFieldTitle: "Father's Name*",
                onChanged: (newValue) {
                  saveToSharedPrefferences("contact_father_name", newValue);
                },
              ),

              // Text(test!),
              WidgetTitleAndTextfield(
                initialValueExisitingCust:
                    _users.contactFatherStreet.toString(),
                textFieldHint: _users.contactFatherStreet.toString() == "null"
                    ? 'Enter'
                    : _users.contactFatherStreet.toString(),
                textFieldTitle: "Street*",
                onChanged: (newValue) {
                  saveToSharedPrefferences("contact_father_street", newValue);
                },
              ),
              WidgetTitleAndTextfield(
                initialValueExisitingCust:
                    _users.contactFatherZipcode.toString(),
                textFieldHint: _users.contactFatherZipcode.toString() == "null"
                    ? 'Enter'
                    : _users.contactFatherZipcode.toString(),
                textFieldTitle: 'PO BOX/Zip Code*',
                onChanged: (newValue) {
                  saveToSharedPrefferences("contact_father_zipcode", newValue);
                },
              ),
              WidgetTitleAndDropdown(
                DdbTitle: "Country*",
                DdbHint: _users.contactFatherCountry.toString() == "null"
                    ? "Select"
                    : _users.contactFatherCountry.toString(),
                DbdItems: countryChoose,
                onChanged: (newValue) {
                  saveToSharedPrefferences("contact_father_country", newValue);
                },
              ),
              WidgetTitleAndDropdown(
                DdbTitle: "City*",
                DdbHint: _users.contactFatherCity.toString() == "null"
                    ? "Select"
                    : _users.contactFatherCity.toString(),
                DbdItems: cityChoose,
                onChanged: (newValue) {
                  saveToSharedPrefferences("contact_father_city", newValue);
                },
              ),
              const Text(
                "Other Details",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const D10HCustomClSizedBoxWidget(),
              WidgetTitleAndTextfield(
                initialValueExisitingCust:
                    _users.contactFatherHousename.toString() == "null"
                        ? null
                        : _users.contactFatherHousename.toString(),
                textFieldHint: 'Enter',
                textFieldTitle: "Father's House Name*",
                onChanged: (newValue) {
                  saveToSharedPrefferences(
                      "contact_father_housename", newValue);
                },
              ),
              WidgetTitleAndTextfield(
                initialValueExisitingCust: _users.contactMotherHousename,
                textFieldHint: 'Enter',
                textFieldTitle: "Mother's House Name*",
                onChanged: (newValue) {
                  saveToSharedPrefferences(
                      "contact_mother_housename", newValue);
                },
              ),
              WidgetTitleAndTextfield(
                initialValueExisitingCust: _users.contactEmail,
                textFieldHint: 'Enter',
                textFieldTitle: "Contact Email ID*",
                onChanged: (newValue) {
                  saveToSharedPrefferences("contact_email", newValue);
                },
              ),
              const Text(
                "Phone Number",
              ),
              const SizedBox(
                height: 10,
              ),
              Row(mainAxisSize: MainAxisSize.min, children: [
                Expanded(
                  flex: 3,
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade100,
                      ),
                      child:
                      Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: IntlPhoneField(
                                            // flagsButtonMargin: EdgeInsets.only(left: 10),
                                            disableLengthCheck: true,
                                            dropdownIconPosition:
                                                IconPosition.trailing,
                                            decoration: const InputDecoration(
                                                border: InputBorder.none),
                                            initialCountryCode: 'IN',
                                            onCountryChanged: (phone) {
                                              countryCode = phone.code.toString();
                                            },
                                            onChanged: (phone) {
                                              print(phone.completeNumber);
                                                  
                                              setState(() {
                                                countryCode = phone.countryCode;
                                              });
                                              debugPrint(countryCode);
                                            },
                                          ),
                          ),
                      
                      
                      //  DropdownButton(
                      //   isExpanded: true,
                      //   padding: const EdgeInsets.only(left: 10, right: 10),
                      //   underline: const SizedBox(),
                      //   items:
                      //       countryCodechoose.map((String countryCodechoose) {
                      //     return DropdownMenuItem(
                      //       value: countryCodechoose,
                      //       child: Text(countryCodechoose),
                      //     );
                      //   }).toList(),
                      //   onChanged: (value) {
                      //     setState(() {
                      //       countryCode = value.toString();
                      //       print(countryCode);
                      //     });
                      //   },
                      //   hint: Text(
                      //     countryCode,
                      //     style: const TextStyle(fontSize: 15),
                      //   ),
                      // )

                      // DropdownButtonFormField(

                      //   decoration: InputDecoration(
                      //       border: InputBorder.none,
                      //       contentPadding: EdgeInsets.all(10)
                      //       // labelText: "Select"
                      //       ),
                      //   // underline: SizedBox(),
                      //   isExpanded: true,
                      //   // autofocus: true,

                      //   dropdownColor: Colors.white,
                      //   // focusColor: Colors.white,
                      //   hint: const Text(
                      //     '+91',
                      //     style: TextStyle(fontSize: 14),
                      //   ),
                      //   // value: dropdownValue,
                      //   icon: const Icon(Icons.arrow_drop_down),
                      //   iconSize: 24,
                      //   // elevation: 16,

                      //   // onChanged: (String? newValue) {
                      //   //   setState(() {
                      //   //     dropdownValue = newValue!;
                      //   //   });
                      //   // },

                      //   onChanged: (value) {
                      //     setState(() {
                      //       countryCode = value;
                      //       print(countryCode);
                      //     });
                      //   },

                      // items: countryCodechoose
                      //       .map<DropdownMenuItem<String>>((String value) {
                      //     return DropdownMenuItem<String>(
                      //       value: "+91 ",
                      //       child: Text(value),
                      //     );
                      //   }).toList(),

                      // ),
                      ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 6,
                  child: TextFormField(
                      initialValue: _users.primaryPhoneNumber == "null"
                          ? null
                          : _users.primaryPhoneNumber?.substring(4),
                      onChanged: (value) {
                        // phone_number = countryCode.toString() + " " + value;

                        saveToSharedPrefferences(
                            "contact_phone",
                            countryCode == null
                                ? "+91" " " + value
                                : "$countryCode $value");
                      },
                      // controller: _textFieldController,

                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10),
                        // hintText: textFieldHint,
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 0, color: Colors.transparent),
                            borderRadius: BorderRadius.circular(10)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10)),
                        filled: true, //<-- SEE HERE
                        fillColor: Colors.grey.shade100,
                      )),
                ),
              ]),
              const D10HCustomClSizedBoxWidget(),
              const Text(
                "Whatsapp Number",
              ),
              const SizedBox(
                height: 10,
              ),
              Row(mainAxisSize: MainAxisSize.min, children: [
                Expanded(
                  flex: 3,
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade100,
                      ),
                      child: 

                      Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: IntlPhoneField(
                                            // flagsButtonMargin: EdgeInsets.only(left: 10),
                                            disableLengthCheck: true,
                                            dropdownIconPosition:
                                                IconPosition.trailing,
                                            decoration: const InputDecoration(
                                                border: InputBorder.none),
                                            initialCountryCode: 'IN',
                                            onCountryChanged: (phone) {
                                              countryCode = phone.code.toString();
                                            },
                                            onChanged: (phone) {
                                              print(phone.completeNumber);
                                                  
                                              setState(() {
                                                countryCode = phone.countryCode;
                                              });
                                              debugPrint(countryCode);
                                            },
                                          ),
                          ),
                      
                      // DropdownButton(
                      //   isExpanded: true,
                      //   padding: const EdgeInsets.only(left: 10, right: 10),
                      //   underline: const SizedBox(),
                      //   items:
                      //       countryCodechoose.map((String countryCodechoose) {
                      //     return DropdownMenuItem(
                      //       value: countryCodechoose,
                      //       child: Text(countryCodechoose),
                      //     );
                      //   }).toList(),
                      //   onChanged: (value) {
                      //     setState(() {
                      //       countryCode = value.toString();
                      //       print(countryCode);
                      //     });
                      //   },
                      //   hint: Text(
                      //     countryCode,
                      //     style: const TextStyle(fontSize: 15),
                      //   ),
                      // ),
                      ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 6,
                  child: TextFormField(
                      initialValue: _users.whatsapp == "null"
                          ? null
                          : _users.whatsapp?.substring(4),
                      onChanged: (value) {
                        // phone_number = countryCode.toString() + " " + value;

                        saveToSharedPrefferences(
                            "whatsapp",
                            countryCode == null
                                ? "+91" " " + value
                                : "$countryCode $value");
                      },
                      // controller: _textFieldController,

                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10),
                        // hintText: textFieldHint,
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 0, color: Colors.transparent),
                            borderRadius: BorderRadius.circular(10)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10)),
                        filled: true, //<-- SEE HERE
                        fillColor: Colors.grey.shade100,
                      )),
                ),
              ]),
              const Padding(
                padding: EdgeInsets.only(top: 25),
                child: Text(
                  "Social Media",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const D10HCustomClSizedBoxWidget(),
              const LeadingSocialMediaIconTrailingTextFormWidget(
                leadingImagePath: 'assets/images/img_facebook_white_a700.svg',
                sharedPreffID: 'facebook',
              ),
              const LeadingSocialMediaIconTrailingTextFormWidget(
                leadingImagePath: 'assets/images/img_frame_white_a700.svg',
                sharedPreffID: 'linkedin',
              ),
              const LeadingSocialMediaIconTrailingTextFormWidget(
                leadingImagePath: 'assets/images/img_camera.svg',
                sharedPreffID: 'instagram',
              ),
              const LeadingSocialMediaIconTrailingTextFormWidget(
                leadingImagePath: 'assets/images/img_play.svg',
                sharedPreffID: 'youtube',
              ),
              const LeadingSocialMediaIconTrailingTextFormWidget(
                leadingImagePath: 'assets/images/img_twitter.svg',
                sharedPreffID: 'twitter',
              ),
              const LeadingSocialMediaIconTrailingTextFormWidget(
                leadingImagePath: 'assets/images/img_globe.svg',
                sharedPreffID: 'website',
              ),
              const D10HCustomClSizedBoxWidget(),
              // MyElevatedButton(
              //     onPressed: uploadDataContactDetails,
              //     // () {
              //     // Navigator.push(context, MaterialPageRoute(builder: (context) {
              //     //   return HappyCouplesPackagesThirtySixScreen();
              //     // }));
              //     // },
              //     child: const Text('Ok'),
              //     borderRadius: BorderRadius.circular(10),
              //     backgroundColor: Colors.transparent,
              //     width: double.maxFinite),
              const SizedBox(
                height: 100,
              )
            ],
          ),
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
                      onPressed: () {
                        Navigator.pushNamed(
                            context, AppRoutes.tenFillTheFormScreen);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: ColorConstant.deepPurpleA200,
                      ))),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 6,
              child: Container(
                  // width: double.maxFinite,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 4),
                          blurRadius: 5.0)
                    ],
                    gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      stops: const [0.0, 1.0],
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
                        uploadDataContactDetails();
                        // Navigator.pushNamed(context, AppRoutes.FourteenScreenscr);
                        // print("Uploading Data to aws");

                        // uploadDataAbijith();

                        // Navigator.pushNamed(
                        //     context, AppRoutes.ThirteenScreenscr);
                      },
                      child: const Text(
                        "Go Next",
                        style: TextStyle(color: Colors.white),
                      ))),
            ),
          ],
        ),
      ),
    );
  }
}
