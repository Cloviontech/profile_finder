import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:profile_finder/core/utils/color_constant.dart';
import 'package:profile_finder/core/utils/size_utils.dart';
import 'package:profile_finder/presentation/1ProfileFinder/Registeration/10screenFillTheForm.dart';
import 'package:profile_finder/presentation/1ProfileFinder/Registeration/11-0screen_main_screen.dart';
import 'package:profile_finder/routes/app_routes.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/CustomWidgets.dart';
class NineThisProfileForWhomScreen extends StatefulWidget {
  @override
  State<NineThisProfileForWhomScreen> createState() =>
      _NineThisProfileForWhomScreenState();
}

class _NineThisProfileForWhomScreenState
    extends State<NineThisProfileForWhomScreen> {
  TextEditingController groupfiftyfourController = TextEditingController();
  bool checkvalue = true;
  int selected = 0;

  List<bool> checkboxValue1 = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  final bool forMyself = true;
  final bool son = false;
  final bool daughter = false;
  final bool sister = false;
  final bool brother = false;
  final bool relative = false;
  final bool friend = false;

  List<String> relation = [
    'Myself',
    'Son',
    'Daughter',
    'Sister',
    'Brother',
    'Relative',
    'Friend'
  ];

  List<String> leadingIcon = [
    'assets/images/img_music.svg',
    'assets/images/img_user_2.svg',
    'assets/images/img_music_30x30.svg',
    'assets/images/img_user_1.svg',
    'assets/images/img_user_3.svg',
    'assets/images/img_trash.svg',
    'assets/images/img_friend.svg'
  ];

  List<String> data = ["Mathew", "Deon", "Sara", "Yeu"];
  List<String> userChecked = ["default"];

  List<int> userSerial = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
  ];

  void _onSelected(bool selected, String dataName) {
    if (selected == true) {
      setState(() {
        userChecked.clear();
        userChecked.add(dataName);
      });
    } else {
      setState(() {
        // userChecked.remove(dataName);
        userChecked.clear();
      });
    }
  }

  Map<String, bool> values = {
    // 'foo': true,
    // 'bar': false,

    'Myself': true,
    'Son': false,
    'Daughter': false,
    'Sister': false,
    'Brother': false,
    'Relative': false,
    'Friend': true,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteA700,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.maxFinite,
        // color: ColorConstant.clFontOrangeColor,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              D10HCustomClSizedBoxWidget(),
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.eightUploadIDScreen);
                  },
                  child: SvgPicture.asset(
                      'assets/images/img_arrowleft_black_900.svg')),
              Text(
                "This profile for whom?",
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: ColorConstant.blueGray900),
              ),
              Text(
                "Enter Your Basic Details For Better Service",
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: ColorConstant.gray800),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: relation.length,
                  itemBuilder: (context, i) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: CheckboxListTile(
                            value: userChecked.contains(relation[i]),
                            onChanged: (value) {
                              _onSelected(value!, relation[i]);
                            },
                            title: Text(
                              relation[i],
                            ),
                            secondary: SvgPicture.asset(
                              leadingIcon[i],
                            ),
                            // side: BorderSide(),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: BorderSide(
                                    color: userChecked.contains(relation[i]) ==
                                            true
                                        ? ColorConstant.deepPurpleA200
                                        : ColorConstant.gray300)),
                                        checkboxShape: CircleBorder(),


                            //  child: Container(
                            //   decoration: BoxDecoration(
                            //       border: Border.all(
                            //           color:
                            //               userChecked.contains(relation[i]) == true
                            //                   ? ColorConstant.deepPurpleA200
                            //                   : ColorConstant.gray300),
                            //       borderRadius: BorderRadius.circular(10)),
                            //   child: ListTile(
                            //       leading: SvgPicture.asset(
                            //         leadingIcon[i],
                            //       ),
                            //       title: Text(relation[i]),
                            //       trailing: Checkbox(
                            //         shape: CircleBorder(),
                            //         value: userChecked.contains(relation[i]),
                            //         onChanged: (val) {
                            //           _onSelected(val!, relation[i]);
                            //         },
                            //       )
                            //       //you can use checkboxlistTile too
                            //       ),
                            // ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        )
                      ],
                    );
                  }),
              const D10HCustomClSizedBoxWidget(
                height: 20,
              ),
              MyElevatedButton(
                  onPressed: () {
                    if (userChecked[0].toString() == "Myself") {
                      // if(userChecked.) {
                      print(userChecked[0].toString() == "Myself");
                      print("match");
                      print(userChecked[0]);
                      // Navigator.pushNamed(context, AppRoutes.ElevenPrimaryDetailsScreen);

                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ThirteenScreen();
                      }));
                    } else if (userChecked[0].toString() == "Son" ||
                        userChecked[0].toString() == "Son" ||
                        userChecked[0].toString() == "Daughter" ||
                        userChecked[0].toString() == "Sister" ||
                        userChecked[0].toString() == "Brother" ||
                        userChecked[0].toString() == "Relative" ||
                        userChecked[0].toString() == "Friend") {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return TenFillTheFormScreen();
                      }));
                      print(userChecked[0].toString() == "Myself");

                      print("other than myself");
                      print(userChecked[0]);
                    } else {
                      // Navigator.pushNamed(context, AppRoutes.tenFillTheFormScreen);
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) {
                      //   return TenFillTheFormScreen();
                      // }));

                      Fluttertoast.showToast(
                        msg: "Please Select Anyone from above...!",
                        backgroundColor: ColorConstant.deepPurpleA200,
                        textColor: Colors.white,
                        toastLength: Toast.LENGTH_SHORT,
                      );
                      print(userChecked[0].toString() == "Myself");

                      print("not match");
                      print(userChecked[0]);
                    }

                    print(userChecked[0].toString() == "Myself");

                    print("userChecked");
                    print(userChecked[0]);

                    //                 'Myself',
                    // 'Son',
                    // 'Daughter',
                    // 'Sister',
                    // 'Brother',
                    // 'Relative',
                    // 'Friend'
                    // Navigator.pushNamed(context, AppRoutes.tenFillTheFormScreen);
                    // Navigator.pushNamed(context, AppRoutes.ThirteenScreenscr);

                    //     Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) {
                    //     return Iphone1313ProTwelveScreen();
                    //   }),
                    // );

                    //  Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) {
                    //     return ThirteenScreen();
                    //   }),
                    // );
                  },
                  borderRadius: BorderRadius.circular(10),
                  width: double.maxFinite,
                  backgroundColor: Colors.transparent,
                  child: const Text(
                    'Go Next',
                    style: TextStyle(
                      color: Colors.white,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "If don't want to continue now?",
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            color: ColorConstant.clFontGreyColor,
                            fontSize: DeviceSize.itemHeight / 13),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, AppRoutes.fourSignUpScreen);
                          },
                          child: Container(
                            // color: Colors.white,
                            height: 30,
                            child: Center(
                              child: Text(
                                "Logout Now",
                                style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.bold,
                                    color: ColorConstant.deepPurpleA200,
                                    fontSize: DeviceSize.itemHeight / 13),
                                // textAlign: TextAlign.end,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
