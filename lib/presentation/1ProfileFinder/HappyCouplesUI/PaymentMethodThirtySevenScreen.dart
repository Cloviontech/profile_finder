import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:profile_finder/core/utils/color_constant.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/CustomWidgets.dart';

class PaymentMethodThirtySevenScreen extends StatefulWidget {
  @override
  State<PaymentMethodThirtySevenScreen> createState() =>
      _PaymentMethodThirtySevenScreenState();
}

class _PaymentMethodThirtySevenScreenState
    extends State<PaymentMethodThirtySevenScreen> {
  bool _applePay = false;
  bool _googlePay = false;
  bool _payWithCard = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: ColorConstant.deepPurpleA200,
       appBar: ClAppbarLeadArrowBackSuffHeart(testingNextPage: PaymentMethodThirtySevenScreen() ),
        
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                ColorConstant.whiteA700,
                ColorConstant.clPurple05,
                ColorConstant.clPurple05,
                ColorConstant.whiteA700,
              ],
            ),
          ),
          child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Text(
                      "Payment Method",
                      // textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Container(
                      height: 130,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: ColorConstant.clPurple2),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Video",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Text(
                                  "2 month Validity",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13),
                                ),
                                Text(
                                  "₹ 2,500",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                ),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text("Add",
                                  style: TextStyle(
                                      color: ColorConstant.whiteA700,
                                      fontWeight: FontWeight.bold)),
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(35, 35),
                                backgroundColor: ColorConstant.clPurple2,
                                shadowColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    side: BorderSide(
                                        width: 1,
                                        color: ColorConstant.whiteA700)),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Container(
                      decoration: BoxDecoration(
                          color: ColorConstant.clPurple3,
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        // mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            flex: 3,
                            child: TextField(
                              decoration: InputDecoration(
                                  hintText: "Enter Coupon Code",
                                  hintStyle:
                                      TextStyle(fontWeight: FontWeight.bold),
                                  fillColor: ColorConstant.whiteA700,
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(0))),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: Center(child: Text("Apply")),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  // CheckboxListTile(
                    
                  //   title: Text('Apple Pay'),
                  //   side: BorderSide.none,
                  //   checkboxShape: CircleBorder(side: BorderSide(width: 1)),
                  //   secondary: SvgPicture.asset(
                  //     'assets/images/img_frame2.svg',
                  //     width: 20,
                  //   ),
                  //   autofocus: true,
                  //   activeColor: ColorConstant.clPurple5,
                  //   checkColor: Colors.white,
                  //   // tileColor: Colors.red,
                  //   selected: _applePay,
                  //   value: _applePay,
                  //   onChanged: (value) {
                  //     setState(() {
                  //       _applePay = !value!;
                  //     });
                  //   },
                  // ),

                  ListTile(
                    leading: SvgPicture.asset(
                      'assets/images/img_frame2.svg',
                      width: 20,
                    ),
                    title: Text("Apple Pay"),
                    trailing: Container(
                      height: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Checkbox(
                        side: BorderSide.none,
                        shape: CircleBorder(side: BorderSide.none),
                        value: _applePay,
                        onChanged: (value) {
                          setState(() {
                            _applePay = value!;
                          });
                        },
                      ),
                    ),
                  ),
                  Divider(height: 1,),
                  ListTile(
                    leading: SvgPicture.asset(
                      'assets/images/img_frame2.svg',
                      width: 20,
                    ),
                    title: Text("Google Pay"),
                    trailing: Container(
                      height: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Checkbox(
                        side: BorderSide.none,
                        shape: CircleBorder(side: BorderSide.none),
                        value: _googlePay,
                        onChanged: (value) {
                          setState(() {
                            _googlePay = value!;
                          });
                        },
                      ),
                    ),
                  ),
                   Divider(height: 1,),
                  ListTile(
                    leading: SvgPicture.asset(
                      'assets/images/img_frame2.svg',
                      width: 20,
                    ),
                    title: Text("Pay with Card"),
                    trailing: Container(
                      height: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Checkbox(
                        side: BorderSide.none,
                        shape: CircleBorder(side: BorderSide.none),
                        value: _payWithCard,
                        onChanged: (value) {
                          setState(() {
                            _payWithCard = value!;
                          });
                        },
                      ),
                    ),
                  ),
                   Divider(height: 1,),
                   SizedBox(height: 50,),
                  MyElevatedButton(
                    onPressed: () {},
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/images/img_applefill.svg", color: Colors.white,),
                        Text("Pay", style: TextStyle(fontSize: 18),),
                      ],
                    ),
                    width: double.maxFinite,
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      transform: GradientRotation(6),
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      
                      colors: [
                      ColorConstant.clPurple11,
                      
                      ColorConstant.clbuttonpink1
                      
                    ]),
                  )
                ]),
          )),
        ));
  }
}
