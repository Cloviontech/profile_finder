import 'dart:io';
import 'dart:typed_data';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:profile_finder/core/utils/color_constant.dart';
import 'package:profile_finder/core/utils/image_constant.dart';
import 'package:profile_finder/presentation/1ProfileFinder/MatchingList/1screen_advertisement.dart';
import 'package:profile_finder/routes/app_routes.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/WidgetTitleAndDropdown.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/WidgetTitleAndTextfield.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/UploadDocument.dart';

class TenFillTheFormScreen extends StatefulWidget {


  final String registerForWhomm;

  const TenFillTheFormScreen({super.key, required this.registerForWhomm});


  @override
  State<TenFillTheFormScreen> createState() => _TenFillTheFormScreenState();
}

class _TenFillTheFormScreenState extends State<TenFillTheFormScreen> {
  String heading = "Fill The Form";

  String? dropdownValue;

  String? Height;

  String? countryCode;

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

  // List<String> marital_status = ["Single", "Married", "Divorced", "Widow"];

  // List<String> marital_status = ["Single", "Married", "Divorced", "Widow"];

  // List<String> marital_status = ["Single", "Married", "Divorced", "Widow"];

  // List<String> marital_status = ["Single", "Married", "Divorced", "Widow"];

  List<String> Dbditems = ["Yes", "No", "Yess", "Noo"];

  UploadDocuments uploadDocuments = UploadDocuments();

  final postID = DateTime.now().millisecondsSinceEpoch.toString();

  File? _image;

  Uint8List? fileBytes;

  // var collection = FirebaseFirestore.instance.collection('ProfileInfo');

  PlatformFile? pickedFile;

  late FToast fToast;

  String name = 'saran';
  String address = '55 B';
  late String height;
  late String weight;
  late String marital;
  late String physical;
  late String religion;
  late String age;
  late String birth_place;
  late String birth_country;
  late String birth_time;
  late String birth_city;
  late String origin;
  late String r_country;
  late String r_state;
  late String r_status;
  late String denomination;
  late String blood_group;
  late String temple_name;
  late String temple_street;
  late String temple_post_code;
  late String temple_country;
  late String temple_city;
  late String temple_phone_number;
  late String temple_diocese;
  late String temple_local_admin;
  late String emergency_name;
  late String emergency_relation;
  late String emergency_phone_number;
  late String emergency_email;
  late String emergency_marital_status;
  late String occupations;

  @override
  void initState() {
    fToast = FToast();
    fToast.init(context);
    super.initState();
  }

  String? filename;
  String filepath = "abc";
  File? filee;

  Future pickFileFinal() async {
    // var dio = Dio();

    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path ?? " ");

      setState(() {
        filee = File(result.files.single.path.toString());
        filepath = file.path;
      });
      filename = file.path.split('/').last;

      print("selected file is ${filee!.path}");
    } else {
      print("Result is null");
    }
  }

  late String uidUser;

  List<String> _dropdownItemList = ["Item One", "Item Two", "Item Three"];

  String? valueChoose;

  Future uploadDataFilltheform() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    uidUser = preferences.getString("uid2").toString();

    print("uid is $uidUser ");

    final url =
        Uri.parse("http://${ApiService.ipAddress}/profileform/$uidUser");
    final request = http.MultipartRequest('POST', url);
     Navigator.pushNamed(context, AppRoutes.ThirteenScreenscr); // temperory
    // final file = File('/home/abijith/Pictures/flower.jpeg');
    // request.files.add(await http.MultipartFile.fromPath('id_card_2', file.path));
    // request.fields['name'] = 'Abijith';
    // request.fields['address'] = '33/111-A';
    // request.fields['height'] = '180';
    // request.fields['weight'] = '190';
    // request.fields['marital'] = 'single';
    // request.fields['physical'] = 'good';
    // request.fields['religion'] = 'Hindu';
    // request.fields['age'] = '24';
    // request.fields['birth_place'] = 'NagerCoil';
    // request.fields['birth_country'] = 'India';
    // request.fields['birth_time'] = '23:00';
    // request.fields['birth_city'] = 'Kanyakumari';
    // request.fields['origin'] = 'Indian';
    // request.fields['r_country'] = 'Turkey';
    // request.fields['r_state'] = 'Turkey State';
    // request.fields['r_status'] = 'Turkey Single';
    // request.fields['denomination'] = 'Turkey Denomination';
    // request.fields['blood_group'] = 'O+';
    // request.files.add(await http.MultipartFile.fromPath('id_card_2', filee!.path));
    // request.fields['temple_name'] = 'Sivan Kovil';
    // request.fields['temple_street'] = 'Sivan Kovil Street';
    // request.fields['temple_post_code'] = '9876543210';
    // request.fields['temple_country'] = 'USA';
    // request.fields['temple_city'] = 'USA City';
    // request.fields['temple_phone_number'] = '9876543210';
    // request.fields['temple_diocese'] = 'Sivan Kovil Diocese';
    // request.fields['temple_local_admin'] = 'Sivan Admin';
    // request.fields['emergency_name'] = 'Abilash';
    // request.fields['emergency_relation'] = 'Friend';
    // request.fields['emergency_phone_number'] = '9898989898';
    // request.fields['emergency_email'] = 'abilash@gmail.com';
    // request.fields['emergency_marital_status'] = 'emergency single';
    // request.fields['occupations'] = 'developer';

    //

    request.fields['name'] =
        preferences.getString("nameOfapplicant").toString();
    request.fields['address'] =
        preferences.getString("addressOfapplicant").toString();
    request.fields['height'] = 
    // height.toString();
    "155";
    request.fields['weight'] = 
    // weight.toString();
    '55';
    request.fields['marital'] = marital.toString();
    request.fields['physical'] = physical.toString();
    request.fields['religion'] = religion.toString();
    request.fields['age'] = age.toString();
    request.fields['birth_place'] = birth_place.toString();
    request.fields['birth_country'] = birth_country.toString();
    request.fields['birth_city'] = birth_city;
    request.fields['birth_time'] = birth_time.toString();
    request.fields['origin'] = origin.toString();
    request.fields['r_country'] = r_country.toString();
    request.fields['r_state'] = r_state.toString();
    request.fields['r_status'] = r_status.toString();
    request.fields['denomination'] = denomination.toString();
    request.fields['blood_group'] = blood_group.toString();
    request.files
        .add(await http.MultipartFile.fromPath('id_card_2', filee!.path));
    request.fields['temple_name'] = temple_name;
    request.fields['temple_street'] = temple_street.toString();
    request.fields['temple_post_code'] = temple_post_code.toString();
    request.fields['temple_country'] = temple_country.toString();
    request.fields['temple_city'] = temple_city.toString();
    request.fields['temple_phone_number'] = "$countryCode $temple_phone_number";
    request.fields['temple_diocese'] = temple_diocese.toString();
    request.fields['temple_local_admin'] = temple_local_admin.toString();
    request.fields['emergency_name'] = emergency_name.toString();
    request.fields['emergency_relation'] = emergency_relation.toString();
    request.fields['emergency_phone_number'] =
        emergency_phone_number.toString();
    request.fields['emergency_email'] = emergency_email.toString();
    request.fields['emergency_marital_status'] =
        emergency_marital_status.toString();
    request.fields['occupations'] = occupations.toString();

    try {
      final send = await request.send();
      final response = await http.Response.fromStream(send);
      print(response.statusCode);
      print(response.body);
      
      if (response.statusCode == 200) {
        Navigator.pushNamed(context, AppRoutes.ThirteenScreenscr);
      }
    } catch (e) {
      print("Error While Uploading File $e");
    }
  }

  List<TextEditingController> controller =
      List.generate(74, (i) => TextEditingController());

  List<dynamic> listt = List.generate(74, (i) => dynamic);

  // request.fields['marital_status'] = marital;
  // request.fields['physical_mental_status'] = physicalAndMentalStatus;
  // request.fields['primary_email'] = email;
  // request.fields['primary_phone_number'] = phone_number;
  // request.fields['dob'] = dob;
  // request.fields['why_marry'] = preferences.getString("whyShouldMarry").toString();
  // request.fields['behind_decision'] = preferences.getString("whyShouldMarry").toString();
  // request.fields['education_school'] = school;

  saveToSharedPrefferences(String nameOfID, String valueToSave) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setString(nameOfID, valueToSave);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteA700,
      appBar: AppBar(
        backgroundColor: ColorConstant.whiteA700,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: ColorConstant.black900,
              size: 20,
            )),
        title: Text("Fill The Form",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WidgetTitleAndTextfield(
                  textFieldHint: 'Enter',
                  textFieldTitle: "Name of Applicant*",
                  onChanged: (newValue) {
                    saveToSharedPrefferences("nameOfapplicant", newValue);
                  },
                ),

                WidgetTitleAndTextfield(
                  textFieldHint: 'Enter',
                  textFieldTitle: "Address of Applicant*",
                  onChanged: (newValue) {
                    saveToSharedPrefferences("addressOfapplicant", newValue);
                  },
                ),
                WidgetTitleAndTextfield(
                  textFieldHint: 'Enter',
                  textFieldTitle: "Height*",
                  // textFieldController: controller[0] ,

                  onChanged: (newValue) {
                    print("controller value is ${controller[0].value}");
                    setState(() {
                      height=newValue;
                    });
                    saveToSharedPrefferences("height", newValue);
                  },
                ),

                WidgetTitleAndTextfield(
                  textFieldHint: 'Enter',
                  textFieldTitle: "Weight in KGLB*",
                  // textFieldController: controller[1] ,
                  onChanged: (newValue) {
                    setState(() {
                       weight=newValue;
                    });
                    saveToSharedPrefferences("weight", newValue);
                  },
                ),
                WidgetTitleAndDropdown(
                  DdbTitle: "Marital Status*",
                  DdbHint: "Select",
                  DbdItems: maritalSts,
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                      marital = newValue;
                    });
                  },
                ),
                WidgetTitleAndDropdown(
                  DdbTitle: "Physical Status*",
                  DdbHint: "Select",
                  DbdItems: physicalSts,
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                      physical = newValue;
                    });
                  },
                ),
                WidgetTitleAndDropdown(
                  DdbTitle: "Religion*",
                  DdbHint: "Select",
                  DbdItems: religionSts,
                  onChanged: (newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                      religion=newValue;
                    });

                    saveToSharedPrefferences("religion", newValue);
                  },
                ),
                WidgetTitleAndTextfield(
                  textFieldHint: 'Enter',
                  textFieldTitle: "Age*",
                  // textFieldController: controller[2],
                  onChanged: (newValue) {
                    setState(() {
                       age=newValue;
                    });

                    saveToSharedPrefferences("age", newValue);
                  },
                ),
                WidgetTitleAndDropdown(
                  DdbTitle: "Birth Place*",
                  DdbHint: "Select",
                  DbdItems: birthPlaceSts,
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                      birth_place = newValue;
                    });
                  },
                ),
                WidgetTitleAndDropdown(
                  DdbTitle: "Birth Country*",
                  DdbHint: "Select",
                  DbdItems: Dbditems,
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                      birth_country = newValue;
                    });
                  },
                ),
                WidgetTitleAndDropdown(
                  DdbTitle: "Birth City*",
                  DdbHint: "Select",
                  DbdItems: cityChoose,
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                      birth_city = newValue;
                    });
                  },
                ),

                WidgetTitleAndTextfield(
                  textFieldHint: 'Enter',
                  textFieldTitle: "Birth Time*",
                  onChanged: (newValue) {
                    setState(() {
                      birth_time = newValue;
                    });
                  },
                ),
                WidgetTitleAndDropdown(
                  DdbTitle: "Country of Origin*",
                  DdbHint: "Select",
                  DbdItems: countryChoose,
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                      origin = newValue;
                    });
                  },
                ),
                WidgetTitleAndDropdown(
                  DdbTitle: "Residing Country*",
                  DdbHint: "Select",
                  DbdItems: residingCounrtyChoose,
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                      r_country = newValue;
                    });
                    // uploadAboutMe("Residing Country", dropdownValue.toString());
                  },
                ),
                WidgetTitleAndDropdown(
                  DdbTitle: "Residing State*",
                  DdbHint: "Select",
                  DbdItems: stateChoose,
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                      r_state = newValue;
                    });
                    // uploadAboutMe("Residing State", dropdownValue.toString());
                  },
                ),
                WidgetTitleAndDropdown(
                  DdbTitle: "Denomination*",
                  DdbHint: "Select",
                  DbdItems: denominationChoose,
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                      denomination = newValue;
                    });
                    // uploadAboutMe("Denomination", dropdownValue.toString());
                  },
                ),
                WidgetTitleAndDropdown(
                  DdbTitle: "Blood Group*",
                  DdbHint: "Select",
                  DbdItems: bloodGroupChoose,
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                      blood_group = newValue;
                    });
                    // uploadAboutMe("Blood Group", dropdownValue.toString());
                  },
                ),
                WidgetTitleAndDropdown(
                  DdbTitle: "Residing Status*",
                  DdbHint: "Select",
                  DbdItems: residingStatusChoose,
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                      r_status = newValue;
                    });
                    // uploadAboutMe("Residing Status", dropdownValue.toString());
                  },
                ),

                DottedBorder(
                  borderType: BorderType.RRect,
                  color: ColorConstant.gray300,
                  strokeWidth: 1,
                  dashPattern: [6, 6],
                  radius: Radius.circular(10),
                  child: Container(
                    width: double.maxFinite,

                    // height: 300,

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 80,
                        ),
                        GestureDetector(
                          onTap: () async {
                            // await PickFile();
                            // await UploadDoc();

                            await pickFileFinal();
                            // uploadDataToAws ();
                          },
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                                color: Colors.blue.shade100,
                                borderRadius: BorderRadius.circular(10)),
                            child: filepath == "abc"
                                ? Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: SvgPicture.asset(
                                      ImageConstant.imgGroup228,
                                      height: 50,
                                    ),
                                  )
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.file(
                                      filee!,
                                      fit: BoxFit.cover,
                                      width: 80,
                                      height: 80,
                                    )),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text("Click Here To Upload Your ID"),
                        SizedBox(
                          height: 80,
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: 40,
                ),
                Text(
                  "Address of Parish / Temple / Mosque",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                WidgetTitleAndDropdown(
                  DdbTitle: "Name of Parish / Temple / Mosque*",
                  DdbHint: "Select",
                  DbdItems: nameofParishChoose,
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                      temple_name = newValue;
                    });
                    // uploadAboutMe("Name of Parish / Temple / Mosque",
                    //     dropdownValue.toString());
                  },
                ),
                WidgetTitleAndDropdown(
                  DdbTitle: "Street*",
                  DdbHint: "Select",
                  DbdItems: cityChoose,
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                      temple_street = newValue;
                    });
                    // uploadAboutMe("Street", dropdownValue.toString());
                  },
                ),
                WidgetTitleAndDropdown(
                  DdbTitle: "Post Code*",
                  DdbHint: "Select",
                  DbdItems: cityChoose,
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                      temple_post_code = newValue;
                    });
                    // uploadAboutMe("Post Code", dropdownValue.toString());
                  },
                ),
                WidgetTitleAndDropdown(
                  DdbTitle: "Country*",
                  DdbHint: "Select",
                  DbdItems: countryChoose,
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                      temple_country = newValue;
                    });
                    // uploadAboutMe("Country", dropdownValue.toString());
                  },
                ),
                WidgetTitleAndDropdown(
                  DdbTitle: "City*",
                  DdbHint: "Select",
                  DbdItems: cityChoose,
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                      temple_city = newValue;
                    });
                    // uploadAboutMe("City", dropdownValue.toString());
                  },
                ),
                Text("Phone Number"),
                const SizedBox(
                  height: 10,
                ),

                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade100,
                        ),
                        child: DropdownButtonFormField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(10)
                              // labelText: "Select"
                              ),
                          // underline: SizedBox(),
                          isExpanded: true,
                          // autofocus: true,

                          dropdownColor: Colors.white,
                          // focusColor: Colors.white,
                          hint: const Text(
                            '+971',
                            style: TextStyle(fontSize: 14),
                          ),
                          // value: dropdownValue,
                          icon: const Icon(Icons.arrow_drop_down),
                          iconSize: 24,
                          // elevation: 16,

                          // onChanged: (String? newValue) {
                          //   setState(() {
                          //     dropdownValue = newValue!;
                          //   });
                          // },

                          onChanged: (value) {
                            setState(() {
                              dropdownValue = value;
                              countryCode = value;
                            });
                          },

                          items: countryCodechoose
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 7,
                      child: TextField(
                          onChanged: (value) {
                            temple_phone_number = value;
                          },
                          // controller: _textFieldController,

                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10),
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
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),

                WidgetTitleAndTextfield(
                  textFieldHint: 'Enter',
                  textFieldTitle: "Diocese*",
                  onChanged: (newValue) {
                    setState(() {
                      // dropdownValue = newValue!;
                      temple_diocese = newValue;
                    });
                    // uploadAboutMe(_detailName[1], dropdownValue.toString());
                  },
                ),
                WidgetTitleAndDropdown(
                  DdbTitle: "Local Admin*",
                  DdbHint: "Select",
                  DbdItems: localAdminChoose,
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                      temple_local_admin = newValue;
                    });
                    // uploadAboutMe("Local Admin", dropdownValue.toString());
                  },
                ),

                Text(
                  "Emergency Contact",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                // WidgetTitleAndDropdown(
                //   DdbTitle: "Name",
                //   DdbHint: "Select",
                //   DbdItems: Dbditems,
                //   onChanged: (String? newValue) {
                //     setState(() {
                //       dropdownValue = newValue!;
                //       emergency_name=newValue;
                //     });
                //     // uploadAboutMe("Emergency Name", dropdownValue.toString());
                //   },
                // ),

                WidgetTitleAndTextfield(
                  textFieldHint: 'Enter',
                  textFieldTitle: "Name*",
                  onChanged: (newValue) {
                    setState(() {
                      // dropdownValue = newValue!;
                      emergency_name = newValue;
                    });
                  },
                ),

                WidgetTitleAndDropdown(
                  DdbTitle: "Type Of Relation",
                  DdbHint: "Select",
                  DbdItems: typeOfRelation,
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                      emergency_relation = newValue;
                    });
                    // uploadAboutMe(
                    //     "Emergency Type of Relation", dropdownValue.toString());
                  },
                ),

                WidgetTitleAndTextfield(
                  textFieldHint: 'Enter',
                  textFieldTitle: "Phone Number*",
                  onChanged: (newValue) {
                    setState(() {
                      // dropdownValue = newValue!;
                      emergency_phone_number = newValue;
                    });
                  },
                ),

                WidgetTitleAndTextfield(
                  textFieldHint: 'Enter',
                  textFieldTitle: "Email ID*",
                  onChanged: (newValue) {
                    setState(() {
                      // dropdownValue = newValue!;
                      emergency_email = newValue;
                    });
                  },
                ),

                WidgetTitleAndDropdown(
                  DdbTitle: "Marital Status",
                  DdbHint: "Select",
                  DbdItems: maritalSts,
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                      emergency_marital_status = newValue;
                    });
                    // uploadAboutMe(
                    //     "Emergency Marital Status", dropdownValue.toString());
                  },
                ),

                WidgetTitleAndTextfield(
                  textFieldHint: 'Enter',
                  textFieldTitle: "Occupationnn*",
                  onChanged: (newValue) {
                    setState(() {
                      // dropdownValue = newValue!;
                      occupations = newValue;
                    });
                  },
                ),

                Container(
                  width: double.maxFinite,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Add More",
                      style: TextStyle(
                          color: Colors.blue.shade700,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        minimumSize: const Size(400, 50),
                        elevation: 0,
                        side: const BorderSide(width: 1, color: Colors.blue),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                  ),
                ),

                SizedBox(
                  height: 300,
                )
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
                      onPressed: () {
                        Navigator.pushNamed(
                            context, AppRoutes.nineThisProfileForWhomScreen);
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
                        print("Uploading Data to aws");

                        uploadDataFilltheform();

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
