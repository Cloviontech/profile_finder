import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:profile_finder/core/utils/color_constant.dart';
import 'package:profile_finder/core/utils/size_utils.dart';
import 'package:profile_finder/presentation/1ProfileFinder/MatchingList/Id123456FiftyScreen.dart';
import 'package:profile_finder/presentation/1ProfileFinder/Registeration/3ScreenSignin.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/CustomWidgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../model_final/blockedProfByMe1.dart';
import '../../model_final/blocked_users_by_me.dart';
import '../../model_final/model_all_male_7.dart';
import '../../presentation/1ProfileFinder/MatchingList/1screen_advertisement.dart';
import '../../presentation/1ProfileFinder/MatchingList/every_male_fourty_nine_screen/EveryMaleFourtyNineScreen.dart';

class ClAppbarLeadGridSuffHeart extends StatelessWidget
    implements PreferredSizeWidget {
  // final String? testingNextPage;
  final Widget testingNextPage;

  const ClAppbarLeadGridSuffHeart({super.key, required this.testingNextPage});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: GestureDetector(
        onTap: (() {
          Drawer;
        }),
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: SvgPicture.asset(
            'assets/images/img_grid.svg',
          ),
        ),
      ),
      // leadingWidth: DeviceSize.itemWidth /2.7067,
      leadingWidth: 45,
      actions: [
        InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return testingNextPage;
            }));
          },
          child: Row(
            children: [
              SvgPicture.asset('assets/images/img_heartline.svg'),
              SvgPicture.asset('assets/images/img_notification.svg'),
              const SizedBox(
                width: 20,
              )
            ],
          ),
        )
      ],
      elevation: 0,
    );
  }
}

class ClAppbarLeadArrowBackSuffHeart extends StatelessWidget
    implements PreferredSizeWidget {
  ClAppbarLeadArrowBackSuffHeart(
      {super.key,
      required this.testingNextPage,
      this.leftIcon = const Icon(
        Icons.arrow_back_ios,
        color: Colors.black,
      )});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  final Widget testingNextPage;
  Widget leftIcon;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      // backgroundColor: ColorConstant.whiteA700,
      backgroundColor: Colors.transparent,
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Center(child: leftIcon),
      ),
      actions: [
        InkWell(
          onTap: () {
            //  Navigator.pushNamed(context, testingNextPage);

            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return testingNextPage;
            }));
          },
          child: Row(
            children: [
              SvgPicture.asset('assets/images/img_heartline.svg'),
              SvgPicture.asset('assets/images/img_notification.svg'),
              const SizedBox(
                width: 20,
              )
            ],
          ),
        )
      ],
      elevation: 0,
    );
  }
}

class ClAppbarLeadArrowBackSuffNo extends StatelessWidget
    implements PreferredSizeWidget {
  const ClAppbarLeadArrowBackSuffNo({
    super.key,
    this.title,
  });

  final String? title;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // backgroundColor: ColorConstant.whiteA700,
      backgroundColor: Colors.transparent,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: ColorConstant.black900,
            size: 16,
          )),
      title: Text(
        title.toString(),
        style: const TextStyle(color: Colors.black),
      ),
      centerTitle: true,

      elevation: 0,
    );
  }
}

class ClAppbarLeadProfilePicSuffHeart extends StatelessWidget
    implements PreferredSizeWidget {
  // final String? testingNextPage;
  final Widget testingNextPage;

  const ClAppbarLeadProfilePicSuffHeart(
      {super.key, required this.testingNextPage});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Image.asset('assets/images/Ellipse24.png')),
      // leadingWidth: DeviceSize.itemWidth /2.7067,
      leadingWidth: 45,
      actions: [
        InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return testingNextPage;
            }));
          },
          child: Row(
            children: [
              SvgPicture.asset('assets/images/img_heartline.svg'),
              SvgPicture.asset('assets/images/img_notification.svg'),
              const SizedBox(
                width: 20,
              )
            ],
          ),
        )
      ],
      elevation: 0,
    );
  }
}

class CustomClCheckboxtile extends StatefulWidget {
  final String title;
  final bool value;
  final onChanged;

  const CustomClCheckboxtile(
      {super.key, required this.title, required this.value, this.onChanged});

  @override
  State<CustomClCheckboxtile> createState() => _CustomClCheckboxtileState();
}

class _CustomClCheckboxtileState extends State<CustomClCheckboxtile> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
        title: Text(widget.title),
        side: BorderSide.none,
        checkboxShape: const CircleBorder(side: BorderSide(width: 1)),
        secondary: SvgPicture.asset(
          'assets/images/img_frame2.svg',
          width: 20,
        ),
        autofocus: false,
        activeColor: ColorConstant.clPurple5,
        checkColor: Colors.white,
        // tileColor: Colors.red,
        selected: widget.value,
        // focusNode: FocusNode(),
        value: widget.value,
        onChanged: widget.onChanged);
  }
}

class ClProfilePictureWithCover extends StatelessWidget {
  const ClProfilePictureWithCover({
    super.key,
    required this.itemHeight,
    required this.profilePicturepath,
    required this.coverPicturepath,
    required this.name,
    required this.place, 
    required this.onPressed, 
    required this.hire, required this.elevatedButtonText, 

    // required this.onPressed, 
    // required this.buttonData, 
    // required this.onTapHirePi,
    
  });

  final double itemHeight;
  final String profilePicturepath;
  final String coverPicturepath;
  final String name;
  final String place;
  final VoidCallback? onPressed;
  final bool hire;
  final String elevatedButtonText;
  //  final Future<void> Function() onPressed; // Async callback

    
  // final  onTapHirePi;
  // final Function(String) onPressed; // Callback that takes a String parameter
  // final String buttonData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade300)),
        height: itemHeight * 2.5,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                Container(
                  // cover pic
                  height: 200,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.orange,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      coverPicturepath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 150,
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                    image: DecorationImage(
                      image: AssetImage(profilePicturepath),
                    )),
              ),
            ),
            Positioned(
              top: 260,
              bottom: 30,
              child: Column(
                // mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(place),
                  SvgPicture.asset(
                    'assets/images/img_ticket.svg',
                    height: 25,
                  ),
                  MyElevatedButton(
                    onPressed: onPressed,
                    // onPressed: onTapHirePi,
      //               onPressed: () {
      //   onPressed(buttonData); // Pass the buttonData to the onPressed callback
      // },
        //              onPressed: () async {
        // await onPressed(); // Await the async function call
      // },
      //  onPressed: onPressed, // Directly assign the async function to onPressed
                   
                    
                    
                    borderRadius: BorderRadius.circular(10),
                    backgroundColor: Colors.transparent,
                    height: 40,
                    child: 
                    
                    // hire ? Text( "Hired",
                    //  style: TextStyle(
                    //             color: ColorConstant.clWhite),
                         
                    // ): 
                    
                    Text( elevatedButtonText,
                     style: TextStyle(
                                color: ColorConstant.clWhite),
                         
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ClProfilePictureWithCoverWithLinearPercentIndicator
    extends StatelessWidget {
  final double itemHeight;
  final String profilePicturepath;
  final String coverPicturepath;
  final String name;
  final String place;
  final double percentage;

  const ClProfilePictureWithCoverWithLinearPercentIndicator({
    super.key,
    // super.key,
    // Key? key,
    required this.itemHeight,
    this.profilePicturepath = 'assets/images/img_ellipse76.png',
    this.coverPicturepath = 'assets/images/img_rectangle690.png',
    this.name = 'Ariene McCoy',
    this.place = 'Dubai, United Arab Emirates',
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade300)),
        height: itemHeight * 2.5,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                Container(
                  // cover pic
                  height: 200,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.orange,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      coverPicturepath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 150,
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                    image: DecorationImage(
                      image: AssetImage(profilePicturepath),
                    )),
              ),
            ),
            Positioned(
              top: 260,
              bottom: 30,
              child: Column(
                // mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(place),
                  LinearPercentIndicator(
                    backgroundColor: ColorConstant.clgreyfillColor,
                    width: MediaQuery.of(context).size.width - 50,
                    animation: true,
                    lineHeight: 20.0,
                    animationDuration: 2500,
                    percent: percentage * 0.01,
                    center: Text("$percentage%"),
                    barRadius: const Radius.circular(10),
                    progressColor: Colors.green,
                  ),
                  Row(
                    children: [
                      const Text(
                        "Task Complete ",
                      ),
                      Text(
                        '$percentage%',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomClListtileWidget extends StatelessWidget {
  CustomClListtileWidget({
    super.key,
    required this.profilePic,
    required this.title,
    required this.subtitleImage,
    required this.subTitle,
    this.borderRadius,
    this.tileColour = Colors.transparent,
  });

  final String profilePic;
  final String title;
  final String subtitleImage;
  final String subTitle;
  final BorderRadiusGeometry? borderRadius;
  Color tileColour;

  @override
  Widget build(BuildContext context) {
    final borderRadius = this.borderRadius ?? BorderRadius.circular(0);

    // var borderRadius2 = BorderRadius.only(
    //                     bottomLeft: Radius.circular(10),
    //                     bottomRight: Radius.circular(10));

    return ListTile(
      tileColor: tileColour,
      contentPadding: const EdgeInsets.all(10),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: DeviceSize.itemWidth / 13,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            subtitleImage,
            height: DeviceSize.itemHeight / 20,
          ),
          Text(subTitle),
        ],
      ),
      leading: Image.asset(
        profilePic,
        height: 45,
      ),
      shape: RoundedRectangleBorder(
          side: BorderSide(color: ColorConstant.clgreyborderColor),
          borderRadius: borderRadius),
    );
  }
}

class CustomClCheckboxWithQuestionWidget extends StatelessWidget {
  const CustomClCheckboxWithQuestionWidget({
    super.key,
    required this.question,
    required this.completed,
  });

  final String question;
  final bool completed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: DeviceSize.itemHeight / 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                  border: const Border.fromBorderSide(BorderSide.none),
                  color: ColorConstant.whiteA700,
                  shape: BoxShape.circle),
              height: 20,
              width: 20,
              child: Checkbox(
                // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,

                value: completed,
                onChanged: (value) {},
                //  side: BorderSide.none,
                shape: const CircleBorder(side: BorderSide.none),
                side: const BorderSide(color: Colors.green),
                activeColor: Colors.green,
                // checkColor: Colors.black,
              ),
            ),
            SizedBox(
              width: DeviceSize.itemWidth / 20,
            ),
            Expanded(
                child: Text(
              question,
              style: const TextStyle(
                // color: ColorConstant.clPurple6,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            )),
          ],
        ),
        SizedBox(
          height: DeviceSize.itemHeight / 10,
        ),
        Container(
          height: DeviceSize.itemHeight / 6,
          width: MediaQuery.of(context).size.width / 3,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color: ColorConstant.clPurpleBorderColor, width: 2)),
          child: Center(
              child: Text(
            "View Answer",
            style: TextStyle(
              color: ColorConstant.clPurpleFontColor,
              // fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          )),
        ),
      ],
    );
  }
}

//
//

class CustomClCheckboxWithQueNoAnsWidget extends StatelessWidget {
  const CustomClCheckboxWithQueNoAnsWidget({
    super.key,
    required this.question,
    required this.completed,
  });

  final String question;
  final bool completed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ColorConstant.whiteA700,
          borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                  border: const Border.fromBorderSide(BorderSide.none),
                  color: ColorConstant.whiteA700,
                  shape: BoxShape.circle),
              height: 20,
              width: 20,
              child: Checkbox(
                // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,

                value: completed,
                onChanged: (value) {},
                //  side: BorderSide.none,
                shape: const CircleBorder(side: BorderSide.none),
                side: const BorderSide(color: Colors.green),
                activeColor: Colors.green,
                // checkColor: Colors.black,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 20,
            ),
            Expanded(
                child: Text(
              question,
              style: TextStyle(
                // color: ColorConstant.clPurple6,
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.height / 50,
              ),
            )),
          ],
        ),
      ),
    );
  }
}

class CustomClCheckboxWithQueCenAnsWidget extends StatelessWidget {
  const CustomClCheckboxWithQueCenAnsWidget({
    super.key,
    required this.question,
    required this.completed,
  });

  final String question;
  final bool completed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // SizedBox(
        //   height: MediaQuery.of(context).size.height / 100,
        // ),
        Container(
          decoration: BoxDecoration(
              color: ColorConstant.whiteA700,
              borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: const Border.fromBorderSide(BorderSide.none),
                      color: ColorConstant.whiteA700,
                      shape: BoxShape.circle),
                  height: 20,
                  width: 20,
                  child: Checkbox(
                    // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,

                    value: completed,
                    onChanged: (value) {},
                    //  side: BorderSide.none,
                    shape: const CircleBorder(side: BorderSide.none),
                    side: const BorderSide(color: Colors.green),
                    activeColor: Colors.green,
                    // checkColor: Colors.black,
                  ),
                ),
                SizedBox(
                  width: DeviceSize.itemWidth / 20,
                ),
                Expanded(
                    child: Text(
                  question,
                  style: TextStyle(
                    // color: ColorConstant.clPurple6,
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.height / 50,
                  ),
                )),
              ],
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 100,
        ),
        Container(
          height: DeviceSize.itemHeight / 6,
          width: double.maxFinite,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: ColorConstant.whiteA700,
              border: Border.all(
                  color: ColorConstant.clElevatedButtonColor, width: 2)),
          child: Center(
              child: Text(
            "View Answer",
            style: TextStyle(
              color: ColorConstant.clPurpleFontColor,
              // fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          )),
        ),
      ],
    );
  }
}

class CustomClRectangleCheckboxWithQuestionWidget extends StatelessWidget {
  const CustomClRectangleCheckboxWithQuestionWidget({
    super.key,
    required this.question,
    required this.completed,
  });

  final String question;
  final bool completed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //  SizedBox(height: DeviceSize.itemHeight/10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 20,
              width: 20,
              child: Checkbox(
                // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,

                value: completed, onChanged: (value) {},
                side: BorderSide(color: ColorConstant.clgreyborderColor2),
                shape: const RoundedRectangleBorder(),
                activeColor: Colors.green,
              ),
            ),
            SizedBox(
              width: DeviceSize.itemWidth / 20,
            ),
            Expanded(
                child: Text(
              question,
              style: const TextStyle(
                // color: ColorConstant.clPurple6,
                // fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            )),
          ],
        ),
        SizedBox(
          height: DeviceSize.itemHeight / 30,
        ),
        //         Container(
        //  height: DeviceSize.itemHeight/6,
        //  width: MediaQuery.of(context).size.width/3,
        //  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
        //  border: Border.all(color: ColorConstant.clPurpleBorderColor, width: 2)
        //  ),
        //  child: Center(child: Text("View Answer", style: TextStyle(
        //         color: ColorConstant.clPurpleFontColor,
        //         // fontWeight: FontWeight.bold,
        //         fontSize: 13,
        //       ),)),),
      ],
    );
  }
}

// Check box color Changable
class CustomClRectangleCheckboxWithQuestionWidget2 extends StatefulWidget {
  const CustomClRectangleCheckboxWithQuestionWidget2({
    super.key,
    required this.question,
  });

  final String question;

  @override
  State<CustomClRectangleCheckboxWithQuestionWidget2> createState() =>
      _CustomClRectangleCheckboxWithQuestionWidget2State();
}

class _CustomClRectangleCheckboxWithQuestionWidget2State
    extends State<CustomClRectangleCheckboxWithQuestionWidget2> {
  bool? completed = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //  SizedBox(height: DeviceSize.itemHeight/10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 20,
              width: 20,
              child: Checkbox(
                // tristate: true,
                // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,

                value: completed,
                onChanged: (newBool) {
                  setState(() {
                    completed = newBool;
                  });
                },
                side: BorderSide(color: ColorConstant.clgreyborderColor2),
                shape: const RoundedRectangleBorder(),
                activeColor: Colors.green,
                fillColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.disabled)) {
                    return ColorConstant.clCheckboxDarkBlueColor
                        .withOpacity(.32);
                  }
                  return ColorConstant.clCheckboxDarkBlueColor;
                }),
              ),
            ),
            SizedBox(
              width: DeviceSize.itemWidth / 20,
            ),
            Expanded(
                child: Text(
              widget.question,
              style: TextStyle(
                  // letterSpacing: ,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w500,
                  // color: ColorConstant.clGreyFontColor3,
                  fontSize: DeviceSize.itemWidth / 14.413),
            )),
          ],
        ),
        SizedBox(
          height: DeviceSize.itemHeight / 30,
        ),
      ],
    );
  }
}

class CustomClTextformfieldWithSuffixIconWidget extends StatelessWidget {
  const CustomClTextformfieldWithSuffixIconWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // expands: true,
      maxLines: 5,
      minLines: null,

      decoration: InputDecoration(
          suffixIcon: Padding(
            padding: const EdgeInsets.only(top: 100, bottom: 0),
            child: SvgPicture.asset(
              'assets/images/img_menu.svg',
              alignment: Alignment.bottomLeft,
            ),
          ),
          suffixIconConstraints:
              const BoxConstraints(minWidth: 20, minHeight: 20),
          // contentPadding: EdgeInsets.only(left: 10,top: 30,right: 10, bottom: -10),
          border: OutlineInputBorder(
              borderSide: const BorderSide(),
              // gapPadding: 10,

              borderRadius: BorderRadius.circular(10))),
    );
  }
}

class MyElevatedButtonWithBorderColor extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double height;
  final Gradient? gradient;
  final VoidCallback? onPressed;
  final Widget child;
  final backgroundColor;

  const MyElevatedButtonWithBorderColor({
    Key? key,
    required this.onPressed,
    required this.child,
    this.borderRadius,
    this.width,
    this.height = 50.0,
    // this.gradient = const LinearGradient(colors: [Colors.cyan, Colors.indigo]),
    this.gradient,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = this.borderRadius ?? BorderRadius.circular(0);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(color: ColorConstant.clPurpleBorderColor2),
        gradient: LinearGradient(
            begin: const Alignment(-0.195, 1),
            end: const Alignment(-0.195, -1),
            colors: [
              ColorConstant.indigo500,
              ColorConstant.purpleA100,
            ],
            transform: const GradientRotation(0.15)),
        borderRadius: borderRadius,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
        ),
        child: child,
      ),
    );
  }
}

class MyElevatedButtonWithBorderColorAdj extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double height;
  final Gradient? gradient;
  final VoidCallback? onPressed;
  final Widget child;
  final backgroundColor;
  final borderColor;

  const MyElevatedButtonWithBorderColorAdj({
    Key? key,
    required this.onPressed,
    required this.child,
    this.borderRadius,
    this.width,
    this.height = 44.0,
    // this.gradient = const LinearGradient(colors: [Colors.cyan, Colors.indigo]),
    this.gradient,
    this.backgroundColor,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = this.borderRadius ?? BorderRadius.circular(10);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        gradient: LinearGradient(
            begin: const Alignment(-0.195, 1),
            end: const Alignment(-0.195, -1),
            colors: [
              ColorConstant.indigo500,
              ColorConstant.purpleA100,
            ],
            transform: const GradientRotation(0.15)),
        borderRadius: borderRadius,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
        ),
        child: child,
      ),
    );
  }
}

class WidgetTitleAndDualTextfield extends StatelessWidget {
  final String textFieldTitle;

  final String textFieldHint1;
  final String textFieldHint2;

  final dynamic onChanged;

  final TextEditingController _textFieldController = TextEditingController();

  WidgetTitleAndDualTextfield(
      {super.key,
      required this.textFieldTitle,
      required this.onChanged,
      required this.textFieldHint1,
      required this.textFieldHint2});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(textFieldTitle),
        const SizedBox(
          height: 10,
        ),
        Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: TextField(
                  onChanged: onChanged,
                  // controller: _textFieldController,

                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    hintText: textFieldHint1,
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
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: TextField(
                  onChanged: onChanged,
                  // controller: _textFieldController,

                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    hintText: textFieldHint2,
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
          ],
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

class CustomClHorizontalImageViewWidget extends StatelessWidget {
  const CustomClHorizontalImageViewWidget({
    super.key,
    required this.userUid,
    required this.title1,
    required this.title2,
    required this.titleTrailing,
    required this.fireFolder,
  });

  final String userUid;
  final String title1;
  final String title2;
  final String titleTrailing;
  final String fireFolder;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title1,
                  style: TextStyle(
                      color: ColorConstant.clFontDarkBlueColor,
                      fontWeight: FontWeight.bold,
                      fontSize: DeviceSize.itemHeight / 12),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  title2,
                  style: TextStyle(
                      color: ColorConstant.black900,
                      // fontWeight: FontWeight.bold,
                      fontSize: DeviceSize.itemHeight / 17),
                ),
              ],
            ),
            Text(
              titleTrailing,
              style: TextStyle(
                  color: ColorConstant.clPurple5,
                  // fontWeight: FontWeight.bold,
                  fontSize: DeviceSize.itemHeight / 13),
            ),
          ],
        ),
        SizedBox(
          height: DeviceSize.itemHeight / 10,
        ),
        HorizontalImageViewNoTextWidgetCl(
            userUid: userUid, fireFolder: fireFolder),
        SizedBox(
          height: DeviceSize.itemHeight / 10,
        ),
      ],
    );
  }
}

class D10HCustomClSizedBoxWidget extends StatelessWidget {
  final double height;

  const D10HCustomClSizedBoxWidget({
    super.key,
    this.height = 60,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 1.5,
      height: MediaQuery.of(context).size.height / height,
    );
  }
}

class D10HCustomClSizedBoxWidgetDispHeiWid extends StatelessWidget {
  final double height;

  const D10HCustomClSizedBoxWidgetDispHeiWid({
    super.key,
    this.height = 60,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: DeviceSize.itemHeight / height,
      height: MediaQuery.of(context).size.height / height,
      child: Text(
          '${MediaQuery.of(context).size.height} & ${MediaQuery.of(context).size.width} '),
    );
  }
}

class D10WCustomClSizedBoxWidget extends StatelessWidget {
  final double width;
  const D10WCustomClSizedBoxWidget({
    super.key,
    this.width = 27,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / width,
    );
  }
}

class UnderlineTextWidgetCustomCl extends StatelessWidget {
  const UnderlineTextWidgetCustomCl({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black, width: 2))),
      child: Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: DeviceSize.itemHeight / 13),
      ),
    );
  }
}

class UnderlineTextNoBoldWidgetCustomCl extends StatelessWidget {
  final String string;
  const UnderlineTextNoBoldWidgetCustomCl({
    super.key,
    required this.string,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: ColorConstant.clFontDarkBlueColor, width: 1))),
      child: Text(
        string,
        style: TextStyle(
            color: ColorConstant.clFontDarkBlueColor,
            fontSize: DeviceSize.itemHeight / 13),
      ),
    );
  }
}

class UnderlineTextNoBoldWidgetCustomClAdj extends StatelessWidget {
  const UnderlineTextNoBoldWidgetCustomClAdj({
    super.key,
    required this.text,
    required this.textColor,
  });
  final String text;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: ColorConstant.clPurpleUnderlineFontColor, width: 1))),
      child: Text(
        text,
        style:
            TextStyle(color: textColor, fontSize: DeviceSize.itemHeight / 15),
      ),
    );
  }
}

class HorizontalImageViewNoTextWidgetCl extends StatelessWidget {
  const HorizontalImageViewNoTextWidgetCl({
    super.key,
    required this.userUid,
    required this.fireFolder,
  });

  final String userUid;
  final String fireFolder;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("ProfileInfo")
            .doc(userUid)
            .collection(fireFolder)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return (const Center(
              child: Text("No image uploaded"),
            ));
          } else {
            return SizedBox(
              height: DeviceSize.itemHeight * 1,
              // width: DeviceSize.itemWidth/1.5,
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(0),
                controller: ScrollController(),
                shrinkWrap: true,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  String url = snapshot.data!.docs[index]['downloadURL'];
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Stack(children: [
                      Image.network(
                        url,
                      ),
                    ]),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: DeviceSize.itemWidth / 13,
                  );
                },
              ),
            );
          }
        });
  }
}

class uploadImageContainerCustomCl extends StatelessWidget {
  const uploadImageContainerCustomCl({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      // width: 65,
      decoration: BoxDecoration(
          color: Colors.indigo.shade50, borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SvgPicture.asset(
          'assets/images/img_user_deep_purple_a200_69x69.svg',
        ),
      ),
    );
  }
}

class LeadingSocialMediaIconTrailingTextFormWidget extends StatelessWidget {
  final String leadingImagePath;
  final String sharedPreffID;

  const LeadingSocialMediaIconTrailingTextFormWidget(
      {super.key, required this.leadingImagePath, required this.sharedPreffID});

  saveToSharedPrefferences(String nameOfID, String valueToSave) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setString(nameOfID, valueToSave);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: ColorConstant.deepPurpleA200,
                ),
                width: 48,
                height: 48,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SvgPicture.asset(leadingImagePath),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 0),
              child: Container(
                width: MediaQuery.of(context).size.width - 107,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8)),
                child: TextFormField(
                  initialValue: "https://",
                  onChanged: (value) async {
                    saveToSharedPrefferences(sharedPreffID, value);
                  },
                  decoration: const InputDecoration(
                      border: InputBorder.none, hintText: "Test"),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

class MatchingListImageHorizontalListView extends StatefulWidget {
  final String? leftTitle;
  final String? leftSubTitle;
  final String rightTitle;
  final String? leftBigTitle;

  final String? imageWord1;
  final String? imageWord2;
  final String? imageWord3;
  final String imageWord4;
  final int listLength;
  final String imageAddress;
  final String listType;

  MatchingListImageHorizontalListView({
    super.key,
    this.leftTitle,
    this.leftSubTitle,
    this.rightTitle = "",
    this.leftBigTitle,
    this.imageWord1,
    this.imageWord2,
    this.imageWord3,
    required this.imageWord4,
    required this.listLength,
    required this.imageAddress, required this.listType
  });


  BlockedUsersByMe _blockedUsersByMe = BlockedUsersByMe();
 static  AllMaletest1 allMaletest1 = AllMaletest1();
 static int bugNullBlock =0;

    
  static profMore(context, String requestingUserid, String userUid, String listType) async {
    showDialog(
      context: context,
      builder: (context) => Center(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8)),
          // width: 10.0,
          // height: 10.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                child:   listType =='block' ? 
                
                 Text( "Unblock this Profile" ,)
                 :
                 Text( "Block this Profile" ,) ,
                onPressed: () async {
                  await 
                   listType =='block' ? 
                  unBlock(requestingUserid, userUid) :
                  block('Not Interested', requestingUserid, userUid);
                },
              ),
              TextButton(
                child: const Text("Hi"),
                onPressed: () {},
              ),
              TextButton(
                child: const Text("Request"),
                onPressed: () {
                  showAlert(context, requestingUserid);
                },
              ),
              TextButton(
                child: const Text("Share"),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  //

  // {'reason': ['pudikala'], 'blocked_id': ['VGH8WAEECAZ']}

  static block(String reason, String blocked_id, String userUid1) async {
    debugPrint('Block Start');

    debugPrint(userUid1);

    var requestBody = {
      'reason': '$reason',
      'blocked_id': '$blocked_id',
    };
    print('block Processing');

    var response1 = await http.post(
      Uri.parse("http://10.0.2.2:8000/block/$userUid1"),
      // headers: headers,
      body: requestBody,
    );

    print('Request Processing');

    var json = jsonDecode(response1.body);

    debugPrint("statusCodeIs${response1.statusCode}");

    if (response1.statusCode == 200) {
      print(response1.body);
      print(json);

      debugPrint("Blocked succesfully");
      
      // MatchingListImageHorizontalListView.allMaletest1.curUsers[]
      
    } else {
      print("error");
      print(response1.statusCode);
    }
  }


  

  //

   

  
  static unBlock( String unBlockedId, String userUid1) async {
    debugPrint('UnBlock Start');

    debugPrint(userUid1);

  
    print('unBlock Processing');

   
    try {
        var requestBody = {
      
      'unblock': unBlockedId,
    };
       var responseUnb = await http.post(
      Uri.parse("http://10.0.2.2:8000/block/$userUid1"),
      // headers: headers,
      body: requestBody,
    );

    print('unBlock Request Processing');
      // var bson = jsonDecode(response1.body);

    debugPrint("statusCodeIs${responseUnb.statusCode}");

    if (responseUnb.statusCode == 200) {
      print(responseUnb.body);
      // print(bson);

      debugPrint("unBlocked succesfully");
    } else {
      print("error");
      print(responseUnb.statusCode);
    }
      
    } catch (e) {
      debugPrint(e.toString());
      
    }

    
  }

  // 

  static showAlert(BuildContext context, String requestingUserId) {
    bool _phone = false;
    bool _whatsapp = false;
    bool _address = false;
    bool _horos = false;
    bool _socLinks = false;

    String requestedUid = '';
    String requestedPhone = '';
    String requestedWhatsapp = '';
    String requestedAddress = '';
    String requestedHoros = '';
    String requestedSocialMedia = '';

    return showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              // title: const Text('Add'),
              content: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      value: _phone,
                      onChanged: (bool? newValue) {
                        setState(() {
                          _phone = newValue!;
                        });
                      },
                      title: const Text('Phone Number'),
                    ),
                    CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      value: _whatsapp,
                      onChanged: (bool? newValue) {
                        setState(() {
                          _whatsapp = newValue!;
                        });
                      },
                      title: const Text('Whatsapp Number'),
                    ),
                    CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      value: _address,
                      onChanged: (bool? newValue) {
                        setState(() {
                          _address = newValue!;
                        });
                      },
                      title: const Text(
                          'home or office Physical address with the house name'),
                    ),
                    CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      value: _horos,
                      onChanged: (bool? newValue) {
                        setState(() {
                          _horos = newValue!;
                        });
                      },
                      title: const Text('Horoscope'),
                    ),
                    CheckboxListTile(
                      // selected: ,
                      controlAffinity: ListTileControlAffinity.leading,
                      value: _socLinks,
                      onChanged: (bool? newValue) {
                        setState(() {
                          _socLinks = newValue!;
                        });
                      },
                      title: const Text('Social Media links'),
                    ),
                    MyElevatedButton(
                        height: 40,
                        borderRadius: BorderRadius.circular(8),
                        backgroundColor: Colors.transparent,
                        onPressed: () {
                          requestButtonPressed(
                            requestedUid = requestingUserId,

                            requestedPhone = _phone ? 'on' : 'none',

                            requestedWhatsapp = _whatsapp ? 'on' : 'none',

                            requestedAddress = _address ? 'on' : 'none',

                            requestedHoros = _horos ? 'on' : 'none',

                            requestedSocialMedia = _socLinks ? 'on' : 'none',

                            // "http://${ApiService.ipAddress}/requested_list/$userUid"
                          );
                        },
                        child: const Text("Request"))
                  ],
                ),
              ),
            );
          });
        });
  }

  static requestButtonPressed(
    String requestedUid,
    String requestedPhone,
    String requestedWhatsapp,
    String requestedAddress,
    String requestedHoros,
    String requestedSocialMedia,

    //   bool _phone,
    //  bool _whatsapp, bool _address,
    // bool _horos,bool _socLinks,
  ) {
    void request(String url) async {
      String userUid = '';
      SharedPreferences preferences = await SharedPreferences.getInstance();

      userUid = preferences.getString("uid2").toString();
      debugPrint(userUid);

      // final responseMatList = await http.get(
      //     Uri.parse("http://${ApiService.ipAddress}/requested_list/$userUid"));

      var headers = {
        'Context-Type': 'application/json',
      };

      var requestBody = {
        'received_uid': requestedUid,
        'request_phone_number': requestedPhone,
        'request_whatsapp_number': requestedWhatsapp,
        'request_address': requestedAddress,
        'request_horoscope': requestedHoros,
        'request_social_media_link': requestedSocialMedia
      };

      print('Request Processing');

      var response = await http.post(
        Uri.parse(url),
        // headers: headers,
        body: requestBody,
      );

      var json = jsonDecode(response.body);

      print("statusCodeIs${response.statusCode}");

      if (response.statusCode == 200) {
        // _users = Users.fromJson(json);
        print(response.body);
        print(json);
        // await Future.delayed(const Duration(seconds: 1), () {});

        // setState(() {
        //   isLoading = false;
        // });
      } else {
        print("error");
        print(response.statusCode);
      }
    }
  }
  
  @override
  State<MatchingListImageHorizontalListView> createState() =>
      _MatchingListImageHorizontalListViewState();
}

class _MatchingListImageHorizontalListViewState
    extends State<MatchingListImageHorizontalListView> {
//
  // String requestedUid = '';
  // String requestedPhone = '';
  // String requestedWhatsapp = '';
  // String requestedAddress = '';
  // String requestedHoros = '';
  // String requestedSocialMedia = '';

  bool isLoading = true;

  // late List<UserModel>? _userModel = [];

 

  // void _getDataMatList() async {
  //   _userModel = (await ApiService1().getUsers1());
  //   Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  // }

  _getDataMatList() async {
    debugPrint('_getDataMatList start');
    
    final responseMatList = await http.get(
        Uri.parse("http://${ApiService.ipAddress}/all_male_user_data/${ThreeSigninScreen.userUidAccess}"
             ));
    var json = jsonDecode(responseMatList.body);

    print("statusCodeIs${responseMatList.statusCode}");

    if (responseMatList.statusCode == 200) {
      print(responseMatList.body);

      setState(()  {
        isLoading = false;
       MatchingListImageHorizontalListView.allMaletest1 = AllMaletest1.fromJson(json,  ThreeSigninScreen.userUidAccess );
      });
        } else {
      print("error");
      print(responseMatList.statusCode);
    }

    debugPrint('_getDataMatList end');
  }

  //  BlockedUsersByMe _blockedUsersByMe = BlockedUsersByMe();

  

  _getblockedProfilesByMe() async {
    debugPrint('getblockedProfilesByMe start');
    
    final responseMatList = await http.get(
        Uri.parse("http://${ApiService.ipAddress}/block/${ThreeSigninScreen.userUidAccess}"
             ));
    var json = jsonDecode(responseMatList.body);

    print("statusCodeIs${responseMatList.statusCode}");

    if (responseMatList.statusCode == 200) {
      print(responseMatList.body);

      setState(()  {
       MatchingListImageHorizontalListView.bugNullBlock =1;
        isLoading = false;
        EveryMaleFourtyNineScreen.blockedUsersByMe = BlockedProfilesByMe1.fromJson(json,  ThreeSigninScreen.userUidAccess );
      });
        } else {
      print("error");
      print(responseMatList.statusCode);
    }

    debugPrint('getblockedProfilesByMe end');
  }





   Future<void> addsavedSearch(
    int index, 
   ) async {
    debugPrint('add saved search start');
    try {
      // Replace the URL with your API endpoint
      String apiUrl =
          "http://${ApiService.ipAddress}/saved_search/${ThreeSigninScreen.userUidAccess}"; // Example API endpoint

      Map<String, dynamic> requestBody = {
        // 'data': data,
        'add new': {
          'tag': MatchingListImageHorizontalListView.allMaletest1.curUsers![index].profileTag,
          'country': MatchingListImageHorizontalListView.allMaletest1.curUsers![index].rCountry,
          'city': MatchingListImageHorizontalListView.allMaletest1.curUsers![index].fatherCity,
          'age': MatchingListImageHorizontalListView.allMaletest1.curUsers![index].age,
          'complexion': MatchingListImageHorizontalListView.allMaletest1.curUsers![index].complexion,
          'gender': MatchingListImageHorizontalListView.allMaletest1.curUsers![index].gender,
          'denomination': MatchingListImageHorizontalListView.allMaletest1.curUsers![index].denomination,
        }
        // Add other fields as needed for your API request
      };

      final response = await http.post(
        Uri.parse(apiUrl),
        // headers: <String, String>{
        //   'Content-Type': 'application/json; charset=UTF-8',
        //   // Add any other headers if required by your API
        // },
        body: jsonEncode(requestBody),

        
      );

      if (response.statusCode == 200) {
        // Successful API call
        print('Profile added in saved search successfully');
        print('Response: ${response.body}');
        debugPrint(jsonEncode(requestBody));
      } else {
        // Handle error when API call fails
        print('Failed to send data. Error: ${response.reasonPhrase}');
      }
    } catch (error) {
      // An error occurred during the request, handle it here
      print('Error sending data: $error');
    }
    debugPrint('add saved search end');
  }
  // 
  Future<void> editSavedSearch(
    int index, 
   ) async {
    debugPrint('edit saved search start');
    try {
      // Replace the URL with your API endpoint
      String apiUrl =
          "http://${ApiService.ipAddress}/saved_search/${ThreeSigninScreen.userUidAccess}"; // Example API endpoint

      Map<String, dynamic> requestBody = {
        // 'data': data,
        'edit': {
          'tag_edit': MatchingListImageHorizontalListView.allMaletest1.curUsers![index].profileTag,
          'country': MatchingListImageHorizontalListView.allMaletest1.curUsers![index].rCountry,
          'city': MatchingListImageHorizontalListView.allMaletest1.curUsers![index].fatherCity,
          'age': MatchingListImageHorizontalListView.allMaletest1.curUsers![index].age,
          'complexion': MatchingListImageHorizontalListView.allMaletest1.curUsers![index].complexion,
          'gender': MatchingListImageHorizontalListView.allMaletest1.curUsers![index].gender,
          'denomination': MatchingListImageHorizontalListView.allMaletest1.curUsers![index].denomination,
          'id': MatchingListImageHorizontalListView.allMaletest1.curUsers![index].id,
          
        }
        // Add other fields as needed for your API request
      };

      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          // Add any other headers if required by your API
        },
        body: jsonEncode(requestBody),

        
      );

      if (response.statusCode == 200) {
        // Successful API call
        print('Saved search edited successfully');
        print('Response: ${response.body}');
        debugPrint(jsonEncode(requestBody));
      } else {
        // Handle error when API call fails
        print('Failed to send data. Error: ${response.reasonPhrase}');
      }
    } catch (error) {
      // An error occurred during the request, handle it here
      print('Error sending data: $error');
    }
    debugPrint('Edit saved search end');
  }
  // 
  Future<void> removesavedSearch(
    int index, 
   ) async {
    debugPrint('remove saved search start');
    try {
      // Replace the URL with your API endpoint
      String apiUrl =
          "http://${ApiService.ipAddress}/saved_search/${ThreeSigninScreen.userUidAccess}"; // Example API endpoint

      Map<String, dynamic> requestBody = {
        // 'data': data,
        'remove': {
          'remove': ['remove']
          
        }
        // Add other fields as needed for your API request
      };

      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          // Add any other headers if required by your API
        },
        body: jsonEncode(requestBody),

        
      );

      if (response.statusCode == 200) {
        // Successful API call
        print('saved search removed successfully');
        print('Response: ${response.body}');
        debugPrint(jsonEncode(requestBody));
      } else {
        // Handle error when API call fails
        print('Failed to send data. Error: ${response.reasonPhrase}');
      }
    } catch (error) {
      // An error occurred during the request, handle it here
      print('Error sending data: $error');
    }
    debugPrint('remove saved search end');
  }


  //

//

  // void request(String url) async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();

  //   userUid = preferences.getString("uid2").toString();
  //   debugPrint(userUid);

  //   // final response = await http.get(
  //   //     Uri.parse("http://${ApiService.ipAddress}/requested_list/$userUid"));

  //   var headers = {
  //     'Context-Type': 'application/json',
  //   };

  //   var requestBody = {
  //     'received_uid': 'MTHAA8PL5A4',
  //     'request_phone_number': 'on',
  //     'request_whatsapp_number': 'none',
  //     'request_address': 'on',
  //     'request_horoscope': 'none',
  //     'request_social_media_link': 'none'
  //   };

  //   print('Request Processing');

  //   var response = await http.post(
  //     Uri.parse(url),
  //     // headers: headers,
  //     body: requestBody,
  //   );

  //   var json = jsonDecode(response.body);

  //   print("statusCodeIs${response.statusCode}");

  //   if (response.statusCode == 200) {
  //     // _users = Users.fromJson(json);
  //     print(response.body);
  //     print(json);
  //     // await Future.delayed(const Duration(seconds: 1), () {});

  //     setState(() {
  //       isLoading = false;
  //     });
  //   } else {
  //     print("error");
  //     print(response.statusCode);
  //   }
  // }



  static favourites(String favId, ) async {
    debugPrint(ThreeSigninScreen.userUidAccess);
    debugPrint('fav Start + $favId');

    

    var requestBody = {
      'myfavorite_id': favId,
    };
    print('fav Processing');


    try {
       var responsefav = await http.post(
      Uri.parse("http://10.0.2.2:8000/favorites/${ThreeSigninScreen.userUidAccess}"),
      // headers: headers,
      body: requestBody,
    );

    print('fav Processing');

    // var json = jsonDecode(responsefav.body);

    debugPrint("statusCodeIs${responsefav.statusCode}");

     if (responsefav.statusCode == 200) {
      print(responsefav.body);
      print(json);

      debugPrint("Fav succesfully");
    } else {
      print("error");
      print(responsefav.statusCode);
    }

      
    } catch (e) {

      debugPrint(e.toString());
      
    }

   
   
  }

  @override
  void initState() {
    _getDataMatList();
    // getblockedProfilesByMe();
    

    // DataImport.allMaleUsers_import();
    super.initState();
  }

  final bool _editButtonClicked = false;
  final bool _addMorebuttonClicked = false;

  // static Users _users = Users();

  // ListModelSibling _listModelSibling = ListModelSibling([]);

  // bool isLoading = true;

  // late String uidUser;

  Future _updateDetails() async {
    // SharedPreferences preferences = await SharedPreferences.getInstance();

    // uidUser = preferences.getString("uid2").toString();

    print("uid for Update ${ThreeSigninScreen.userUidAccess}");

    final url =
        Uri.parse("http://${ApiService.ipAddress}/about_candidate/${ThreeSigninScreen.userUidAccess}");
    final request = http.MultipartRequest('POST', url);

//     List<String> sibling_nameedit = ['xx', 'yy', 'zz'];
// for (String item in sibling_nameedit) {
//     request.files.add(http.MultipartFile.fromString('sibling_nameedit', item));

// }
// List<String> sibling_relation = ['xx', 'yy', 'zz'];
// for (String item in sibling_relation) {
//     request.files.add(http.MultipartFile.fromString('sibling_relation', item));

// }
// List<String> sibling_occupation = ['xx', 'yy', 'zz'];
// for (String item in sibling_occupation) {
//     request.files.add(http.MultipartFile.fromString('sibling_occupation', item));

// }

    for (String item in removeCommaSibName) {
      request.files
          .add(http.MultipartFile.fromString('sibling_nameedit', item));
    }

    for (String item in removeCommaSibRelation) {
      request.files
          .add(http.MultipartFile.fromString('sibling_relation', item));
    }
    for (String item in removeCommaSibOccupation) {
      request.files
          .add(http.MultipartFile.fromString('sibling_occupation', item));
    }

    // var response = await http.post(url,
    //     // headers: {"Content-type": "application/json"},
    //     headers: {
    //       'Content-type': 'application/json',
    //       'Accept': 'application/json'
    //     },
    //     body: json.encode(_listModelSibling.toJson())
//     body: {
// "sibling_nameedit":["a","a"],
// "sibling_relation":["b","c"],
// "sibling_occupation":["far","u"],

// }

    // );

    // print(response.statusCode);
    // print(response.body);
    //  if (response.statusCode == 200) {
    //     Fluttertoast.showToast(
    //       msg: "Sibling Details Updated Successfully...!",
    //       backgroundColor: ColorConstant.deepPurpleA200,
    //       textColor: Colors.white,
    //       toastLength: Toast.LENGTH_SHORT,
    //     );
    //  }

    // setState(() {
    // request.fields['sibling_nameedit'] =["a","a"];
    //     // preferences.getString(_sharedPreffId[0]).toString();
    // request.fields['sibling_relation'] = ["Hai"],
    //     // preferences.getString(_sharedPreffId[1]).toString();
    // request.fields['sibling_occupation'] = ["Hai"],
    // preferences.getString(_sharedPreffId[2]).toString();
    //  request.fields['sibling_job'] =
    //     preferences.getString(_sharedPreffId[2]).toString();
    // });

    try {
      final send = await request.send();
      final response = await http.Response.fromStream(send);
      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        Fluttertoast.showToast(
          msg: "Sibling Details Updated Successfully...!",
          backgroundColor: ColorConstant.deepPurpleA200,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_SHORT,
        );
        // _getDataMatListFromServer();
        // Navigator.push(context,MaterialPageRoute(builder: (context) =>TwentyFamilyDetails()));
        // Navigator.pushReplacement(context,
        //     MaterialPageRoute(builder: (BuildContext context) => super.widget));
        // print("Family Details Updated ${_users.fatherName}");
        // Future.delayed(const Duration(seconds: 10), () {});
        // Navigator.pushNamed(context, AppRoutes.FourteenScreenscr);
      }
    } catch (e) {
      print("Error While Uploading$e");
    }
  }

  List<String> removeCommaSibName = [""];
  List<String> removeCommaSibRelation = [""];
  List<String> removeCommaSibOccupation = [""];

  @override
  Widget build(BuildContext context) {
    return

        //  _allMaleUserData4.the0Ppqmbpewtl!.length == 0 ?

        //          const CircularProgressIndicator() :

        Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Text(
        //   _allMaleUserData4.the0Ppqmbpewtl!.length.toString(),
        // ),
        // Text(
        //   _userModel![1].selfie.toString(),
        // ),
        // Text( _userModel![0].name.toString(),),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            widget.leftBigTitle.toString() == 'null'
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      widget.leftTitle.toString() == 'null'
                          ? const SizedBox()
                          : Text(
                              widget.leftTitle.toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                      widget.leftTitle.toString() == 'null'
                          ? const SizedBox()
                          : Text(widget.leftSubTitle.toString(),
                              style: const TextStyle(fontSize: 13)),
                    ],
                  )
                : Text(
                    widget.leftBigTitle.toString(),
                    style: TextStyle(
                        color: ColorConstant.clFontDarkBlueColor,
                        fontWeight: FontWeight.bold,
                        fontSize: DeviceSize.itemHeight / 10),
                  ),
            Text(widget.rightTitle.toString(),
                // "Test",
                style: TextStyle(
                    fontSize: 15, color: ColorConstant.deepPurpleA200))
          ],
        ),
        const D10HCustomClSizedBoxWidget(
            // height: 30,
            ),
        // Text(_userModel!.length.toString(),),

        isLoading == true
        // DataImport.isLoading_all_male_users == true
            ? Center(child: CircularProgressIndicator(
              semanticsLabel: 'Loading',
            ))
            :
            
             SizedBox(
                height: 200,
                child: 
                ListView.builder(
                    shrinkWrap: true,
                    physics: PageScrollPhysics(),
                    
                    itemCount: widget.listLength,
                    // itemCount: DataImport.allMaleUsers.curUsers!.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Center(
                        child: Stack(children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: GestureDetector(
                                onTap: () {
                                  addsavedSearch(index);
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return Id123456FiftyScreen(
                                      userUidMaLi: index,
                                    );
                                  }));
                                },
                                child: CachedNetworkImage(
                                  height: 200,
                                  width: 150,
                                  fit: BoxFit.cover,
                                  // imageUrl: MatchingListImageHorizontalListView.imageAddress,

                                  imageUrl: MatchingListImageHorizontalListView.allMaletest1.curUsers![index].selfie,
                                  // imageUrl: EveryMaleFourtyNineScreen.blockedUsersByMe.myProf![index].selfie.toString(),
                                  


                                  

                                  // progressIndicatorBuilder:
                                  //     (context, url, downloadProgress) =>
                                  //         Container(
                                  //   margin: EdgeInsets.only(
                                  //     top: 5,
                                  //     bottom: 5,
                                  //   ),
                                  //   child: CircularProgressIndicator(
                                  //       value: downloadProgress.progress,
                                  //       color: Colors.blue),
                                  // ),
                                  // errorWidget: (context, url, error) => Icon(Icons
                                  //     .error), 
                                  //// replace with your own error widget
                                ),

                              ),
                            ),
                          ),
                          Positioned(
                            left: 10,
                            top: 10,
                            child: GestureDetector(
                              onTap: () {},
                              child: const Icon(
                                Icons.crop_square_outlined,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Positioned(
                              right: 20,
                              top: 10,
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                     MatchingListImageHorizontalListView.profMore(
                                        context,
                                        // _allMaleUserData4.the0Ppqmbpewtl![index].uid
                                        //     .toString(),
                                        MatchingListImageHorizontalListView.allMaletest1.curUsers![index].uid,
                                        ThreeSigninScreen.userUidAccess,
                                        'New Reg'
                                      );
                                    },
                                    child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            color: Colors.black38),
                                        child: const Icon(Icons.more_vert,
                                            color: Colors.white)),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          color: Colors.black38),
                                      child: Padding(
                                        padding: const EdgeInsets.all(6.5),
                                        child: SvgPicture.asset(
                                            "assets/images/imageIcon.svg"),
                                      )),
                                ],
                              )),
                          Positioned(
                            bottom: 10,
                            left: 10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  // widget.imageWord1,
                                  MatchingListImageHorizontalListView.allMaletest1.curUsers![index].uid
                                      .toString(),

                                  style: const TextStyle(
                                      fontSize: 10, color: Colors.white),
                                ),
                                Text(
                                  // widget.imageWord2,
                                  MatchingListImageHorizontalListView.allMaletest1
                                      .curUsers![index].address
                                      .toString(),
                                  style: const TextStyle(
                                      fontSize: 10, color: Colors.white),
                                ),
                                Text(
                                  // widget.imageWord3,
                                  MatchingListImageHorizontalListView.allMaletest1
                                      .curUsers![index].yourIntrest
                                      .toString(),
                                  style: const TextStyle(
                                      fontSize: 10, color: Colors.white),
                                ),
                                Text(
                                  widget.imageWord4,
                                  style: const TextStyle(
                                      fontSize: 10, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                              right: 20,
                              bottom: 10,
                              child: InkWell(
                                onTap: () {
                                  debugPrint('ontap');


                                  favourites(MatchingListImageHorizontalListView.allMaletest1.curUsers![index].uid);
                                },
                                child: Container(
                                 
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: const Alignment(-0.8, 1),
                                      end: const Alignment(-0.5, -1),
                                      colors: [
                                        ColorConstant.indigo500,
                                        ColorConstant.purpleA100,
                                      ],
                                      // transform: GradientRotation(0.15)
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                              
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SvgPicture.asset(
                                      "assets/images/handicon.svg",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              )),
                        ]),
                      );
                    }),
              ),
      ],
    );
  }
}
