import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:profile_finder/presentation/1ProfileFinder/Registeration/11-1screen_primary_details.dart';
import 'package:profile_finder/presentation/1ProfileFinder/Registeration/11-2screenFamily_details.dart';
import 'package:profile_finder/presentation/1ProfileFinder/Registeration/11-3screen_contact_details.dart';
import 'package:resizable_widget/resizable_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:http/http.dart' as http;

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);


// var borderColor = Colors.blue[300];
// color: borderColor as Color;
Color? borderColor;

class ThirteenScreen extends StatefulWidget {

  final String registerForWhom;

  const ThirteenScreen({super.key, required this.registerForWhom});


  @override
  State<ThirteenScreen> createState() => _ThirteenScreenState();
}

class _ThirteenScreenState extends State<ThirteenScreen> {
  PageController _pageController = PageController();

  TextEditingController groupeightythreController = TextEditingController();

  TextEditingController groupeightytwoController = TextEditingController();

  String? valueChoose;

  List<String> _dropdownItemList = ["Item One", "Item Two", "Item Three"];

  List<String> _dropdownItemListtwo = ["Item One", "Item Two", "Item Three"];


  @override
  void initState() {
    borderColor = Colors.black;
    super.initState();
  }


  late String whyShouldMarry;
  late String exactDecision;
  late String school;
  late String date;
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
  // late String phone_number;
  late String temple_diocese;
  late String temple_local_admin;
  late String emergency_name;
  late String emergency_relation;
  late String emergency_phone_number;
  // late String email;

  // late String emergency_marital_status;
  // late String occupations;

  // final ImagePicker imagePicker = ImagePicker();
  // List<XFile>? imageFileList = [];

  // void selectImages() async {
  //   final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
  //   if (selectedImages!.isNotEmpty) {
  //     imageFileList!.addAll(selectedImages);
  //   }
  //   print("Image List Length:" + imageFileList!.length.toString());
  //   setState(() {});
  // }


  // final ImagePicker imgpicker = ImagePicker();
  // List<XFile>? imagefiles;

  // openImages() async {
  //   try {
  //     var pickedfiles = await imgpicker.pickMultiImage();
  //     //you can use ImageCourse.camera for Camera capture
  //     if (pickedfiles != null) {

  //       setState(() {
  //          imagefiles = pickedfiles;
  //       });
  //     } else {
  //       print("No image is selected.");
  //     }
  //   } catch (e) {
  //     print("error while picking file.");
  //   }
  // }



  bool? areYouWorkingNowYes = true;
  bool? areYouWorkingNowNo = false;

  bool isSelected = false;

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



  saveToSharedPrefferences(String nameOfID, String valueToSave) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setString(nameOfID, valueToSave);
  }

  List <int> currentPage = [0,1,2,3,4];


 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: ColorConstant.fromHex('#ffffff'),
      // backgroundColor: Color.fromARGB(255, 255, 255, 255),
      // backgroundColor: Colors.red,

      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PageView(
            controller: _pageController,
            children: [
               ThirteenScreenPrimaryDetails(changePage: () { 

                 _pageController.animateToPage(2,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.bounceOut);

                },
                //  pageNo: null,
                ),
              Thirteen_Screen_Family_DetailsScreen(),
              const ThirteenScreenContactDetails(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 120),
            child: Container(
              height: 10,
              width: 100,
              // color: Colors.yellow,
              child: Center(
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: 3,
                  effect: const ExpandingDotsEffect(
                      dotHeight: 10, dotWidth: 10, activeDotColor: Colors.blue),
                  onDotClicked: (index) {
                    _pageController.animateToPage(index,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.bounceOut);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: Column(
      //   mainAxisAlignment: MainAxisAlignment.end,
      //   children: [
      //     Container(
              
      //           child: Padding(
      //             padding: const EdgeInsets.all(10.0),
      //             child: SvgPicture.asset(
      //               "assets/images/img_arrowleft_deep_purple_a200.svg",
      //               // width: 75,
      //               // height: 75,
      //             ),
      //           ),
      //           decoration: BoxDecoration(
      //               border: Border.all(color: Colors.indigo),
      //               // color: Colors.red,
      //               borderRadius: BorderRadius.circular(8)),
      //           height: 45,
      //           width: 45,
      //         ),
      //         SizedBox(height: 30,)
      //   ],
      // ),


      
      // bottomSheet: Padding(
      //   padding:
      //       const EdgeInsets.only(left: 20, bottom: 30, right: 20, top: 10),
      //   child: Container(
      //     child: Padding(
      //       padding: const EdgeInsets.all(10.0),
      //       child: SvgPicture.asset(
      //         "assets/images/img_arrowleft_deep_purple_a200.svg",
      //         // width: 75,
      //         // height: 75,
      //       ),
      //     ),
      //     decoration: BoxDecoration(
      //         border: Border.all(color: Colors.indigo),
      //         // color: Colors.red,
      //         borderRadius: BorderRadius.circular(8)),
      //     height: 45,
      //     width: 45,
      //   ),
      // ),
    );
  }

  

  // Widget _chip(String data, BuildContext context) => ChoiceChip(
  //       labelPadding:
  //           const EdgeInsets.only(top: 5, bottom: 5, left: 15, right: 15),
  //       label: Text(
  //         data,
  //         style: Theme.of(context)
  //             .textTheme
  //             .bodyText2!
  //             .copyWith(color: Colors.black, fontSize: 14),
  //       ),
  //       selectedColor: Colors.white,
  //       disabledColor: Colors.white,
  //       selected: true,
  //       elevation: 0,
  //       padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
  //       onSelected: (value) {
  //         setState(() {
  //           borderColor = Colors.blue;
  //         });
  //       },
  //       side: BorderSide(width: 2, color: borderColor!),
  //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  //     );

  // void _printResizeInfo(List<WidgetSizeInfo> dataList) {
  //   // ignore: avoid_print
  //   print(dataList.map((x) => '(${x.size}, ${x.percentage}%)').join(", "));
  // }
}
