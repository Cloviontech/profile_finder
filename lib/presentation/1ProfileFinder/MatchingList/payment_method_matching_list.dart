import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:profile_finder/core/utils/color_constant.dart';
import 'package:profile_finder/core/utils/size_utils.dart';
import 'package:profile_finder/presentation/1ProfileFinder/MatchingList/AddRefferenceFiftyThreeScreen.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/CustomWidgets.dart';

class PaymentMethodMatchingListScreen extends StatefulWidget {
  const PaymentMethodMatchingListScreen({super.key});

  @override
  State<PaymentMethodMatchingListScreen> createState() =>
      _PaymentMethodMatchingListScreenState();
}

class _PaymentMethodMatchingListScreenState
    extends State<PaymentMethodMatchingListScreen> {
  bool _applePay = true;
  bool _googlePay = false;
  bool _PayWithcard = false;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/img_background_first.png'),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: const ClAppbarLeadGridSuffHeart(
            testingNextPage: AddRefferenceFiftyThreeScreen(),
          ),
          // appBar: AppBar(
          //   backgroundColor: Colors.transparent,
          // ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    'Payment Method',
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
                  height: DeviceSize.itemHeight * 1.2,
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
                        // Divider(
                        //   height: 10,
                        //   thickness: 1,
                        //   endIndent: DeviceSize.itemWidth / 15,
                        //   indent: DeviceSize.itemWidth / 15,
                        // ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Container(
                        height: 50,
                        // width: 200,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(8),
                                bottomLeft: Radius.circular(8)),
                            border: Border.all(color: ColorConstant.gray600)),
                        child: const TextField(
                          decoration: InputDecoration(
                              hintText: "Enter Coupon Code",
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 15,
                              ),
                              hintStyle: TextStyle(),
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 50,
                        // width: 100,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(8),
                                topRight: Radius.circular(8)),
                            color: ColorConstant.deepPurpleA20063),
                        child: const Center(
                          child: Text(
                            "Apply",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: DeviceSize.itemHeight / 10,
                ),
                const Divider(),
                CheckboxListTile(
                    checkboxShape: const CircleBorder(),
                    // controlAffinity: ListTileControlAffinity.trailing,
                    secondary: SvgPicture.asset(
                      'assets/images/Group.svg',
                      height: 20,
                    ),
                    title: const Text("Apple Pay"),
                    value: _applePay,
                    selected: _applePay,
                    onChanged: (value) {
                      setState(() {
                        _applePay = value!;
                        _googlePay = false;
                        _PayWithcard = false;
                      });
                      debugPrint(_applePay.toString());
                    }),
                const Divider(),
                CheckboxListTile(
                    checkboxShape: const CircleBorder(),
                    controlAffinity: ListTileControlAffinity.trailing,
                    secondary: SvgPicture.asset(
                      // 'assets/images/Payment Icons.svg',
                      // 'assets/images/img_mailline.svg',
                      'assets/images/Payment Icons.svg',

                      height: 20,
                    ),
                    title: const Text("Google Pay"),
                    value: _googlePay,
                    selected: _googlePay,
                    onChanged: (value) {
                      setState(() {
                        _googlePay = value!;
                        _applePay = false;
                        _PayWithcard = false;
                      });
                    }),
                const Divider(),
                CheckboxListTile(
                    checkboxShape: const CircleBorder(),
                    controlAffinity: ListTileControlAffinity.trailing,
                    secondary: SvgPicture.asset(
                      'assets/images/Group (2).svg',
                      height: 20,
                    ),
                    title: const Text("Pay with Card"),
                    value: _PayWithcard,
                    selected: _PayWithcard,
                    onChanged: (value) {
                      setState(() {
                        _PayWithcard = value!;
                        _googlePay = false;
                        _applePay = false;
                      });
                    }),
                const Divider(),
                SizedBox(
                  height: DeviceSize.itemHeight / 10,
                ),
                MyElevatedButton(
                  width: double.maxFinite,
                  borderRadius: BorderRadius.circular(8),
                  backgroundColor: const Color(0xff7B61FF),
                  onPressed: () {},
                  child: SvgPicture.asset(
                    'assets/images/Group (4).svg',
                    height: 20,
                  ),
                ),

                // SizedBox(
                //   height: 200,
                // )
              ],
            ),
          )

          // Container(
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(10),
          //     color: Colors.white,
          //   ),
          //   height: DeviceSize.itemHeight * 1.8,
          //   child: Padding(
          //     padding: const EdgeInsets.all(20.0),
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //       children: [
          //         Text(
          //           'Basic',
          //           style: TextStyle(
          //               fontWeight: FontWeight.bold,
          //               fontSize: DeviceSize.itemHeight / 12,
          //               color: ColorConstant.clFontSkyBlueColor),
          //         ),
          //         Text(
          //           '(Valid for 1 month)',
          //           style: TextStyle(
          //               fontWeight: FontWeight.bold,
          //               fontSize: DeviceSize.itemHeight / 12,
          //               color: ColorConstant.clFontGreyColor),
          //         ),
          //         Text(
          //           '₹1,500',
          //           style: TextStyle(
          //               fontWeight: FontWeight.bold,
          //               fontSize: DeviceSize.itemHeight / 8,
          //               color: ColorConstant.black900),
          //         ),
          //         Divider(
          //           height: 10,
          //           thickness: 1,
          //           endIndent: DeviceSize.itemWidth / 15,
          //           indent: DeviceSize.itemWidth / 15,
          //         ),
          //         SizedBox(
          //           height: DeviceSize.itemHeight / 4,
          //           child: Center(
          //             child: ListTile(
          //               title: Text(
          //                 'Profile View',
          //                 style: TextStyle(
          //                     fontWeight: FontWeight.bold,
          //                     fontSize: DeviceSize.itemHeight / 12,
          //                     color: ColorConstant.clFontGreyColor),
          //               ),
          //               trailing: Text(
          //                 '10(Day)',
          //                 style: TextStyle(
          //                     fontWeight: FontWeight.bold,
          //                     fontSize: DeviceSize.itemHeight / 12,
          //                     color: ColorConstant.clFontGreyColor),
          //               ),
          //             ),
          //           ),
          //         ),
          //         SizedBox(
          //           height: DeviceSize.itemHeight / 4,
          //           child: Center(
          //             child: ListTile(
          //               title: Text(
          //                 'Profile Request',
          //                 style: TextStyle(
          //                     fontWeight: FontWeight.bold,
          //                     fontSize: DeviceSize.itemHeight / 12,
          //                     color: ColorConstant.clFontGreyColor),
          //               ),
          //               trailing: Text(
          //                 '20',
          //                 style: TextStyle(
          //                     fontWeight: FontWeight.bold,
          //                     fontSize: DeviceSize.itemHeight / 12,
          //                     color: ColorConstant.clFontGreyColor),
          //               ),
          //             ),
          //           ),
          //         ),
          //         Divider(
          //           height: 10,
          //           thickness: 1,
          //           endIndent: DeviceSize.itemWidth / 15,
          //           indent: DeviceSize.itemWidth / 15,
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          ),
    );
  }
}
