import 'package:flutter/material.dart';
import 'package:profile_finder/core/utils/color_constant.dart';
import 'package:profile_finder/core/utils/size_utils.dart';
import 'package:profile_finder/presentation/1ProfileFinder/MatchingList/AddRefferenceFiftyThreeScreen.dart';
import 'package:profile_finder/presentation/1ProfileFinder/MatchingList/payment_method_matching_list.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/CustomWidgets.dart';

class ChooseYourFiftyTwoScreen extends StatelessWidget {
  const ChooseYourFiftyTwoScreen({super.key});

  //  var backgroundImage;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      // position: DecorationPosition.background,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/img_background_first.png"),
            // image: AssetImage("assets/images/img_group13.png"),
            // image: AssetImage(backgroundImage.toString()),

            fit: BoxFit.cover),
      ),

      // "C:\Flutter projects\Saran\Official\Marriyo\Marriyo_17_May\marriyo_17_may\assets\images\img_group13.png"
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const ClAppbarLeadGridSuffHeart(
          testingNextPage: AddRefferenceFiftyThreeScreen(),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    'Choose Your Subscription Plan',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: DeviceSize.itemHeight / 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  height: DeviceSize.itemHeight * 1.8,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Trial',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: DeviceSize.itemHeight / 12,
                              color: ColorConstant.clFontGreenColor),
                        ),
                        Text(
                          '(Valid for 15 days)',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: DeviceSize.itemHeight / 12,
                              color: ColorConstant.clFontGreyColor),
                        ),
                        Text(
                          'Free',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: DeviceSize.itemHeight / 8,
                              color: ColorConstant.clFontGreenColor),
                        ),
                        Divider(
                          height: 10,
                          thickness: 1,
                          endIndent: DeviceSize.itemWidth / 5,
                          indent: DeviceSize.itemWidth / 5,
                        ),
                        SizedBox(
                          height: DeviceSize.itemHeight / 4,
                          child: Center(
                            child: Text(
                              'Just Profile View only',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: DeviceSize.itemHeight / 12,
                                  color: ColorConstant.clFontGreyColor),
                            ),
                          ),
                        ),
                        Divider(
                          height: 10,
                          thickness: 1,
                          endIndent: DeviceSize.itemWidth / 5,
                          indent: DeviceSize.itemWidth / 5,
                        ),
                        MyElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return const PaymentMethodMatchingListScreen();
                              }),
                            );
                          },
                          width: DeviceSize.itemWidth,
                          borderRadius: BorderRadius.circular(10),
                          backgroundColor: ColorConstant.clFontGreenColor,
                          child: const Text('Start Free'),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: DeviceSize.itemHeight / 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  height: DeviceSize.itemHeight * 1.8,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Basic',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: DeviceSize.itemHeight / 12,
                              color: ColorConstant.clFontSkyBlueColor),
                        ),
                        Text(
                          '(Valid for 1 month)',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: DeviceSize.itemHeight / 12,
                              color: ColorConstant.clFontGreyColor),
                        ),
                        Text(
                          '₹1,500',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: DeviceSize.itemHeight / 8,
                              color: ColorConstant.black900),
                        ),
                        Divider(
                          height: 10,
                          thickness: 1,
                          endIndent: DeviceSize.itemWidth / 15,
                          indent: DeviceSize.itemWidth / 15,
                        ),
                        SizedBox(
                          height: DeviceSize.itemHeight / 4,
                          child: Center(
                            child: ListTile(
                              title: Text(
                                'Profile View',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: DeviceSize.itemHeight / 12,
                                    color: ColorConstant.clFontGreyColor),
                              ),
                              trailing: Text(
                                '10(Day)',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: DeviceSize.itemHeight / 12,
                                    color: ColorConstant.clFontGreyColor),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: DeviceSize.itemHeight / 4,
                          child: Center(
                            child: ListTile(
                              title: Text(
                                'Profile Request',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: DeviceSize.itemHeight / 12,
                                    color: ColorConstant.clFontGreyColor),
                              ),
                              trailing: Text(
                                '20',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: DeviceSize.itemHeight / 12,
                                    color: ColorConstant.clFontGreyColor),
                              ),
                            ),
                          ),
                        ),
                        Divider(
                          height: 10,
                          thickness: 1,
                          endIndent: DeviceSize.itemWidth / 15,
                          indent: DeviceSize.itemWidth / 15,
                        ),
                        MyElevatedButton(
                          onPressed: () {},
                          width: DeviceSize.itemWidth,
                          borderRadius: BorderRadius.circular(10),
                          backgroundColor: ColorConstant.clPurple5,
                          child: const Text('Choose Plan'),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: DeviceSize.itemHeight / 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  height: DeviceSize.itemHeight * 1.8,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Standart',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: DeviceSize.itemHeight / 12,
                              color: ColorConstant.clFontOrangeColor),
                        ),
                        Text(
                          '(Valid for 3 months)',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: DeviceSize.itemHeight / 12,
                              color: ColorConstant.clFontGreyColor),
                        ),
                        Text(
                          '₹2,500',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: DeviceSize.itemHeight / 8,
                              color: ColorConstant.black900),
                        ),
                        Divider(
                          height: 10,
                          thickness: 1,
                          endIndent: DeviceSize.itemWidth / 15,
                          indent: DeviceSize.itemWidth / 15,
                        ),
                        SizedBox(
                          height: DeviceSize.itemHeight / 4,
                          child: Center(
                            child: ListTile(
                              title: Text(
                                'Profile View',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: DeviceSize.itemHeight / 12,
                                    color: ColorConstant.clFontGreyColor),
                              ),
                              trailing: Text(
                                '20(Day)',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: DeviceSize.itemHeight / 12,
                                    color: ColorConstant.clFontGreyColor),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: DeviceSize.itemHeight / 4,
                          child: Center(
                            child: ListTile(
                              title: Text(
                                'Profile Request',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: DeviceSize.itemHeight / 12,
                                    color: ColorConstant.clFontGreyColor),
                              ),
                              trailing: Text(
                                '40',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: DeviceSize.itemHeight / 12,
                                    color: ColorConstant.clFontGreyColor),
                              ),
                            ),
                          ),
                        ),
                        Divider(
                          height: 10,
                          thickness: 1,
                          endIndent: DeviceSize.itemWidth / 15,
                          indent: DeviceSize.itemWidth / 15,
                        ),
                        MyElevatedButton(
                          onPressed: () {},
                          width: DeviceSize.itemWidth,
                          borderRadius: BorderRadius.circular(10),
                          backgroundColor: ColorConstant.clPurple5,
                          child: const Text('Choose Plan'),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: DeviceSize.itemHeight / 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  height: DeviceSize.itemHeight * 1.8,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Premium',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: DeviceSize.itemHeight / 12,
                              color: ColorConstant.clFontOrangeColor),
                        ),
                        Text(
                          '(Valid for 6 months)',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: DeviceSize.itemHeight / 12,
                              color: ColorConstant.clFontGreyColor),
                        ),
                        Text(
                          '₹3,500',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: DeviceSize.itemHeight / 8,
                              color: ColorConstant.black900),
                        ),
                        Divider(
                          height: 10,
                          thickness: 1,
                          endIndent: DeviceSize.itemWidth / 15,
                          indent: DeviceSize.itemWidth / 15,
                        ),
                        SizedBox(
                          height: DeviceSize.itemHeight / 4,
                          child: Center(
                            child: ListTile(
                              title: Text(
                                'Profile View',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: DeviceSize.itemHeight / 12,
                                    color: ColorConstant.clFontGreyColor),
                              ),
                              trailing: Text(
                                '30(Day)',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: DeviceSize.itemHeight / 12,
                                    color: ColorConstant.clFontGreyColor),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: DeviceSize.itemHeight / 4,
                          child: Center(
                            child: ListTile(
                              title: Text(
                                'Profile Request',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: DeviceSize.itemHeight / 12,
                                    color: ColorConstant.clFontGreyColor),
                              ),
                              trailing: Text(
                                '60',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: DeviceSize.itemHeight / 12,
                                    color: ColorConstant.clFontGreyColor),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: DeviceSize.itemHeight / 4,
                          child: Center(
                            child: ListTile(
                              title: Text(
                                'Profile Highlight',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: DeviceSize.itemHeight / 12,
                                    color: ColorConstant.clFontGreyColor),
                              ),
                              trailing: Text(
                                'Yes',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: DeviceSize.itemHeight / 12,
                                    color: ColorConstant.clGreen),
                              ),
                            ),
                          ),
                        ),
                        Divider(
                          height: 10,
                          thickness: 1,
                          endIndent: DeviceSize.itemWidth / 15,
                          indent: DeviceSize.itemWidth / 15,
                        ),
                        MyElevatedButton(
                          onPressed: () {},
                          width: DeviceSize.itemWidth,
                          borderRadius: BorderRadius.circular(10),
                          backgroundColor: ColorConstant.clPurple5,
                          child: const Text('Choose Plan'),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: DeviceSize.itemHeight / 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  height: DeviceSize.itemHeight * 1.8,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Special',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: DeviceSize.itemHeight / 12,
                              color: ColorConstant.clFontOrangeColor),
                        ),
                        Text(
                          '(Valid for 1 Year)',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: DeviceSize.itemHeight / 12,
                              color: ColorConstant.clFontGreyColor),
                        ),
                        Text(
                          '₹4,500',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: DeviceSize.itemHeight / 8,
                              color: ColorConstant.black900),
                        ),
                        Divider(
                          height: 10,
                          thickness: 1,
                          endIndent: DeviceSize.itemWidth / 15,
                          indent: DeviceSize.itemWidth / 15,
                        ),
                        SizedBox(
                          height: DeviceSize.itemHeight / 4,
                          child: Center(
                            child: ListTile(
                              title: Text(
                                'Profile View',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: DeviceSize.itemHeight / 12,
                                    color: ColorConstant.clFontGreyColor),
                              ),
                              trailing: Text(
                                '50(Day)',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: DeviceSize.itemHeight / 12,
                                    color: ColorConstant.clFontGreyColor),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: DeviceSize.itemHeight / 4,
                          child: Center(
                            child: ListTile(
                              title: Text(
                                'Profile Request',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: DeviceSize.itemHeight / 12,
                                    color: ColorConstant.clFontGreyColor),
                              ),
                              trailing: Text(
                                '100',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: DeviceSize.itemHeight / 12,
                                    color: ColorConstant.clFontGreyColor),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: DeviceSize.itemHeight / 4,
                          child: Center(
                            child: ListTile(
                              title: Text(
                                'Profile Highlight',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: DeviceSize.itemHeight / 12,
                                    color: ColorConstant.clFontGreyColor),
                              ),
                              trailing: Text(
                                'Yes',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: DeviceSize.itemHeight / 12,
                                    color: ColorConstant.clGreen),
                              ),
                            ),
                          ),
                        ),
                        Divider(
                          height: 10,
                          thickness: 1,
                          endIndent: DeviceSize.itemWidth / 15,
                          indent: DeviceSize.itemWidth / 15,
                        ),
                        MyElevatedButton(
                          onPressed: () {},
                          width: DeviceSize.itemWidth,
                          borderRadius: BorderRadius.circular(10),
                          backgroundColor: ColorConstant.clPurple5,
                          child: const Text('Choose Plan'),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 200,
                )
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

// class ChooseYourFiftyTwoScreen extends StatelessWidget {
//   const ChooseYourFiftyTwoScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return DecoratedBox(
//       decoration: BoxDecoration(
//         image: DecorationImage(
//             image: AssetImage("assets/images/img_background_first.png"),
//             fit: BoxFit.cover),),
//       child: Scaffold(
//         appBar: ClAppbarLeadArrowBackSuffHeart(),
//         body: SingleChildScrollView(
//           physics: BouncingScrollPhysics(),
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Center(
//                   child: Text(
//                     'Choose Your Subscription Plan',
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//                   ),
//                 ),
//                 SizedBox(
//                   height: DeviceSize.itemHeight / 10,
//                 ),
//                 Container(
//                   height: DeviceSize.itemHeight,
//                   child: Padding(
//                     padding: const EdgeInsets.all(20.0),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Text(
//                           'Trial',
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold, fontSize: DeviceSize.itemHeight/12, color: ColorConstant.clFontGreenColor),
//                         ),
//                         Text(
//                           '(Valid for 15 days)',
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold, fontSize: DeviceSize.itemHeight/12, color: ColorConstant.clFontGreyColor),
//                         ),
//                         Text(
//                           'Free',
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold, fontSize: DeviceSize.itemHeight/8, color: ColorConstant.clFontGreenColor),
//                         ),
//                         Divider(
//                           height: 10,
//                           thickness: 1,
//                           endIndent: 50,
//                           indent: 50,
//                         ),
//                         SizedBox(
//                           height: DeviceSize.itemHeight / 4,
//                           child: Center(
//                             child: Text(
//                               'Just Profile View only',
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold, fontSize: DeviceSize.itemHeight/12,  color: ColorConstant.clFontGreyColor),
//                             ),
//                           ),
//                         ),
//                         Divider(
//                           height: 10,
//                           thickness: 1,
//                           endIndent: 50,
//                           indent: 50,
//                         ),
//                         MyElevatedButton(
//                             onPressed: () {}, 
//                             width: DeviceSize.itemWidth,
//                             child: Text('Start Free'),
//                             borderRadius: BorderRadius.circular(10),
//                             backgroundColor: ColorConstant.clFontGreenColor,
//                             ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: DeviceSize.itemHeight / 10,
//                 ),
//                  Container(
//                   height: DeviceSize.itemHeight,
//                   child: Padding(
//                     padding: const EdgeInsets.all(20.0),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Text(
//                           'Trial',
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold, fontSize: DeviceSize.itemHeight/12, color: ColorConstant.clFontGreenColor),
//                         ),
//                         Text(
//                           '(Valid for 15 days)',
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold, fontSize: DeviceSize.itemHeight/12, color: ColorConstant.clFontGreyColor),
//                         ),
//                         Text(
//                           'Free',
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold, fontSize: DeviceSize.itemHeight/8, color: ColorConstant.clFontGreenColor),
//                         ),
//                         Divider(
//                           height: 10,
//                           thickness: 1,
//                           endIndent: 50,
//                           indent: 50,
//                         ),
//                         SizedBox(
//                           height: DeviceSize.itemHeight / 4,
//                           child: Center(
//                             child: Text(
//                               'Just Profile View only',
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold, fontSize: DeviceSize.itemHeight/12,  color: ColorConstant.clFontGreyColor),
//                             ),
//                           ),
//                         ),
//                         Divider(
//                           height: 10,
//                           thickness: 1,
//                           endIndent: 50,
//                           indent: 50,
//                         ),
//                         MyElevatedButton(
//                             onPressed: () {}, 
//                             width: DeviceSize.itemWidth,
//                             child: Text('Start Free'),
//                             borderRadius: BorderRadius.circular(10),
//                             backgroundColor: ColorConstant.clFontGreenColor,
//                             ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         bottomNavigationBar: Padding(
//           padding: const EdgeInsets.all(20),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Expanded(
//                 flex: 10,
//                 child: MyElevatedButtonWithBorderColor(
//                     onPressed: () {},
//                     borderRadius: BorderRadius.circular(10),
//                     width: double.maxFinite,
//                     backgroundColor: Colors.white,
//                     // gradient: LinearGradient(
//                     //     begin: Alignment(0, 0.56),
//                     //     end: Alignment(1, 0.56),
//                     //     colors: [ColorConstant.indigo500, ColorConstant.purpleA100]),
//                     child: Text(
//                       'Cancel',
//                       style: TextStyle(
//                           color: ColorConstant.clPurple5,
//                           // fontWeight: FontWeight.bold,
//                           fontSize: DeviceSize.itemHeight / 15),
//                     )),
//               ),
//               Expanded(
//                 flex: 1,
//                 child: SizedBox(
//                   height: DeviceSize.itemHeight / 10,
//                 ),
//               ),
//               Expanded(
//                 flex: 10,
//                 child: MyElevatedButton(
//                     onPressed: () {},
//                     borderRadius: BorderRadius.circular(10),
//                     width: double.maxFinite,
//                     backgroundColor: Colors.transparent,
//                     // gradient: LinearGradient(
//                     //     begin: Alignment(0, 0.56),
//                     //     end: Alignment(1, 0.56),
//                     //     colors: [ColorConstant.indigo500, ColorConstant.purpleA100]),
//                     child: Text(
//                       'Submit',
//                     )),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
