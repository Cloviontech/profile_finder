import 'dart:convert';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:profile_finder/core/utils/color_constant.dart';
import 'package:profile_finder/core/utils/size_utils.dart';
import 'package:profile_finder/model_final/model_final.dart';
import 'package:profile_finder/presentation/1ProfileFinder/MatchingList/1screen_advertisement.dart';
import 'package:profile_finder/routes/app_routes.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/CustomWidgetTextformfieldWithSuffixicon.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/WidgetTitleAndDropdown.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/WidgetTitleAndTextfield.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/cl_custom_widgets2.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

List<String> data = [
  "Music",
  "Travel",
  "Gaming",
  "Reading",
  "Photography",
  "Writing",
  "Painting or Drawing",
  "Singing",
  "Dancer",
  "Movies",
  "Swimming",
  "Artist",
];

List<String> Dbditems = ["Yes", "No"];

List<String> data_complexion = [
  "Dark",
  "Medium",
  "Moderate Fair",
  "Fair",
  "Very Fair",
];

List<String> data_foodTaste = [
  "Sweet",
  "Bitter",
  "Umami",
  "Sour",
  "Spicy",
];

List<String> data_diet_plan = [
  "Self Cooking",
  "Made",
  "Spouse or Others",
  "Order from Outside",
  "Buy frozen & bakeries",
];

List<String> data_carrying = [
  "Yes",
  "No",
];

List<String> maritalSts = ["Single", "Married", "Divorced", "Widow"];

List<String> physicalSts = [
  "Normal",
  "Disabled",
];

List<String> religionSts = [
  "Christian",
  "Hindu",
  "Muslim",
];

List<String> birthPlaceSts = ["India", "USA", "UK", "Canada", "Sri Lanka"];

List<String> countryChoose = ["India", "USA", "UK", "Canada", "Sri Lanka"];

List<String> stateChoose = [
  "Tamilnadu",
  "Kerala",
  "Karnataka",
  "AndhraPradesh"
];

List<String> cityChoose = ["Chennai", "Delhi", "Mumbai", "Kolkatta"];

List<String> denominationChoose = [
  "Rupee",
  "USD",
];

List<String> bloodGroupChoose = [
  "A+",
  "B+",
  "AB+",
  "O+",
  "A-",
  "B-",
  "AB-",
  "O-"
];

List<String> residingCounrtyChoose = [
  "India",
  "USA",
  "UK",
  "Canada",
  "Sri Lanka"
];

List<String> nameofParishChoose = [
  "CSI",
  "Catholic",
];

List<String> countryCodechoose = ["+91", "+1", "+51", "+115"];

List<String> residingStatusChoose = [
  "Permanent",
  "Temperory",
];

List<String> localAdminChoose = ["A", "B", "C", "D"];

List<String> typeOfRelation = [
  "Father",
  "Mother",
  "Brother",
  "Sister",
  "Uncle",
  "Cousin"
];

List<String> occupationChoose = [
  "Doctor",
  "Engineer",
  "Government Job",
  "Teacher"
];

List<String> courseSchool = [
  "Science",
  "Commerce",
  "Arts",
];

List<String> salaryRange = [
  "More than 5 lakhs",
  "More than 10 lakhs",
  "More than 15 lakhs",
  "More than 20 lakhs",
  "More than 30 lakhs",
];

class ThirteenScreenPrimaryDetails extends StatefulWidget {
  const ThirteenScreenPrimaryDetails({super.key});



  @override
  State<ThirteenScreenPrimaryDetails> createState() =>
      _ThirteenScreenPrimaryDetailsState();
}

class _ThirteenScreenPrimaryDetailsState
    extends State<ThirteenScreenPrimaryDetails> {
  saveToSharedPrefferences(String nameOfID, String valueToSave) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setString(nameOfID, valueToSave);
  }

  String hintFromSharedPreff = "Select";

  valueFromSharedPrefferences(String nameOfID) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      hintFromSharedPreff = preferences.getString(nameOfID).toString();
    });

    hintFromSharedPreff = preferences.getString(nameOfID).toString();
// return hintFromSharedPreff;
  }

  String countryCode = "+91";
  String gender = "male";

  bool? areYouWorkingNowYes = true;
  bool? areYouWorkingNowNo = false;

  final int _value = 0;
  int _valueInterest = 0;
  final int _valueNonInterest = 0;
  final int _valueComplexion = 0;

  int _valueFoodTaste = 0;
  String _valueFoodtasteVegNonVeg = "Veg";

  int _valueFoodmaking = 0;
  int _valueCaring = 0;
  int _valuetobacco = 0;
  int _valueAlcohol = 0;
  int _valueDrugs = 0;
  int _valueCriminal = 0;

  int? _valueOrphan = 1;
  int? _valueDisable = 1;

  late String height;
  late String weight;
  late String marital;
  late String physicalAndMentalStatus;
  late String email;
  late String phone_number;
  late String dob;

  List<File> selectedImages = [];
  final picker = ImagePicker();
  // List<XFile> xfilePick = pickedFile;

  Future getImages() async {
    final pickedFile = await picker.pickMultiImage(
        imageQuality: 100, maxHeight: 1000, maxWidth: 1000);
    List<XFile> xfilePick = pickedFile;

    setState(
      () {
        if (xfilePick.isNotEmpty) {
          for (var i = 0; i < xfilePick.length; i++) {
            selectedImages.add(File(xfilePick[i].path));
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Nothing is selected')));
        }
      },
    );
  }

  bool isSelected = false;

  String headsizePath = "abc";
  File? headsizeFile;

  Future pickSingleFileHeadSize() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path ?? " ");
      setState(() {
        headsizeFile = File(result.files.single.path.toString());
        headsizePath = file.path;
      });
    } else {
      Fluttertoast.showToast(
        msg: "Head Size Photo Uploading Error...!",
        backgroundColor: ColorConstant.deepPurpleA200,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT,
      );
    }
  }

  String fullsizePath = "abc";
  File? fullsizeFile;

  Future pickSingleFileFullSize() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path ?? " ");
      setState(() {
        fullsizeFile = File(result.files.single.path.toString());
        fullsizePath = file.path;
      });
    } else {
      Fluttertoast.showToast(
        msg: "Full Size Photo Uploading Error...!",
        backgroundColor: ColorConstant.deepPurpleA200,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT,
      );
    }
  }


  String horoscopePath = "abc";
  File? horoscopeFile;

  Future pickSingleFileHoroscope() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path ?? " ");
      setState(() {
        horoscopeFile = File(result.files.single.path.toString());
        horoscopePath = file.path;
      });
    } else {
      Fluttertoast.showToast(
        msg: "Horoscope Uploading Error...!",
        backgroundColor: ColorConstant.deepPurpleA200,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT,
      );
    }
  }

  String? filename;
  String? filepath;
  File? filee;

  Future pickFile() async {
    // var dio = Dio();

    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path ?? " ");
      filee = File(result.files.single.path.toString());
      filename = file.path.split('/').last;
      filepath = file.path;
    } else {
      print("Result is null");
    }
  }

  late String uidUser;

  // Future getUid () async{

  //   SharedPreferences preferences = await SharedPreferences.getInstance();

  //   uidUser = preferences.getString("uid2").toString();
  // }

  Future uploadDataPrimaryDetails() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    uidUser = preferences.getString("uid2").toString();

    print("uid is $uidUser ");

    final url =
        Uri.parse("http://${ApiService.ipAddress}/primarydetails/$uidUser");
    final request = http.MultipartRequest('POST', url);
    // final file1 = File("/document/msf:1000000042");
    // final file1 = filee;

    // final file2 = filee;
    // final file3 = filee;
    // final file4 = filee;
    // final file5 = filee;

    
    // request.fields['marital_status'] = 'maritalStatusPrimaryDetails';
    // request.fields['physical_mental_status'] = 'physical_mental_status';
    
    // request.fields['primary_email'] = 'emailPrimaryDetails@gmail.com';
       
    // request.fields['primary_phone_number'] ='phoneNumberPrimaryDetails';
      


    // // request.fields['dob'] = 'dateofBirthPrimary';
       
    // request.fields['why_marry'] = 'whyShouldMarry';
       
    // request.fields['behind_decision'] = 'exactReason';
       
    // request.fields['education_school'] = 'school';
      
    // request.fields['education_year'] = 'schoolYearOfCompletion';
      
    // request.fields['education_course'] = 'schoolCourse';
        
    // request.fields['education_major'] = 'schoolMajor';
      
    // request.fields['are_you_working_now'] = 'areYouWorkingNow';
       
    // request.fields['company_name'] = 'companyName';
       
    // request.fields['position'] = 'Position';
    // request.fields['profession'] =
    //     'schoolYearOfCompletion';

    // request.fields['salary_range'] =
    //    'salaryRange';

    // request.fields['your_intrest'] =
    //     'yourInterest';
    // // request.fields['your_intrest'] =
    // //     preferences.getString('schoolYearOfCompletion').toString();
    // // request.fields['your_intrest'] =
    // //     preferences.getString('schoolYearOfCompletion').toString();

    // request.fields['non_intrest'] =
    //     'nonInterest';
    // // request.fields['non_intrest'] =
    // //     preferences.getString('schoolYearOfCompletion').toString();

    // request.fields['complexion'] =
    //     'complexion';
    // request.fields['food_taste'] =
    //     'foodTasteVegOrNon';
    // // request.fields['food_taste'] =
    // //     preferences.getString('schoolYearOfCompletion').toString();

    // request.fields['daily_diet_plan'] =
    //     'dietPlan';
    // request.fields['carriying_after_marriage'] =
    //    'carryingAfterMarriage';
    // request.fields['tobacco'] = 'useTobacco';
    // request.fields['alcohol'] =
    //     'consumeAlcohol';
    // request.fields['drugs'] = 'useDrugs';
    // request.fields['criminal_offence'] =
    //    'criminalOffenses';
    // request.fields['primary_country'] =
    //    'schoolYearOfCompletion';

    // request.files
    //     .add(await http.MultipartFile.fromPath('selfie', headsizeFile!.path));

    // request.files.add(await http.MultipartFile.fromPath(
    //     'full_size_image', fullsizeFile!.path));

    // request.files.add(await http.MultipartFile.fromPath(
    //     'family_image', familyGroupPhotoFile!.path));

    // request.files
    //     .add(await http.MultipartFile.fromPath('gallery', filee!.path));
//
//
//

    // for (var i = 0; i < selectedImages.length; i++) {
    //   request.files.add(
    //       await http.MultipartFile.fromPath('gallery', selectedImages[i].path));
    // }

    // request.files.add(
    //     await http.MultipartFile.fromPath('horoscope', horoscopeFile!.path));

    // request.fields['profile_tag'] =
    //     'profileTagline';
    // request.fields['treet_mypartner'] =
    //     'treatMyPartner';
    // request.fields['treet_their_side'] =
    //    'treatFromTheirSide';
    // request.fields['orphan'] ='orphan';
    // request.fields['disable'] ='disable';
    // request.fields['whichorgan'] = 'disable';

    // 38

    request.fields['marital_status'] =
        preferences.getString('maritalStatusPrimaryDetails').toString();
    request.fields['physical_mental_status'] =
        preferences.getString('physical_mental_status').toString();
    request.fields['primary_email'] =
        preferences.getString('emailPrimaryDetails').toString();
    request.fields['primary_phone_number'] =
        preferences.getString('phoneNumberPrimaryDetails').toString();

//     // request.fields['dob'] = dob;
    //  request.fields['dob'] = '1999-05-08';

    request.fields['dob'] =
        preferences.getString('dateofBirthPrimary').toString();
    request.fields['why_marry'] =
        preferences.getString("whyShouldMarry").toString();
    request.fields['behind_decision'] =
        preferences.getString("exactReason").toString();
    request.fields['education_school'] =
        preferences.getString("school").toString();
    request.fields['education_year'] =
        preferences.getString("schoolYearOfCompletion").toString();
    request.fields['education_course'] =
        preferences.getString("schoolCourse").toString();
    request.fields['education_major'] =
        preferences.getString("schoolMajor").toString();
    request.fields['are_you_working_now'] =
        preferences.getString("areYouWorkingNow").toString();
    request.fields['company_name'] =
        preferences.getString("companyName").toString();
    request.fields['position'] = preferences.getString("Position").toString();
    request.fields['profession'] =
        preferences.getString("schoolYearOfCompletion").toString();

    request.fields['salary_range'] =
        preferences.getString("salaryRange").toString();

    request.fields['your_intrest'] =
        preferences.getString("yourInterest").toString();
    // request.fields['your_intrest'] =
    //     preferences.getString("schoolYearOfCompletion").toString();
    // request.fields['your_intrest'] =
    //     preferences.getString("schoolYearOfCompletion").toString();

    request.fields['non_intrest'] =
        preferences.getString("nonInterest").toString();
    // request.fields['non_intrest'] =
    //     preferences.getString("schoolYearOfCompletion").toString();

    request.fields['complexion'] =
        preferences.getString("complexion").toString();
    request.fields['food_taste'] =
        preferences.getString("foodTasteVegOrNon").toString();
    // request.fields['food_taste'] =
    //     preferences.getString("schoolYearOfCompletion").toString();

    request.fields['daily_diet_plan'] =
        preferences.getString("dietPlan").toString();
    request.fields['carriying_after_marriage'] =
        preferences.getString("carryingAfterMarriage").toString();
    request.fields['tobacco'] = preferences.getString("useTobacco").toString();
    request.fields['alcohol'] =
        preferences.getString("consumeAlcohol").toString();
    request.fields['drugs'] = preferences.getString("useDrugs").toString();
    request.fields['criminal_offence'] =
        preferences.getString("criminalOffenses").toString();
    request.fields['primary_country'] =
        preferences.getString("schoolYearOfCompletion").toString();

    request.files
        .add(await http.MultipartFile.fromPath('selfie', headsizeFile!.path));

    request.files.add(await http.MultipartFile.fromPath(
        'full_size_image', fullsizeFile!.path));

    request.files.add(await http.MultipartFile.fromPath(
        'family_image', familyGroupPhotoFile!.path));

    // request.files
    //     .add(await http.MultipartFile.fromPath('gallery', filee!.path));
// //
// //
// //

    for (var i = 0; i < selectedImages.length; i++) {
      request.files.add(
          await http.MultipartFile.fromPath('gallery', selectedImages[i].path));
    }

    request.files.add(
        await http.MultipartFile.fromPath('horoscope', horoscopeFile!.path));

    request.fields['profile_tag'] =
        preferences.getString("profileTagline").toString();
    request.fields['treet_mypartner'] =
        preferences.getString("treatMyPartner").toString();
    request.fields['treet_their_side'] =
        preferences.getString("treatFromTheirSide").toString();
    request.fields['orphan'] = preferences.getString("orphan").toString();
    request.fields['disable'] = preferences.getString("disable").toString();
    request.fields['whichorgan'] = preferences.getString("disable").toString();





for (var element in request.fields.entries) {
  print('${element.key} : ${element.value}');
}

for (var element in request.files) {
  print(element.filename);
  
}
// print(request.fields.entries);
// print(request.files);
    try {
      final send = await request.send();
      final response = await http.Response.fromStream(send);
      print(response.statusCode);
      print(response.body);
      print("length: ${selectedImages.length}");
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        // Navigator.pushNamed(context, AppRoutes.FourteenScreenscr);
        Fluttertoast.showToast(
          msg: "Primary Deatails Uploaded Successfully...!",
          backgroundColor: ColorConstant.deepPurpleA200,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_SHORT,
        );
      }
    } catch (e) {
      print("Error While Uploading File $e");
    }
  }


  
  String familyGroupPhotoPath = "abc";
  File? familyGroupPhotoFile;

  Future pickSingleFilefamilyGroupPhoto() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path ?? " ");
      setState(() {
        familyGroupPhotoFile = File(result.files.single.path.toString());
        familyGroupPhotoPath = file.path;
      });
    } else {
      Fluttertoast.showToast(
        msg: "Full Size Photo Uploading Error...!",
        backgroundColor: ColorConstant.deepPurpleA200,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT,
      );
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

  DateTime _selectedYear = DateTime(2023);

  String showYear = "Select Year";

  selectYear(context) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Select Year"),
          content: SizedBox(
            height: 300,
            width: 300,
            child: YearPicker(
              firstDate: DateTime(DateTime.now().year - 100),
              lastDate: DateTime(2030),
              initialDate: DateTime(1996),
              selectedDate: _selectedYear,
              onChanged: (DateTime dateTime) {
                setState(() {
                  _selectedYear = dateTime;
                  showYear = "${dateTime.year}";
                });

                saveToSharedPrefferences(
                    "schoolYearOfCompletion", dateTime.year.toString());
                Navigator.pop(context);
              },
            ),
          ),
        );
      },
    );
  }

  // static int currentYear = DateTime.now().year;
  // static int startingYear = 2000;
  // List yearList = List.generate((currentYear - startingYear) + 1,
  //     (index) => (startingYear + index));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          // isLoading == true
          //     ? Center(child: CircularProgressIndicator())
          //     :
          SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: const [
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Text(
                        'Primary Details',
                        // textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 100),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //
                    //

                    WidgetTitleAndTextfield(
                      textFieldHint: 'Enter',
                      textFieldTitle: "Name*",
                      onChanged: (newValue) {
                        saveToSharedPrefferences("nameOfBrideGroom", newValue);
                      },
                    ),

                    WidgetTitleAndDropdownSharedPref(
                      DdbTitle: "Marital Status*",
                      DdbHint: _users.maritalStatus ?? "Select",
                      // DdbHint: _users.maritalStatus.toString(),

                      DbdItems: maritalSts,
                      sharePrefId: 'maritalStatusPrimaryDetails',
                    ),
                    //

                    WidgetTitleAndDropdownSharedPref(
                      DdbTitle: "Physical & Mental Status*",
                      DdbHint: _users.physicalMentalStatus ?? "Select",
                      DbdItems: physicalSts,
                      sharePrefId: "physical_mental_status",
                    ),

                    WidgetTitleAndTextfield(
                      textFieldHint: _users.email ?? 'Enter',
                      textFieldTitle: "Email*",
                      onChanged: (newValue) {
                        saveToSharedPrefferences(
                            "emailPrimaryDetails", newValue);
                      },
                    ),

                    Text(
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
                          //  DropdownButtonFormField(
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
                          //   hint: Text(
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
                          //       countryCode = value.toString();
                          //       print(countryCode);
                          //     });
                          //   },
                        
                          //   items: countryCodechoose
                          //       .map<DropdownMenuItem<String>>((String value) {
                          //     return DropdownMenuItem<String>(
                          //       value: value,
                          //       child: Text(value),
                          //     );
                          //   }).toList(),
                          // ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 6,
                        child: TextField(
                          onChanged: (value) {
                            // phone_number = countryCode.toString() + " " + value;

                            saveToSharedPrefferences(
                                "phoneNumberPrimaryDetails",
                                // countryCode.toString() + " " +
                                value);
                          },
                          // controller: _textFieldController,

                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            hintText: _users.primaryPhoneNumber ?? "XXXXXXXXXX",
                            // hintText: textFieldHint,
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 0, color: Colors.transparent),
                                borderRadius: BorderRadius.circular(10)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10)),
                            filled: true, //<-- SEE HERE
                            fillColor: Colors.grey.shade100,
                          ),
                        ),
                      ),
                    ]),
                    const D10HCustomClSizedBoxWidget(),
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

                    CustomWidgetTextformfieldWithSuffixicon(
                      hintText: _users.whyMarry ?? "Enter",
                      name: "Why You Should Marry? Please Explain in Brief",
                      fontWeight: FontWeight.w700,
                      onChangedd: (p0) async {
                        saveToSharedPrefferences("whyShouldMarry", p0);
                      },
                    ),
                    CustomWidgetTextformfieldWithSuffixicon(
                      hintText: _users.behindDecision ?? "Enter",
                      name:
                          "Non You Are WillingTo Marry What is The Exact Reason Behind The Decision?",
                      fontWeight: FontWeight.w700,
                      onChangedd: (p0) async {
                        saveToSharedPrefferences("exactReason", p0);
                      },
                    ),
                    D10HCustomClSizedBoxWidget(),

                    Text(
                      "Education",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    D10HCustomClSizedBoxWidget(),

                    WidgetTitleAndTextfield(
                      textFieldHint: _users.educationSchool ?? "Enter",
                      textFieldTitle: "School*",
                      onChanged: (newValue) async {
                        saveToSharedPrefferences("school", newValue);
                      },
                    ),
                    // WidgetTitleAndTextfield(
                    //   textFieldHint: _users.educationYear ?? 'YYYY',
                    //   textFieldTitle: "Year*",
                    //   suffixIcon: Icon(Icons.date_range),
                    //   onChanged: (newValue) async {
                    //     saveToSharedPrefferences(
                    //         "schoolYearOfCompletion", newValue);
                    //   },
                    // ),
                    Text("Year*"),
                    SizedBox(
                      height: 10,
                    ),

                    Container(
                        height: 48,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade100),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(showYear),
                              GestureDetector(
                                  onTap: () {
                                    selectYear(context);
                                  },
                                  child: Icon(Icons.calendar_month))
                            ],
                          ),
                        )

                        // TextFormField(
                        //   initialValue: showYear,
                        //   decoration: InputDecoration(
                        //       border: InputBorder.none,
                        //       suffixIcon: GestureDetector(
                        //           onTap: () {
                        //             selectYear(context);
                        //           },
                        //           child: Icon(Icons.calendar_month))),
                        // ),
                        ),
                    D10HCustomClSizedBoxWidget(),

                    // CupertinoPicker(
                    //   children: [
                    //     ListView.builder(itemBuilder: ((context, index) {
                    //       yearList[index];
                    //     }))
                    //   ],
                    //   itemExtent: 100,
                    //   onSelectedItemChanged: (value) {},
                    // ),

                    //               Container(
                    // height: MediaQuery.of(context).copyWith().size.height / 3,
                    // child: CupertinoDatePicker(
                    //   initialDateTime: DateTime.now(),
                    //   onDateTimeChanged: (DateTime newdate) {
                    //     print(newdate);
                    //   },
                    //   // use24hFormat: true,
                    //   maximumDate: new DateTime(2028, 12, 30),
                    //   minimumYear: 2010,
                    //   maximumYear: 2028,
                    //   minuteInterval: 1,
                    //   mode: CupertinoDatePickerMode.date,
                    // )),

                    WidgetTitleAndDropdownSharedPref(
                      DdbTitle: "Course*",
                      DdbHint: _users.educationCourse ?? "Select",
                      DbdItems: courseSchool,
                      sharePrefId: 'schoolCourse',
                    ),
                    WidgetTitleAndDropdownSharedPref(
                      DdbTitle: "Major*",
                      DdbHint: _users.educationMajor ?? "Select",
                      DbdItems: courseSchool,
                      sharePrefId: 'schoolMajor',
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 15),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Add More",
                          style: TextStyle(color: Colors.blue.shade700),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            minimumSize: Size(width, 50),
                            elevation: 0,
                            side:
                                const BorderSide(width: 1, color: Colors.blue),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8))),
                      ),
                    ),
                    D10HCustomClSizedBoxWidget(),
                    Text(
                      "Are you working now?",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          // color: Colors.yellow,
                          width: 130,
                          height: 50,
                          child: CheckboxListTile(
                            contentPadding: EdgeInsets.zero,
                            // dense: true,
                            title: const Text("Yes"),
                            value: areYouWorkingNowYes,
                            // value: checkedValue,
                            onChanged: (newValue) {
                              setState(() {
                                areYouWorkingNowYes = newValue;
                                if (areYouWorkingNowYes == true) {
                                  areYouWorkingNowNo = false;
                                }

                                // areYouWorkingNow == true
                              });
                              saveToSharedPrefferences("areYouWorkingNow",
                                  areYouWorkingNowYes.toString());
                            },
                            controlAffinity: ListTileControlAffinity
                                .leading, //  <-- leading Checkbox
                          ),
                        ),
                        Container(
                          // color: Colors.yellow,
                          width: 130,
                          height: 50,
                          child: CheckboxListTile(
                            title: const Text("No"),
                            value: areYouWorkingNowNo,
                            // value: checkedValue,
                            onChanged: (newValue) {
                              setState(() {
                                areYouWorkingNowNo = newValue;
                                if (areYouWorkingNowNo == true) {
                                  areYouWorkingNowYes = false;
                                }
                              });
                              saveToSharedPrefferences("areYouWorkingNow",
                                  areYouWorkingNowYes.toString());
                            },
                            controlAffinity: ListTileControlAffinity
                                .leading, //  <-- leading Checkbox
                          ),
                        ),
                      ],
                    ),
                    D10HCustomClSizedBoxWidget(),
                    WidgetTitleAndTextfield(
                      textFieldHint: 'Enter',
                      textFieldTitle: "Company Name*",
                      // suffixIcon: Icon(Icons.date_range),
                      onChanged: (newValue) {
                        saveToSharedPrefferences("companyName", newValue);
                      },
                    ),

                    WidgetTitleAndTextfield(
                      textFieldHint: 'Enter',
                      textFieldTitle: "Position*",
                      onChanged: (newValue) {
                        saveToSharedPrefferences("position", newValue);
                      },
                    ),

                    WidgetTitleAndDropdown(
                      DdbTitle: "Salary Range (Yearly)*",
                      DdbHint: "Select",
                      DbdItems: salaryRange,
                      onChanged: (newValue) {
                        saveToSharedPrefferences("salaryRange", newValue);
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 15),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Add More",
                          style: TextStyle(color: Colors.blue.shade700),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            minimumSize: Size(width, 50),
                            elevation: 0,
                            side:
                                const BorderSide(width: 1, color: Colors.blue),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8))),
                      ),
                    ),

                    D10HCustomClSizedBoxWidget(),
                    CustomClChoiceChip(
                      valuePrimary: _valueNonInterest,
                      dataInput: data,
                      subTitle: "Choose your closest one from the List.",
                      title: "Your Interest?",
                      sharedPreffID: 'yourInterest',
                    ),
                    D10HCustomClSizedBoxWidget(),
                    CustomClChoiceChip(
                      valuePrimary: _valueNonInterest,
                      dataInput: data,
                      subTitle: 'Choose your closest one from the List.',
                      title: 'Not Interest?',
                      sharedPreffID: 'nonInterest',
                    ),
                    D10HCustomClSizedBoxWidget(),
                    CustomClChoiceChip(
                      valuePrimary: _valueComplexion,
                      dataInput: data_complexion,
                      subTitle: 'Choose your closest one from the List.',
                      title: 'Complexion?',
                      sharedPreffID: 'complexion',
                    ),
                    D10HCustomClSizedBoxWidget(),

                    Text(
                      "Food Taste?",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    D10HCustomClSizedBoxWidget(
                      height: 50,
                    ),

                    Text(
                        "What is the opinion of your daily diet plan after marriage."),

                    // Row(
                    //   children: [
                    //     Expanded(
                    //       flex: 5,
                    //       child: RadioListTile(
                    //         contentPadding: EdgeInsets.all(0),
                    //         title: Text("Male"),
                    //         value: "male",
                    //         groupValue: gender,
                    //         onChanged: (value) {
                    //           setState(() {
                    //             gender = value.toString();
                    //           });
                    //         },
                    //       ),
                    //     ),
                    //     Expanded(
                    //       flex: 5,
                    //       child: RadioListTile(
                    //         contentPadding: EdgeInsets.all(0),
                    //         title: Text("Female"),
                    //         value: "female",
                    //         groupValue: gender,
                    //         onChanged: (value) {
                    //           setState(() {
                    //             gender = value.toString();
                    //           });
                    //         },
                    //       ),
                    //     ),
                    //     Expanded(
                    //       flex: 5,
                    //       child: RadioListTile(
                    //         contentPadding: EdgeInsets.zero,
                    //         title: Text("Other"),
                    //         value: "other",
                    //         groupValue: gender,
                    //         onChanged: (value) {
                    //           setState(() {
                    //             gender = value.toString();
                    //           });
                    //         },
                    //       ),
                    //     ),
                    //   ],
                    // ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Radio(
                                  // toggleable: true,
                                  value: "Veg",
                                  groupValue: _valueFoodtasteVegNonVeg,
                                  onChanged: (valueVegOrNon) {
                                    setState(() {
                                      _valueFoodtasteVegNonVeg =
                                          valueVegOrNon.toString();
                                      saveToSharedPrefferences(
                                          "foodTasteVegOrNon",
                                          _valueFoodtasteVegNonVeg
                                          // _valueFoodtasteVegNonVeg == 1
                                          //     ? "Veg"
                                          //     : "Non-Veg"

                                          );
                                    });
                                  }),
                              const SizedBox(
                                width: 2,
                              ),
                              const Text("Veg")
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Radio(
                                  value: "Non Veg",
                                  groupValue: _valueFoodtasteVegNonVeg,
                                  onChanged: (value) {
                                    setState(() {
                                      _valueFoodtasteVegNonVeg =
                                          value.toString();
                                      saveToSharedPrefferences(
                                          "foodTasteVegOrNon",
                                          _valueFoodtasteVegNonVeg);
                                    });
                                    saveToSharedPrefferences(
                                        "foodTasteVegOrNon",
                                        _valueFoodtasteVegNonVeg == 2
                                            ? "Non-Veg"
                                            : "Both");
                                  }),
                              const SizedBox(
                                width: 2,
                              ),
                              const Text("Non Veg")
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Radio(
                                  value: "Both",
                                  groupValue: _valueFoodtasteVegNonVeg,
                                  onChanged: (value) {
                                    setState(() {
                                      _valueFoodtasteVegNonVeg =
                                          value.toString();
                                      saveToSharedPrefferences(
                                          "foodTasteVegOrNon",
                                          _valueFoodtasteVegNonVeg);
                                    });
                                    saveToSharedPrefferences(
                                        "foodTasteVegOrNon",
                                        _valueFoodtasteVegNonVeg == 3
                                            ? "Both"
                                            : "3");
                                  }),
                              const SizedBox(
                                width: 2,
                              ),
                              const Text("Both")
                            ],
                          ),
                        ),
                      ],
                    ),
                    D10HCustomClSizedBoxWidget(
                      height: 50,
                    ),
                    CustomClChoiceChip(
                      valuePrimary: _valueFoodTaste,
                      dataInput: data_foodTaste,
                      // subTitle: '',
                      // title: '',
                      sharedPreffID: "foodTasteType",
                    ),
                    //
                    D10HCustomClSizedBoxWidget(),
                    //
                    CustomClChoiceChip(
                      sharedPreffID: "dietPlan",
                      valuePrimary: _valueFoodmaking,
                      dataInput: data_diet_plan,
                      // subTitle: '',
                      title:
                          "What is the opinion of your daily diet plan after marriage?",
                    ),
                    //
                    D10HCustomClSizedBoxWidget(
                      height: 5,
                    ),
                    //
                    CustomClChoiceChip(
                      sharedPreffID: "carryingAfterMarriage",
                      valuePrimary: _valueCaring,
                      dataInput: data_carrying,
                      // subTitle: '',
                      title: "Are you willing to carrying after marriage?",
                    ),
                    //
                    //
                    D10HCustomClSizedBoxWidget(
                      height: 5,
                    ),
                    //
                    CustomClChoiceChip(
                      valuePrimary: _valuetobacco,
                      dataInput: data_carrying,
                      // subTitle: '',
                      title: "Are you use tobacco products?",
                      sharedPreffID: "useTobacco",
                    ),
                    //
                    D10HCustomClSizedBoxWidget(
                      height: 5,
                    ),
                    //
                    CustomClChoiceChip(
                      valuePrimary: _valueAlcohol,
                      dataInput: data_carrying,
                      // subTitle: '',
                      title: "Are you consume alcohol products?",
                      sharedPreffID: "consumeAlcohol",
                    ),
                    //
                    //
                    D10HCustomClSizedBoxWidget(
                      height: 5,
                    ),
                    //
                    CustomClChoiceChip(
                      valuePrimary: _valueDrugs,
                      dataInput: data_carrying,
                      // subTitle: '',
                      title: "Are you use Illegal drugs ever in your life?",
                      sharedPreffID: "useDrugs",
                    ),
                    //
                    //
                    D10HCustomClSizedBoxWidget(
                      height: 5,
                    ),
                    //
                    CustomClChoiceChip(
                      valuePrimary: _valueCriminal,
                      dataInput: data_carrying,
                      // subTitle: '',
                      title:
                          "Do you have any Criminal offences for allegations in any country ever in your life?",
                      sharedPreffID: "criminalOffenses",
                    ),
                    //
                    //
                    D10HCustomClSizedBoxWidget(
                      height: 5,
                    ),
                    //

                    Text(
                      "Gallery",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    D10HCustomClSizedBoxWidget(),
                    Text(
                      "The File should be accepted only .PNG, .JPEG, .MP4, format",
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                    D10HCustomClSizedBoxWidget(),
                    Text(
                      "Head Size (Selfie)*",
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                    //
                    //
                    //
                    D10HCustomClSizedBoxWidget(),

                    Container(
                      width: double.maxFinite,
                      child: DottedBorder(
                          // borderPadding: EdgeInsets.all(10),
                          borderType: BorderType.RRect,
                          strokeWidth: 1,
                          color: Colors.grey,
                          radius: const Radius.circular(10),
                          dashPattern: const [3, 5],
                          // strokeCap: StrokeCap.butt,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 80, right: 80, top: 0, bottom: 0),
                                  child: Container(
                                    height: 130,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            pickSingleFileHeadSize();

                                            // pickFile();
                                          },
                                          child: Container(
                                            height: 65,
                                            width: 65,
                                            decoration: BoxDecoration(
                                                color: Colors.indigo.shade50,
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            child: headsizePath == "abc"
                                                ? Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            15.0),
                                                    child: SvgPicture.asset(
                                                      "assets/images/Frame.svg",
                                                    ),
                                                  )
                                                : ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    child: Image.file(
                                                      headsizeFile!,
                                                      fit: BoxFit.cover,
                                                      width: 80,
                                                      height: 80,
                                                    )),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Text(
                                            "Click and capture your Selfie"),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ),
                    //
                    //
                    D10HCustomClSizedBoxWidget(),
                    Text(
                      "Full Size*",
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                    //

                    Container(
                      width: double.maxFinite,
                      child: DottedBorder(
                          // borderPadding: EdgeInsets.all(10),
                          borderType: BorderType.RRect,
                          strokeWidth: 1,
                          color: Colors.grey,
                          radius: const Radius.circular(10),
                          dashPattern: const [3, 5],
                          // strokeCap: StrokeCap.butt,
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 80, right: 80, top: 0, bottom: 0),
                                  child: GestureDetector(
                                    onTap: () {
                                      pickSingleFileFullSize();
                                    },
                                    child: Container(
                                      height: 130,
                                      width: 200,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 65,
                                            width: 65,
                                            decoration: BoxDecoration(
                                                color: Colors.indigo.shade50,
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            child: fullsizePath == "abc"
                                                ? Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            15.0),
                                                    child: SvgPicture.asset(
                                                      'assets/images/img_user_deep_purple_a200_69x69.svg',
                                                    ),
                                                  )
                                                : ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    child: Image.file(
                                                      fullsizeFile!,
                                                      fit: BoxFit.cover,
                                                      width: 80,
                                                      height: 80,
                                                    )),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          const Text("Click her to Upload"),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ),
                    Text(
                      "Family Group size*",
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                    Container(
                      width: double.maxFinite,
                      child: DottedBorder(
                          // borderPadding: EdgeInsets.all(10),
                          borderType: BorderType.RRect,
                          strokeWidth: 1,
                          color: Colors.grey,
                          radius: const Radius.circular(10),
                          dashPattern: const [3, 5],
                          // strokeCap: StrokeCap.butt,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 80, right: 80, top: 0, bottom: 0),
                                  child: Container(
                                    height: 130,
                                    width: 200,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            pickSingleFilefamilyGroupPhoto();
                                          },
                                          child: Container(
                                            height: 65,
                                            width: 65,
                                            decoration: BoxDecoration(
                                                color: Colors.indigo.shade50,
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            child: familyGroupPhotoPath == "abc"
                                                ? Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            15.0),
                                                    child: SvgPicture.asset(
                                                      'assets/images/img_user_deep_purple_a200_69x69.svg',
                                                    ),
                                                  )
                                                : ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    child: Image.file(
                                                      familyGroupPhotoFile!,
                                                      fit: BoxFit.cover,
                                                      width: 80,
                                                      height: 80,
                                                    )),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Text("Click her to Upload"),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ),
                    D10HCustomClSizedBoxWidget(),
                    Text(
                      "Gallery Photos*",
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                    D10HCustomClSizedBoxWidget(),

                    Container(
                      height: 130,
                      width: double.maxFinite,
                      child: DottedBorder(
                        // borderPadding: EdgeInsets.all(10),
                        borderType: BorderType.RRect,
                        strokeWidth: 1,
                        color: Colors.grey,
                        radius: const Radius.circular(10),
                        dashPattern: const [3, 5],
                        // strokeCap: StrokeCap.butt,
                        child: InkWell(
                          onTap: () {
                            getImages();
                          },
                          child: selectedImages.isEmpty
                              ? const Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        uploadImageContainerCustomCl(),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        uploadImageContainerCustomCl(),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        uploadImageContainerCustomCl(),
                                      ],
                                    ),
                                    Text("Click her to Upload"),
                                  ],
                                )
                              : GridView.builder(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),

                                  // shrinkWrap: true,
                                  itemCount: selectedImages.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return InkWell(
                                      onTap: () {
                                        setState(() {
                                          // selectedImages.clear();
                                          selectedImages.removeAt(index);
                                          print('removes $selectedImages');
                                        });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Stack(
                                            alignment: Alignment.topRight,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                child: Image.file(
                                                  selectedImages[index],
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              Icon(
                                                Icons.remove,
                                                color: Colors.white,
                                              )
                                            ]),
                                      ),
                                    );
                                  },
                                ),
                        ),
                      ),
                    ),

                    D10HCustomClSizedBoxWidget(),
                    Text(
                      "Horoscope (Optional)",
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Container(
                        width: double.maxFinite,
                        child: DottedBorder(
                            // borderPadding: EdgeInsets.all(10),
                            borderType: BorderType.RRect,
                            strokeWidth: 1,
                            color: Colors.grey,
                            radius: const Radius.circular(10),
                            dashPattern: const [3, 5],
                            // strokeCap: StrokeCap.butt,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 80, right: 80, top: 0, bottom: 0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    D10HCustomClSizedBoxWidget(),
                                    InkWell(
                                      onTap: () {
                                        // pickSingleFileHoroscope();
                                        pickSingleFileHoroscope();
                                      },
                                      child: Container(
                                        height: 80,
                                        width: 80,
                                        decoration: BoxDecoration(
                                            color: Colors.indigo.shade50,
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: horoscopePath == "abc"
                                            ? Padding(
                                                padding:
                                                    const EdgeInsets.all(15.0),
                                                child: SvgPicture.asset(
                                                  'assets/images/img_user_deep_purple_a200_69x69.svg',
                                                ),
                                              )
                                            : ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: Image.file(
                                                  horoscopeFile!,
                                                  fit: BoxFit.cover,
                                                  width: 80,
                                                  height: 80,
                                                )),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text("Click her to Upload"),
                                    D10HCustomClSizedBoxWidget(),
                                  ],
                                ),
                              ),
                            )),
                      ),
                    ),
                    //
                    //
                    CustomWidgetTextformfieldWithSuffixicon(
                      name: "Profile Tagline",
                      fontWeight: FontWeight.w400,
                      onChangedd: (p0) async {
                        SharedPreferences preferences =
                            await SharedPreferences.getInstance();

                        preferences.setString("profileTagline", p0);
                      },
                    ),

                    CustomWidgetTextformfieldWithSuffixicon(
                      name: "I would Like to treat my partner",
                      fontWeight: FontWeight.w400,
                      onChangedd: (p0) async {
                        SharedPreferences preferences =
                            await SharedPreferences.getInstance();

                        preferences.setString("treatMyPartner", p0);
                      },
                    ),
                    CustomWidgetTextformfieldWithSuffixicon(
                      name: "I expect the treat from their side",
                      fontWeight: FontWeight.w400,
                      onChangedd: (p0) async {
                        SharedPreferences preferences =
                            await SharedPreferences.getInstance();

                        preferences.setString("treatFromTheirSide", p0);
                      },
                    ),
                    D10HCustomClSizedBoxWidget(),

                    //
                    //
                    //

                    Text(
                      "Are you an orphan?",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Radio(
                                  value: 1,
                                  groupValue: _valueOrphan,
                                  onChanged: (value) {
                                    setState(() {
                                      _valueOrphan = value as int;
                                    });
                                    saveToSharedPrefferences("orphan",
                                        _valueOrphan == 1 ? "Yes" : "No");
                                  }),
                              const SizedBox(
                                width: 2,
                              ),
                              const Text("Yes")
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        Container(
                          child: Row(
                            children: [
                              Radio(
                                  value: 2,
                                  groupValue: _valueOrphan,
                                  onChanged: (value) {
                                    setState(() {
                                      _valueOrphan = value as int;
                                    });
                                    saveToSharedPrefferences("orphan",
                                        _valueOrphan == 2 ? "No" : "Yes");
                                  }),
                              const SizedBox(
                                width: 2,
                              ),
                              const Text("No")
                            ],
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "Are you an disable?",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Radio(
                                  value: 1,
                                  groupValue: _valueDisable,
                                  onChanged: (value) {
                                    setState(() {
                                      _valueDisable = value as int;
                                    });
                                    saveToSharedPrefferences("disable",
                                        _valueDisable == 1 ? "Yes" : "No");
                                  }),
                              const SizedBox(
                                width: 2,
                              ),
                              const Text("Yes")
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        Container(
                          child: Row(
                            children: [
                              Radio(
                                  value: 2,
                                  groupValue: _valueDisable,
                                  onChanged: (value) {
                                    setState(() {
                                      _valueDisable = value as int;
                                    });
                                    saveToSharedPrefferences("disable",
                                        _valueDisable == 2 ? "No" : "Yes");
                                  }),
                              const SizedBox(
                                width: 2,
                              ),
                              const Text("No")
                            ],
                          ),
                        ),
                      ],
                    ),

                    D10HCustomClSizedBoxWidget(),

                    // MyElevatedButtonWithBorderColor(
                    //     // onPressed: uploadData,
                    //     onPressed: () {
                    //       Navigator.pushNamed(
                    //           context, AppRoutes.FourteenScreenscr);
                    //     },
                    //     width: double.maxFinite,
                    //     borderRadius: BorderRadius.circular(10),
                    //     height: 45,
                    //     child: Text('UploadData')),

                    // MyElevatedButton(
                    //   onPressed: uploadData,
                    //   // () {
                    //     // Navigator.push(context, MaterialPageRoute(builder: (context) {
                    //     //   return HappyCouplesPackagesThirtySixScreen();
                    //     // }));
                    //   // },
                    //   child: const Text('Ok'),
                    //   borderRadius: BorderRadius.circular(10),
                    //   backgroundColor: Colors.transparent,
                    //   width: double.maxFinite
                    // ),

                    //      MyElevatedButtonWithBorderColor(
                    //     onPressed: (){
                    //       // TestMethodAccess().testMethod();
                    //       // getData();
                    //     },
                    //     width: double.maxFinite,
                    //     borderRadius: BorderRadius.circular(10),
                    //     height: 45,
                    //     child: Text('testMethod')),
                    const SizedBox(
                      height: 100,
                    )

                    //
                    //
                    //
                    //
                    //
                  ],
                ),
              ),

//
//
//
//
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
                        uploadDataPrimaryDetails();
                        // Navigator.pushNamed(context, AppRoutes.FourteenScreenscr);
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
}

// Widget _primaryDetailsPageMain() {
//     return
//   }
