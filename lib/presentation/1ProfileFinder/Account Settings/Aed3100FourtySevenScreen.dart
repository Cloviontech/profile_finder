import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:profile_finder/core/utils/color_constant.dart';
import 'package:profile_finder/core/utils/size_utils.dart';
import 'package:profile_finder/presentation/1ProfileFinder/ReferAFriend/ReferAFriendFourtySevenScreen.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/CustomClAll.dart';

class Aed3100FourtySevenScreen extends StatelessWidget {
  const Aed3100FourtySevenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/img_background_first.png"),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: ClAppbarLeadArrowBackSuffHeart(testingNextPage: ReferAFriendFourtySeven2Screen()),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Card(
                  shadowColor: ColorConstant.clgreyfillColor,
                  elevation: 3,
                  child: Container(
                    width: double.maxFinite,
                    height: DeviceSize.itemHeight,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'AED 3,100',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: DeviceSize.itemHeight / 8),
                                  ),
                                  Text("Monday, March 14th, 2023")
                                ],
                              ),
                              Image.asset(
                                'assets/images/img_frame_gray_600_04.png',
                                height: DeviceSize.itemHeight / 4,
                              )
                            ],
                          ),
                          Expanded(
                            child: LinearPercentIndicator(
                              padding: EdgeInsets.all(0),
                              backgroundColor: ColorConstant.clgreyfillColor,
                              // width: MediaQuery.of(context).size.width - 90,
                              animation: true,
                              lineHeight: 10.0,
                              animationDuration: 2500,
                              percent: 50 * 0.01,
                              // center: Text("${'50'}%"),
                              barRadius: Radius.circular(10),
                              progressColor:
                                  ColorConstant.clPurplePercentagefillColor,
                            ),
                          ),
                          UnderlineTextWidgetCustomCl(text: 'View Details'),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: DeviceSize.itemHeight / 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: ListTile(
                    leading: SvgPicture.asset(
                        'assets/images/img_notification_deep_purple_a200.svg'),
                    title: Text(
                      'Notification',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorConstant.clPurpleCardFontColor,
                          fontSize: DeviceSize.itemHeight / 10),
                    ),
                    tileColor: Colors.white,
                    splashColor: Colors.grey,
                     shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                ListTile(
                  leading: SvgPicture.asset(
                    'assets/images/img_lock.svg',
                    color: ColorConstant.clCardgreyColor,
                  ),
                  title: Text(
                    'Privacy',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: ColorConstant.clCardgreyColor,
                        fontSize: DeviceSize.itemHeight / 10),
                  ),
                  tileColor: Colors.white,
                   shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                 
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: ListTile(
                    leading: SvgPicture.asset(
                      'assets/images/img_arrowdown.svg',
                      color: ColorConstant.clCardgreyColor,
                    ),
                    title: Text(
                      'Security',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorConstant.clCardgreyColor,
                          fontSize: DeviceSize.itemHeight / 10),
                    ),
                    tileColor: Colors.white,
                     shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: ListTile(
                    leading: SvgPicture.asset(
                      'assets/images/img_moneycnycircleline.svg',
                      color: ColorConstant.clCardgreyColor,
                    ),
                    title: Text(
                      'Subscriptions',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorConstant.clCardgreyColor,
                          fontSize: DeviceSize.itemHeight / 10),
                    ),
                    tileColor: Colors.white,
                     shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: ListTile(
                    leading: SvgPicture.asset(
                      'assets/images/img_question.svg',
                      color: ColorConstant.clCardgreyColor,
                    ),
                    title: Text(
                      'About',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorConstant.clCardgreyColor,
                          fontSize: DeviceSize.itemHeight / 10),
                    ),
                    tileColor: Colors.white,
                     shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: ListTile(
                    leading: SvgPicture.asset(
                      'assets/images/img_shieldcheckline.svg',
                      color: ColorConstant.clCardgreyColor,
                    ),
                    title: Text(
                      'Wallet',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorConstant.clCardgreyColor,
                          fontSize: DeviceSize.itemHeight / 10),
                    ),
                    tileColor: Colors.white,
                     shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: ListTile(
                    leading: SvgPicture.asset(
                      'assets/images/img_call.svg',
                      color: ColorConstant.clCardgreyColor,
                    ),
                    title: Text(
                      'Help & Contact',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorConstant.clCardgreyColor,
                          fontSize: DeviceSize.itemHeight / 10),
                    ),
                    tileColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    //   bottomNavigationBar: Padding(
    //     padding: const EdgeInsets.all(20),
    //     child: MyElevatedButton(
    //         onPressed: () {},
    //         borderRadius: BorderRadius.circular(10),
    //         width: double.maxFinite,
    //         backgroundColor: Colors.transparent,
    //         // gradient: LinearGradient(
    //         //     begin: Alignment(0, 0.56),
    //         //     end: Alignment(1, 0.56),
    //         //     colors: [ColorConstant.indigo500, ColorConstant.purpleA100]),
    //         child: Text(
    //           'Submit',
    //         )),
    //   ),
    // );
  }
}
