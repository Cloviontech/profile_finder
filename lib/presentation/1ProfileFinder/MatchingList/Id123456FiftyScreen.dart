import 'dart:ui';

import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:profile_finder/core/utils/color_constant.dart';
import 'package:profile_finder/core/utils/size_utils.dart';
import 'package:profile_finder/model_final/modelAllUser.dart';
import 'package:profile_finder/presentation/1ProfileFinder/MatchingList/1screen_advertisement.dart';
import 'package:profile_finder/presentation/1ProfileFinder/MatchingList/ChooseYourFiftyTwoScreen.dart';
import 'package:profile_finder/presentation/1ProfileFinder/MatchingList/MatchingListNavigationFourtyEightScreen.dart';
import 'package:profile_finder/presentation/1ProfileFinder/MatchingList/matching_details_fifty_one_screen.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/ClCustomWidgets2.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/CustomWidgets.dart';

class Id123456FiftyScreen extends StatefulWidget {
  int userUidMaLi;

  Id123456FiftyScreen({super.key, required this.userUidMaLi});

  @override
  State<Id123456FiftyScreen> createState() => _Id123456FiftyScreenState();
}

class _Id123456FiftyScreenState extends State<Id123456FiftyScreen> {
  // String userUid = FirebaseAuth.instance.currentUser!.uid;
  List<String> _myInterest = [
    "Reading",
    "Photography",
    "Writing",
    "Paint or drawing"
        "Singing",
    "Dancer"
  ];

  List<String> _myNonInterest = [
    "Reading",
    "Photography",
    "Writing",
    "Paint or drawing"
    // "Singing",
    // "Dancer"
  ];

  List<String> _complexion = [
    "Fair",
    // "Photography",
    // "Writing",
    // "Paint or drawing"
    // "Singing",
    // "Dancer"
  ];

  List<String> _foodTaste = [
    "Sweet",
    "Sour",
    "Spicy",
    // "Paint or drawing"
    // "Singing",
    // "Dancer"
  ];

  bool isLoading = true;

  late final String userUid;

  static late List<UserModel>? _userModel = [];

  @override
  void initState() {
    _getData();

    super.initState();
  }

  //  List <String?> _dataFromListApiKey = [
  //   _userModel!.profession,
  //   _userModel![0].sibling_name,
  //   _userModel![0].profession,
  //   _userModel![0].profession,
  //   _userModel![0].profession,
  //   _userModel![0].profession,
  //   _userModel![0].profession,
  //   _userModel![0].profession,
  //   _userModel![0].profession,

  //   "widget.userUidMaLi.profession",
  //   "sibling_name",
  //   "sibling_relation",
  //   "sibling_occupation",
  //   "education_school",
  //   "education_year",
  //   "education_course",
  //   "company_name",
  //   "position",
  //   "salary_range",
  //   "your_intrest",
  //   "non_intrest",
  //   "complexion",
  //   "food_taste",
  //   "selfie",
  //   "full_size_image",
  //   "horoscope",
  //   "gallery"
  // ];
  List<String> _dataFromListApi = [];

  List<String> splitList(String _inputValue) {
    String out = _inputValue.replaceAll("[", "");
    String out1 = out.replaceAll("]", "");
    String out2 = out1.replaceAll(' ', "");
    String out3 = out2.replaceAll("'", "");

    _dataFromListApi = out3.split(",");
    return _dataFromListApi;
  }

  void _getData() async {
    _userModel = (await ApiService().getUsers())!;
    // Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  String checkContains(String _inputValue) {
    bool _result = false;

    // for (var i = 0; i < _userModel!.length; i++) {
    //   if (_userModel!.elementAt(0) ) {
    //     setState(() {
    //       _result = true;
    //     });
    //   }
    // }

    return _userModel!.elementAt(0).toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ClAppbarLeadArrowBackSuffHeart(
        testingNextPage: MatchingListNavigationFourtyEightScreen(),
      ),
      body: _userModel == null || _userModel!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: DeviceSize.itemHeight / 2,
                          width: DeviceSize.itemWidth / 2.5,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              _userModel![widget.userUidMaLi].selfie.toString(),
                              fit: BoxFit.cover,

                              // 'assets/images/img_rectangle673.png'
                            ),
                          ),
                        ),
                        Container(
                          height: DeviceSize.itemHeight / 2,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: DeviceSize.itemHeight / 6,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: ColorConstant.clPurple05),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      // 'ID:123456',
                                      "ID  :  " +
                                          _userModel![widget.userUidMaLi]
                                              .uid
                                              .toString(),
                                      // "ID  : ${widget.userUidMaLi}",
                                      // getIndex(widget.userUidMaLi.toString()).toString(),
                                      // getIndex("JJ30LIE1RVQ"),
                                      // "test",

                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: DeviceSize.itemHeight / 15),
                                    ),
                                  ),
                                ),
                                Text(
                                  checkContains("uid").toString(),
                                  // "test",
                                  // StringUtils.capitalize(
                                  //     _userModel![widget.userUidMaLi]
                                  //         .address
                                  //         .toString()),
                                  style: TextStyle(
                                    // fontWeight: FontWeight.bold,
                                    fontSize: DeviceSize.itemHeight / 15,
                                  ),
                                ),
                                Text(
                                  // 'Life is full of possibility',
                                  StringUtils.capitalize(
                                      _userModel![widget.userUidMaLi]
                                          .profileTag
                                          .toString()),
                                  style: TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      fontSize: DeviceSize.itemHeight / 12,
                                      color: ColorConstant.clPurple5),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: DeviceSize.itemHeight / 10,
                    ),
                    Container(
                      height: DeviceSize.itemHeight / 1.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        // color: ColorConstant.clPurple05,
                        gradient: LinearGradient(
                            begin: Alignment(-1, 0),
                            end: Alignment(1, 0),
                            colors: [
                              ColorConstant.clPurple05,
                              ColorConstant.whiteA700,
                            ],
                            transform: GradientRotation(0.15)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CircularPercentIndicator(
                                  radius: DeviceSize.itemHeight / 5,
                                  progressColor: Colors.green,
                                  percent: 0.8,
                                  center: Text(
                                    '80%',
                                    style: TextStyle(
                                        color:
                                            ColorConstant.clFontDarkBlueColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: DeviceSize.itemHeight / 12),
                                  ),
                                ),
                                const D10WCustomClSizedBoxWidget(),
                                Text(
                                  'Matching Score',
                                  style: TextStyle(
                                      color: ColorConstant.clFontDarkBlueColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: DeviceSize.itemHeight / 15),
                                ),
                              ],
                            ),
                            // UnderlineTextWidgetCustomCl(text: 'View Details', fontWeight: FontWeight.normal, borderWidth: 1,),

                            GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) {
                                      return MatchingDetailsFiftyOneScreen();
                                    }),
                                  );
                                },
                                child: UnderlineTextNoBoldWidgetCustomCl(
                                  string: 'View Details',
                                )),
                          ],
                        ),
                      ),
                    ),
                    D10HCustomClSizedBoxWidget(),
                    Container(
                      height: DeviceSize.itemHeight,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        // color: ColorConstant.clPurple05,
                        gradient: LinearGradient(
                            begin: Alignment(0, -1),
                            end: Alignment(0, 1),
                            colors: [
                              ColorConstant.clPurple05,
                              ColorConstant.whiteA700,
                            ],
                            transform: GradientRotation(0.15)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Need to contact here?',
                            style: TextStyle(
                                color: ColorConstant.clFontDarkBlueColor,
                                fontWeight: FontWeight.bold,
                                fontSize: DeviceSize.itemHeight / 10),
                          ),
                          Text(
                            'Click here To Subscribe For More Details',
                            style: TextStyle(
                                // fontWeight: FontWeight.bold,
                                fontSize: DeviceSize.itemHeight / 15),
                          ),
                          MyElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return ChooseYourFiftyTwoScreen();
                                  }),
                                );
                              },
                              borderRadius: BorderRadius.circular(10),
                              width: DeviceSize.itemWidth / 1.2,
                              height: DeviceSize.itemHeight / 5,
                              backgroundColor: Colors.transparent,
                              child: Text(
                                'Subscribe',
                              )),
                        ],
                      ),
                    ),
                    Text(
                      'About Me',
                      style: TextStyle(
                          color: ColorConstant.clFontDarkBlueColor,
                          fontWeight: FontWeight.bold,
                          fontSize: DeviceSize.itemHeight / 10),
                    ),
                    D10HCustomClSizedBoxWidget(),
                    Text(
                      // """simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only""",
                      _userModel![widget.userUidMaLi].aboutCandidate.toString(),
                      style: TextStyle(
                          height: 1.5,
                          color: ColorConstant.clFontGreyColor,
                          // fontWeight: FontWeight.bold,
                          fontSize: DeviceSize.itemHeight / 13),
                    ),
                    D10HCustomClSizedBoxWidget(),
                    Text(
                      'Current Status',
                      style: TextStyle(
                          color: ColorConstant.clFontDarkBlueColor,
                          fontWeight: FontWeight.bold,
                          fontSize: DeviceSize.itemHeight / 10),
                    ),
                    D10HCustomClSizedBoxWidget(),
                    Text(
                      // """simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only""",
                      _userModel![widget.userUidMaLi].currentStatus.toString(),
                      style: TextStyle(
                          height: 1.5,
                          // fontWeight: FontWeight.bold,
                          color: ColorConstant.clFontGreyColor,
                          fontSize: DeviceSize.itemHeight / 13),
                    ),
                    D10HCustomClSizedBoxWidget(),
                    Text(
                      'Contact Details',
                      style: TextStyle(
                          color: ColorConstant.clFontDarkBlueColor,
                          fontWeight: FontWeight.bold,
                          fontSize: DeviceSize.itemHeight / 10),
                    ),
                    Container(
                      height: DeviceSize.itemHeight / 1.5,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        // color: ColorConstant.clPurple05,
                        gradient: LinearGradient(
                            begin: Alignment(0, -1),
                            end: Alignment(0, 1),
                            colors: [
                              ColorConstant.clPurple05,
                              ColorConstant.whiteA700,
                              ColorConstant.whiteA700,
                            ],
                            transform: GradientRotation(0.15)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Need to Know?',
                            style: TextStyle(
                                color: ColorConstant.clFontDarkBlueColor,
                                fontWeight: FontWeight.bold,
                                fontSize: DeviceSize.itemHeight / 10),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Click here To ',
                                style: TextStyle(
                                    // fontWeight: FontWeight.bold,
                                    fontSize: DeviceSize.itemHeight / 15),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) {
                                      return ChooseYourFiftyTwoScreen();
                                    }),
                                  );
                                },
                                child: UnderlineTextNoBoldWidgetCustomClAdj(
                                  text: 'Subscribe',
                                  textColor:
                                      ColorConstant.clPurpleUnderlineFontColor,
                                ),
                              ),
                              Text(
                                ' For More Details',
                                style: TextStyle(
                                    // fontWeight: FontWeight.bold,
                                    fontSize: DeviceSize.itemHeight / 15),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: DeviceSize.itemHeight / 10,
                    ),
                    TextContainerTwoLineWidgetCustomCl(
                      text1: 'Height (cm)',
                      text2: _userModel![widget.userUidMaLi].height.toString(),
                      containerHeight: DeviceSize.itemHeight / 2,
                    ),

                    TextContainerTwoLineWidgetCustomCl(
                      text1: 'Weight (Kg)',
                      text2: _userModel![widget.userUidMaLi].weight.toString(),
                      containerHeight: DeviceSize.itemHeight / 2,
                    ),

                    TextContainerTwoLineWidgetCustomCl(
                      text1: 'Age',
                      text2: _userModel![widget.userUidMaLi].age.toString(),
                      containerHeight: DeviceSize.itemHeight / 2,
                    ),

                    TextContainerTwoLineWidgetCustomCl(
                      text1: 'Blood Type',
                      text2: StringUtils.capitalize(
                          _userModel![widget.userUidMaLi]
                              .bloodGroup
                              .toString()),
                      containerHeight: DeviceSize.itemHeight / 2,
                    ),

                    TextContainerTwoLineWidgetCustomCl(
                      text1: 'Civil Status',
                      text2: _userModel![widget.userUidMaLi]
                          .maritalStatus
                          .toString(),
                      containerHeight: DeviceSize.itemHeight / 2,
                    ),

                    TextContainerTwoLineWidgetCustomCl(
                      text1: 'Religion',
                      text2: StringUtils.capitalize(
                          _userModel![widget.userUidMaLi].religion.toString()),
                      containerHeight: DeviceSize.itemHeight / 2,
                    ),

                    BlurTextContainerTwoLineWidgetCustomCl(
                      text1: 'Heightaaaaaaa',
                      text2: '180-190ddddddddddddd',
                      containerHeight: DeviceSize.itemHeight / 2,
                    ),
                    BlurTextContainerTwoLineWidgetCustomCl(
                      text1: 'Heightaaaaaaa',
                      text2: '180-190ddddddddddddd',
                      containerHeight: DeviceSize.itemHeight / 2,
                    ),
                    BlurTextContainerTwoLineWidgetCustomCl(
                      text1: 'Heightaaaaaaa',
                      text2: '180-190ddddddddddddd',
                      containerHeight: DeviceSize.itemHeight / 2,
                    ),

                    // TextContainerTwoLineWidgetCustomCl(
                    //   text1: 'Profession',
                    //   // text2: StringUtils.capitalize(
                    //   //     _userModel![widget.userUidMaLi]
                    //   //         .profession
                    //   //         .toString()),
                    //   text2: StringUtils.capitalize(splitList(
                    //     _userModel![widget.userUidMaLi]
                    //           .profession
                    //           .toString()
                    //   )),
                    //   containerHeight: DeviceSize.itemHeight / 2,
                    // ),

                    TextContainerTwoLineFromListWidgetCustomCl(
                      text1: 'Profession',
                      text2: splitList(_userModel![widget.userUidMaLi]
                          .profession
                          .toString()),
                      containerHeight: DeviceSize.itemHeight / 2,
                    ),

                    TextContainerTwoLineWidgetCustomCl(
                      text1: 'Orphan',
                      text2: StringUtils.capitalize(
                          _userModel![widget.userUidMaLi].orphan.toString()),
                      containerHeight: DeviceSize.itemHeight / 2,
                    ), //

                    Text(
                      'Family Details',
                      style: TextStyle(
                          color: ColorConstant.clFontDarkBlueColor,
                          fontWeight: FontWeight.bold,
                          fontSize: DeviceSize.itemHeight / 10),
                    ),
                    SizedBox(
                      height: DeviceSize.itemHeight / 20,
                    ),

                    TextContainerTwoLineWidgetCustomCl(
                      text1: 'Father Name',
                      text2: StringUtils.capitalize(
                          _userModel![widget.userUidMaLi]
                              .fatherName
                              .toString()),
                      containerHeight: DeviceSize.itemHeight / 2,
                    ),

                    TextContainerTwoLineWidgetCustomCl(
                      text1: 'Father Native Place',
                      text2: StringUtils.capitalize(
                          _userModel![widget.userUidMaLi]
                              .fatherCity
                              .toString()),
                      containerHeight: DeviceSize.itemHeight / 2,
                    ),

                    TextContainerTwoLineWidgetCustomCl(
                      text1: 'Father Job',
                      text2: StringUtils.capitalize(
                          _userModel![widget.userUidMaLi].fatherJob.toString()),
                      containerHeight: DeviceSize.itemHeight / 2,
                    ),

                    TextContainerTwoLineWidgetCustomCl(
                      text1: 'Mother Name',
                      text2: StringUtils.capitalize(
                          _userModel![widget.userUidMaLi]
                              .motherName
                              .toString()),
                      containerHeight: DeviceSize.itemHeight / 2,
                    ),

                    TextContainerTwoLineWidgetCustomCl(
                      text1: 'Mother Native Place',
                      text2: StringUtils.capitalize(
                          _userModel![widget.userUidMaLi]
                              .motherCity
                              .toString()),
                      containerHeight: DeviceSize.itemHeight / 2,
                    ),

                    TextContainerTwoLineWidgetCustomCl(
                      text1: 'Mother Job',
                      text2: StringUtils.capitalize(
                          _userModel![widget.userUidMaLi].motherJob.toString()),
                      containerHeight: DeviceSize.itemHeight / 2,
                    ),

                    TextContainerTwoLineWidgetCustomCl(
                      text1: 'Mother Family Name',
                      text2: StringUtils.capitalize(
                          _userModel![widget.userUidMaLi]
                              .motherFamilyName
                              .toString()),
                      containerHeight: DeviceSize.itemHeight / 2,
                    ),

                    Text(
                      'sibiling Detailss',
                      style: TextStyle(
                          color: ColorConstant.clFontDarkBlueColor,
                          fontWeight: FontWeight.bold,
                          fontSize: DeviceSize.itemHeight / 10),
                    ),

                    SizedBox(
                      height: DeviceSize.itemHeight / 20,
                    ),

                    TextContainerMultiLineFromListWidgetCustomCl(
                      containerHeight: DeviceSize.itemHeight / 2,
                      heading1: 'Name',
                      heading2: "Type Of Relation",
                      heading3: "Course/Degree",
                      value1: splitList(_userModel![widget.userUidMaLi]
                          .siblingName
                          .toString()),
                      value2: splitList(_userModel![widget.userUidMaLi]
                          .siblingRelation
                          .toString()),
                      value3: splitList(_userModel![widget.userUidMaLi]
                          .siblingOccupation
                          .toString()),
                    ),

                    SizedBox(
                      height: DeviceSize.itemHeight / 20,
                    ),
                    Text(
                      'Educations',
                      style: TextStyle(
                          color: ColorConstant.clFontDarkBlueColor,
                          fontWeight: FontWeight.bold,
                          fontSize: DeviceSize.itemHeight / 10),
                    ),

                    TextContainerMultiLineFromListWidgetCustomCl(
                      containerHeight: DeviceSize.itemHeight / 2,
                      heading1: 'School Name',
                      heading2: "School Year",
                      heading3: "Course/Degree",
                      value1: splitList(_userModel![widget.userUidMaLi]
                          .educationSchool
                          .toString()),
                      value2: splitList(_userModel![widget.userUidMaLi]
                          .educationYear
                          .toString()),
                      value3: splitList(_userModel![widget.userUidMaLi]
                          .educationCourse
                          .toString()),
                    ),

                    SizedBox(
                      height: DeviceSize.itemHeight / 20,
                    ),

                    Text(
                      'Work Experience',
                      style: TextStyle(
                          color: ColorConstant.clFontDarkBlueColor,
                          fontWeight: FontWeight.bold,
                          fontSize: DeviceSize.itemHeight / 10),
                    ),

                    SizedBox(
                      height: DeviceSize.itemHeight / 20,
                    ),
                    TextContainerMultiLineFromListWidgetCustomCl(
                      containerHeight: DeviceSize.itemHeight / 2,
                      heading1: 'Company Name',
                      heading2: "Position",
                      heading3: "Tenure (Month)",
                      value1: splitList(_userModel![widget.userUidMaLi]
                          .companyName
                          .toString()),
                      value2: splitList(
                          _userModel![widget.userUidMaLi].position.toString()),
                      value3: splitList(_userModel![widget.userUidMaLi]
                          .salaryRange
                          .toString()),
                    ),

                    SizedBox(
                      height: DeviceSize.itemHeight / 20,
                    ),
                    Text(
                      'My Interest',
                      style: TextStyle(
                          color: ColorConstant.clFontDarkBlueColor,
                          fontWeight: FontWeight.bold,
                          fontSize: DeviceSize.itemHeight / 10),
                    ),
                    SizedBox(
                      height: DeviceSize.itemHeight / 20,
                    ),

                    TagSimpleWidgetCustomCl(
                        myInterest: splitList(_userModel![widget.userUidMaLi]
                            .yourIntrest
                            .toString())),

                    SizedBox(
                      height: DeviceSize.itemHeight / 10,
                    ),

                    Text(
                      'My Non-Interest',
                      style: TextStyle(
                          color: ColorConstant.clFontDarkBlueColor,
                          fontWeight: FontWeight.bold,
                          fontSize: DeviceSize.itemHeight / 10),
                    ),

                    SizedBox(
                      height: DeviceSize.itemHeight / 20,
                    ),

                    TagSimpleWidgetCustomCl(
                        myInterest: splitList(_userModel![widget.userUidMaLi]
                            .nonIntrest
                            .toString())),
                    SizedBox(
                      height: DeviceSize.itemHeight / 10,
                    ),

                    Text(
                      'Complexion',
                      style: TextStyle(
                          color: ColorConstant.clFontDarkBlueColor,
                          fontWeight: FontWeight.bold,
                          fontSize: DeviceSize.itemHeight / 10),
                    ),
                    SizedBox(
                      height: DeviceSize.itemHeight / 20,
                    ),

                    TagSimpleWidgetCustomCl(
                        myInterest: splitList(_userModel![widget.userUidMaLi]
                            .complexion
                            .toString())),
                    SizedBox(
                      height: DeviceSize.itemHeight / 10,
                    ),

                    Text(
                      'Food Taste',
                      style: TextStyle(
                          color: ColorConstant.clFontDarkBlueColor,
                          fontWeight: FontWeight.bold,
                          fontSize: DeviceSize.itemHeight / 10),
                    ),
                    SizedBox(
                      height: DeviceSize.itemHeight / 20,
                    ),

                    TagSimpleWidgetCustomCl(
                        myInterest: splitList(_userModel![widget.userUidMaLi]
                            .foodTaste
                            .toString())),

                    SizedBox(
                      height: DeviceSize.itemHeight / 10,
                    ),

                    Text(
                      'Head Size',
                      style: TextStyle(
                          color: ColorConstant.clFontDarkBlueColor,
                          fontWeight: FontWeight.bold,
                          fontSize: DeviceSize.itemHeight / 10),
                    ),
                    SizedBox(
                      height: DeviceSize.itemHeight / 20,
                    ),
                    Container(
                      height: DeviceSize.itemHeight * 1.3,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green,
                          image: DecorationImage(
                              image: NetworkImage(
                                  _userModel![widget.userUidMaLi]
                                      .selfie
                                      .toString()),

                              // AssetImage(
                              //   'assets/images/img_portraityoung.png',
                              // ),

// "C:\Flutter projects\Saran\Official\Marriyo\Marriyo_17_May\marriyo_17_may\assets\images\Mask group.png"
                              // "C:\Flutter projects\Saran\Official\Marriyo\Marriyo_17_May\marriyo_17_may\assets\images\img_portraityoung.png"
                              fit: BoxFit.cover // profile pic
                              )),
                    ),
                    SizedBox(
                      height: DeviceSize.itemHeight / 10,
                    ),
                    Text(
                      'Full Size',
                      style: TextStyle(
                          color: ColorConstant.clFontDarkBlueColor,
                          fontWeight: FontWeight.bold,
                          fontSize: DeviceSize.itemHeight / 10),
                    ),
                    SizedBox(
                      height: DeviceSize.itemHeight / 20,
                    ),
                    Container(
                      height: DeviceSize.itemHeight * 1.3,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green,
                          image: DecorationImage(
                              image: NetworkImage(
                                  _userModel![widget.userUidMaLi]
                                      .selfie
                                      .toString()),
                              fit: BoxFit.cover // profile pic
                              )),
                    ),
                    D10HCustomClSizedBoxWidget(),

                    Container(
                      height: DeviceSize.itemHeight * 0.6,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        // color: ColorConstant.clPurple05,
                        gradient: LinearGradient(
                            begin: Alignment(0, -1),
                            end: Alignment(0, 1),
                            colors: [
                              ColorConstant.clPurple05,
                              ColorConstant.clPurple05,
                              ColorConstant.whiteA700,
                              ColorConstant.whiteA700,
                            ],
                            transform: GradientRotation(0)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Horoscope',
                            style: TextStyle(
                                color: ColorConstant.clFontDarkBlueColor,
                                fontWeight: FontWeight.bold,
                                fontSize: DeviceSize.itemHeight / 10),
                          ),
                          Text(
                            'Need to Know?',
                            style: TextStyle(
                                color: ColorConstant.clFontDarkBlueColor,
                                fontWeight: FontWeight.bold,
                                fontSize: DeviceSize.itemHeight / 10),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Click here To ',
                                style: TextStyle(
                                    // fontWeight: FontWeight.bold,
                                    fontSize: DeviceSize.itemHeight / 15),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) {
                                      return ChooseYourFiftyTwoScreen();
                                    }),
                                  );
                                },
                                child: UnderlineTextNoBoldWidgetCustomClAdj(
                                  text: 'Subscribe',
                                  textColor:
                                      ColorConstant.clPurpleUnderlineFontColor,
                                ),
                              ),
                              Text(
                                ' For More Details',
                                style: TextStyle(
                                    // fontWeight: FontWeight.bold,
                                    fontSize: DeviceSize.itemHeight / 15),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    D10HCustomClSizedBoxWidget(),
                    Container(
                      height: DeviceSize.itemHeight * 0.6,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        // color: ColorConstant.clPurple05,
                        gradient: LinearGradient(
                            begin: Alignment(0, -1),
                            end: Alignment(0, 1),
                            colors: [
                              ColorConstant.clPurple05,
                              ColorConstant.clPurple05,
                              ColorConstant.whiteA700,
                              ColorConstant.whiteA700,
                            ],
                            transform: GradientRotation(0)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Gallery',
                            style: TextStyle(
                                color: ColorConstant.clFontDarkBlueColor,
                                fontWeight: FontWeight.bold,
                                fontSize: DeviceSize.itemHeight / 10),
                          ),
                          Text(
                            'Need to Know?',
                            style: TextStyle(
                                color: ColorConstant.clFontDarkBlueColor,
                                fontWeight: FontWeight.bold,
                                fontSize: DeviceSize.itemHeight / 10),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Click here To ',
                                style: TextStyle(
                                    // fontWeight: FontWeight.bold,
                                    fontSize: DeviceSize.itemHeight / 15),
                              ),
                              GestureDetector(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return ChooseYourFiftyTwoScreen();
                                  }),
                                ),
                                child: UnderlineTextNoBoldWidgetCustomClAdj(
                                  text: 'Subscribe',
                                  textColor:
                                      ColorConstant.clPurpleUnderlineFontColor,
                                ),
                              ),
                              Text(
                                ' For More Details',
                                style: TextStyle(
                                    // fontWeight: FontWeight.bold,
                                    fontSize: DeviceSize.itemHeight / 15),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const D10HCustomClSizedBoxWidget(),

                    MatchingListImageHorizontalListView(
                      // Must Omit leftTitle, when you give leftBigTitle
                      leftTitle: "",
                      leftSubTitle: "",
                      rightTitle: "View All",
                      leftBigTitle: 'Other Choices',
                      imageWord1: "_allUsers",
                      imageWord2: "Dubai, United Arab Emirates",

                      // imageWord2: _userModel![1].address.toString(),
                      imageWord3: "Life is full of Possibility",
                      imageWord4: "Online",
                      listLength: _userModel!.length,
                      imageAddress: _userModel![0].selfie.toString(),
                      listType: 'Related List',
                    ),

                    // const HorizontalImageViewNoTextWidgetCl(
                    //   fireFolder: 'MatchingList',
                    //   userUid: "userUid",
                    // ),

                    SizedBox(
                      height: DeviceSize.itemHeight,
                    ),
                  ],
                ),
              ),
            ),
      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.all(20),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       Expanded(
      //         flex: 10,
      //         child: MyElevatedButton(
      //           height: DeviceSize.itemHeight/3.5,
      //             onPressed: () {},
      //             borderRadius: BorderRadius.circular(10),
      //             width: double.maxFinite,
      //             backgroundColor: Colors.transparent,
      //             child: Row(
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               children: [
      //                 SvgPicture.asset('assets/images/img_volume_deep_purple_a200.svg', color: Colors.white,),
      //                 SizedBox(width: DeviceSize.itemWidth/20,),
      //                 Text(
      //                   'Say Hi',
      //                 ),
      //               ],
      //             )),
      //       ),

      //       Expanded(
      //         flex: 1,
      //         child: SizedBox(
      //             height: DeviceSize.itemHeight / 10,
      //           ),
      //       ),
      //       Expanded(
      //         flex: 10,
      //         child: MyElevatedButtonWithBorderColor(
      //           height: DeviceSize.itemHeight/3.5,
      //             onPressed: () {},
      //             borderRadius: BorderRadius.circular(10),
      //             width: double.maxFinite,
      //             backgroundColor: Colors.white,
      //             child: Row(
      //                mainAxisAlignment: MainAxisAlignment.center,
      //               children: [
      //                 SvgPicture.asset('assets/images/img_volume_deep_purple_a200.svg'),
      //                 SizedBox(width: DeviceSize.itemWidth/20,),

      //                 Text(
      //                   'Hi Later', style: TextStyle(
      //                     color: ColorConstant.clPurple5,
      //                 // fontWeight: FontWeight.bold,
      //            fontSize: DeviceSize.itemHeight/15),
      //                 ),
      //               ],
      //             )),
      //       ),

      //     ],
      //   ),
      // ),
    );
  }
}
