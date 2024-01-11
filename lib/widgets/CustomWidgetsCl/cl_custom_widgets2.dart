
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:profile_finder/core/utils/color_constant.dart';
import 'package:profile_finder/core/utils/image_constant.dart';
import 'package:profile_finder/core/utils/size_utils.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/CustomWidgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_tags/simple_tags.dart';

class TextContainerTwoLineWidgetCustomCl extends StatelessWidget {
  const TextContainerTwoLineWidgetCustomCl({
    super.key,
    required this.text1,
    required this.text2,
    required this.containerHeight,
    this.backgroundColor,
  });

  final String text1;
  final String text2;
  final double containerHeight;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // height: DeviceSize.itemHeight / 2,
          height: containerHeight,

          width: double.maxFinite,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: backgroundColor ?? ColorConstant.clPurple05,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text1,
                  style: TextStyle(
                      color: ColorConstant.clFontGreyColor,
                      fontWeight: FontWeight.bold,
                      fontSize: DeviceSize.itemHeight / 15),
                ),
                SizedBox(
                  height: DeviceSize.itemHeight / 20,
                ),
                Text(
                  text2,
                  style: TextStyle(
                      color: ColorConstant.black900,
                      fontWeight: FontWeight.bold,
                      fontSize: DeviceSize.itemHeight / 15),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: DeviceSize.itemHeight / 20,
        ),
      ],
    );
  }
}

class TextContainerTwoLineWidgetCustomCl6Line extends StatelessWidget {
  const TextContainerTwoLineWidgetCustomCl6Line({
    super.key,
    this.text1,
    this.text2,
    this.containerHeight,
    this.text3,
    this.text4,
    this.text5,
    this.text6,
    this.backgroundColor,
  });

  final String? text1;
  final String? text2;
  final double? containerHeight;
  final String? text3;
  final String? text4;
  final String? text5;
  final String? text6;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // height: DeviceSize.itemHeight / 2,
          height: containerHeight,

          width: double.maxFinite,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: backgroundColor ?? ColorConstant.clPurple05,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text1 ?? '',
                  style: TextStyle(
                      color: ColorConstant.clFontGreyColor,
                      fontWeight: FontWeight.bold,
                      fontSize: DeviceSize.itemHeight / 15),
                ),
                SizedBox(
                  height: DeviceSize.itemHeight / 30,
                ),
                Text(
                  text2 ?? '',
                  style: TextStyle(
                      color: ColorConstant.black900,
                      fontWeight: FontWeight.bold,
                      fontSize: DeviceSize.itemHeight / 15),
                ),
                SizedBox(
                  height: DeviceSize.itemHeight / 10,
                ),
                Text(
                  text3 ?? '',
                  style: TextStyle(
                      color: ColorConstant.clFontGreyColor,
                      fontWeight: FontWeight.bold,
                      fontSize: DeviceSize.itemHeight / 15),
                ),
                SizedBox(
                  height: DeviceSize.itemHeight / 30,
                ),
                Text(
                  text4 ?? '',
                  style: TextStyle(
                      color: ColorConstant.black900,
                      fontWeight: FontWeight.bold,
                      fontSize: DeviceSize.itemHeight / 15),
                ),
                SizedBox(
                  height: DeviceSize.itemHeight / 10,
                ),
                Text(
                  text5 ?? '',
                  style: TextStyle(
                      color: ColorConstant.clFontGreyColor,
                      fontWeight: FontWeight.bold,
                      fontSize: DeviceSize.itemHeight / 15),
                ),
                SizedBox(
                  height: DeviceSize.itemHeight / 30,
                ),
                Text(
                  text6 ?? '',
                  style: TextStyle(
                      color: ColorConstant.black900,
                      fontWeight: FontWeight.bold,
                      fontSize: DeviceSize.itemHeight / 15),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: DeviceSize.itemHeight / 20,
        ),
      ],
    );
  }
}

class TagSimpleWidgetCustomCl extends StatelessWidget {
  const TagSimpleWidgetCustomCl({
    super.key,
    required List<String> myInterest,
  }) : _myInterest = myInterest;

  final List<String> _myInterest;

  @override
  Widget build(BuildContext context) {
    return SimpleTags(
      content: _myInterest,
      wrapSpacing: 20,
      wrapRunSpacing: 10,
      tagContainerPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      tagTextStyle: TextStyle(
        color: Colors.black54,
        letterSpacing: 0.7,
        fontSize: DeviceSize.itemHeight / 12,
        fontWeight: FontWeight.bold,
      ),
      tagContainerDecoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade100),
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        boxShadow: [
          BoxShadow(
            color: ColorConstant.clgreycardBorderColor,
            //  spreadRadius: 1,
            //  blurRadius: 1,
            //  offset: Offset(1.75, 3.5), // c
          )
        ],
      ),
    );
  }
}

class TagSimpleFont15WidgetCustomCl extends StatelessWidget {
  const TagSimpleFont15WidgetCustomCl({
    super.key,
    required List<String> myInterest,
  }) : _myInterest = myInterest;

  final List<String> _myInterest;

  @override
  Widget build(BuildContext context) {
    return SimpleTags(
      content: _myInterest,
      wrapSpacing: 20,
      wrapRunSpacing: 10,
      tagContainerPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      tagTextStyle: TextStyle(
        color: Colors.black54,
        letterSpacing: 0.7,
        fontSize: DeviceSize.itemHeight / 13,
        fontWeight: FontWeight.bold,
      ),
      tagContainerDecoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade100),
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        boxShadow: [
          BoxShadow(
            color: ColorConstant.clgreycardBorderColor,
            //  spreadRadius: 1,
            //  blurRadius: 1,
            //  offset: Offset(1.75, 3.5), // c
          )
        ],
      ),
    );
  }
}

class BottomSingleButtomWidgetCustomCl extends StatelessWidget {
  const BottomSingleButtomWidgetCustomCl({
    super.key,
    required this.title1,
  });
  final String title1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: MyElevatedButton(
          onPressed: () {},
          borderRadius: BorderRadius.circular(10),
          backgroundColor: Colors.transparent,
          child: Text(
            title1,
          )),
    );
  }
}

class TextIndigoTitle extends StatelessWidget {
  final String word;

  const TextIndigoTitle({super.key, required this.word});

  @override
  Widget build(BuildContext context) {
    return Text(
      word,
      style: TextStyle(
          color: ColorConstant.clFontColorIndigo1, fontWeight: FontWeight.bold),
    );
  }
}

/* Select and Upload Document */

class PickDocument extends StatefulWidget {
  const PickDocument({super.key});

  @override
  State<PickDocument> createState() => _PickDocumentState();
}

class _PickDocumentState extends State<PickDocument> {
  PlatformFile? pickedFile;

  late FToast fToast;

  // Future UploadDoc() async {
  //   final path = 'files/${pickedFile!.name}';
  //   final file = File(pickedFile!.path!);

  //   final ref = FirebaseStorage.instance.ref().child(path);
  //   ref.putFile(file).whenComplete(() => fToast.showToast(
  //         gravity: ToastGravity.BOTTOM,
  //         toastDuration: Duration(milliseconds: 2000),
  //         child: Row(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             Icon(Icons.face),
  //             Text(
  //               "Data Uploaded Succesfully!",
  //               style: TextStyle(
  //                   color: Colors.white,
  //                   fontSize: 20.0,
  //                   fontWeight: FontWeight.bold),
  //             )
  //           ],
  //         ),
  //       ));
  // }

  Future PickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    setState(() {
      pickedFile = result.files.first;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class SelectFileWidget extends StatelessWidget {
  const SelectFileWidget({
    super.key,
    required this.clickHereTitle,
  });
  final String clickHereTitle;

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      color: ColorConstant.gray300,
      strokeWidth: 1,
      dashPattern: [6, 6],
      radius: Radius.circular(20),
      child: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),

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
              },
              child: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: SvgPicture.asset(
                      ImageConstant.imgGroup228,
                      height: 50,
                    ),
                  )),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              clickHereTitle,
              style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  height: 2,
                  color: ColorConstant.gray600,
                  fontSize: DeviceSize.itemWidth / 12.413),
            ),
            SizedBox(
              height: 80,
            ),
          ],
        ),
      ),
    );
  }
}

class ClListTileInsideCardWidget extends StatelessWidget {
  const ClListTileInsideCardWidget({
    super.key,
    required this.roles,
  });

  final String roles;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          margin: EdgeInsets.zero,
          elevation: 0,
          child: ListTile(
            leading: SvgPicture.asset('assets/images/Vector4.svg'),
            title: Text(
              roles,
              style: TextStyle(
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w500,
                  color: ColorConstant.indigo900,
                  fontSize: DeviceSize.itemWidth / 11.688),
            ),
            trailing: SvgPicture.asset('assets/images/btn-md-primary.svg'),
          ),
        ),
        D10HCustomClSizedBoxWidget(
          height: 20,
        ),
      ],
    );
  }
}

class ClListviewBuilderTableWidget extends
 StatelessWidget {
  const ClListviewBuilderTableWidget({
    super.key,
    required this.officeDetailsQus,
    required this.officeDetailsAns,
  });

  final List<String> officeDetailsQus;
  final List<String> officeDetailsAns;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.white),
      height: officeDetailsQus.length * 60,
      child: ListView.builder(
          itemCount: officeDetailsQus.length,
          itemBuilder: (context, Index) {
            return ListTile(
              horizontalTitleGap: DeviceSize.itemWidth / 3.11,
              leading: Container(
                // width: MediaQuery.of(context).size.width/3,
                width: size.width / 4,
                child: Text(
                  officeDetailsQus[Index],
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      color: ColorConstant.blueGray900,
                      fontSize: 14),
                ),
              ),
              title: Text(
                officeDetailsAns[Index],
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    color: ColorConstant.indigo900,
                    fontSize: 14),
              ),
              // trailing: Text(officeDetailsQus.length.toString()),
            );
          }),
    );
  }
}

/*ListView builder Card Code... Use in Future */
// if (_isLoading)
//   const Center(
//     child: CircularProgressIndicator(),
//   )
// else
//   Container(
//     height: DeviceSize.itemHeight * 3,
//     child: ListView.builder(
//       scrollDirection: Axis.vertical,
//       itemBuilder: (context, index) {
//         return Card(
//           elevation: 0,
//           child: Container(
//             height: DeviceSize.itemHeight / 1.4,
//             // height: double.infinity,
//             width: double.maxFinite,
//             child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       children: [
//                         Align(
//                           alignment: Alignment.topCenter,
//                           child: CircleAvatar(
//                             backgroundImage: NetworkImage(
//                                 dataFromAPI!
//                                     .products[index].thumbnail),
//                           ),
//                         ),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         Container(
//                           width: DeviceSize.itemWidth / 1.3,
//                           child: Column(
//                             crossAxisAlignment:
//                                 CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 dataFromAPI!.products[index].id
//                                     .toString(),
//                                 style: TextStyle(
//                                     fontFamily: 'Inter',
//                                     // fontWeight: FontWeight.w900,
//                                     color:
//                                         ColorConstant.clGreyFontColor3,
//                                     fontSize:
//                                         DeviceSize.itemWidth /
//                                             15.413),
//                               ),
//                               Text(
//                                   dataFromAPI!.products[index].category.toString(),
//                                   style: TextStyle(
//                                     fontFamily: 'Inter',
//                                     fontWeight: FontWeight.bold,
//                                     color:
//                                         ColorConstant.black900,
//                                     fontSize:
//                                         DeviceSize.itemWidth /
//                                             11.413),
//                                   ),
//                               Text(
//                                 dataFromAPI!.products[index].category
//                                     .toString(),
//                                style: TextStyle(
//                                     fontFamily: 'Inter',
//                                     // fontWeight: FontWeight.w900,
//                                     color:
//                                         ColorConstant.clGreyFontColor3,
//                                     fontSize:
//                                         DeviceSize.itemWidth /
//                                             11.413),
//                               ),
//                               Expanded(
//                                 child: Text(
//                                     dataFromAPI!.products[index].category.toString(),
//                                     style: TextStyle(
//                                       fontFamily: 'Inter',
//                                       // fontWeight: FontWeight.w900,
//                                       color:
//                                           ColorConstant.clGreyFontColor3,
//                                       fontSize:
//                                           DeviceSize.itemWidth /
//                                               11.413),
//                                     ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                     Column(
//                       mainAxisAlignment:
//                           MainAxisAlignment.spaceBetween,
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         Container(
//                           width: DeviceSize.itemWidth / 2.2,
//                           // height: DeviceSize.itemHeight/4,
//                           decoration: BoxDecoration(
//                               color:
//                                   ColorConstant.clFillGreenColor2,
//                               borderRadius:
//                                   BorderRadius.circular(30)),
//                           child: Padding(
//                             padding: const EdgeInsets.all(10.0),
//                             child: Center(
//                                 child: Text(dataFromAPI!
//                                     .products[index].price
//                                     .toString())),
//                           ),
//                         ),
//                         Container(
//                           height: DeviceSize.itemHeight / 4,
//                           decoration: BoxDecoration(
//                               color: ColorConstant.clGreyFillColor5,
//                               borderRadius:
//                                   BorderRadius.circular(8)),
//                           child: Padding(
//                             padding: EdgeInsets.all(10.0),
//                             child: SvgPicture.asset(
//                               'assets/images/Vector3.svg',
//                             ),
//                           ),
//                         ),
//                       ],
//                     )
//                   ],
//                 )

//                 ),
//           ),
//         );
//       },
//       itemCount: dataFromAPI!.products.length,
//     ),
//   ),

/* listtile inside card Listview builder */

//  Container(
//                 height: DeviceSize.itemHeight*2 ,
//                 child: ListView.builder(
//                   itemCount: roles.length,
//                   itemBuilder: (context, Index){
//                   return ClCardAndListtileWidget(roles: roles, index: Index,);
//                 }),
//               ),

class ClCardAndListtileWidget extends StatelessWidget {
  const ClCardAndListtileWidget({
    super.key,
    required this.roles,
    required this.index,
  });

  final List<String> roles;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          margin: EdgeInsets.zero,
          elevation: 0,
          child: ListTile(
            leading: SvgPicture.asset('assets/images/Vector4.svg'),
            title: Text(
              roles[index],
              style: TextStyle(
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w500,
                  color: ColorConstant.indigo900,
                  fontSize: DeviceSize.itemWidth / 11.688),
            ),
            trailing: SvgPicture.asset('assets/images/btn-md-primary.svg'),
          ),
        ),
        D10HCustomClSizedBoxWidget(
          height: 20,
        ),
      ],
    );
  }
}

class AdDistributorBannerControl extends StatelessWidget {
  String adNo;
  String date;
  String? status;
  int? viewsCount;
  int? balanceAmount;
  int? coins;
  Color? wallColor;
  final bool isSwitched;

  AdDistributorBannerControl({
    super.key,
    this.adNo = "Test",
    this.date = '10 January, 2021 | 10:00am',
    this.status = 'Deactivate',
    this.viewsCount = 900,
    this.balanceAmount = 100,
    this.coins = 4,
    this.wallColor = Colors.orangeAccent,
    required this.isSwitched,
  });

  @override
  Widget build(BuildContext context) {
    // var lightRed1cl = ColorConstant.lightRed1cl;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8)),
                  color: wallColor,
                ),
                height: 200,
              ),
              // SvgPicture.asset('assets/images/Rectangle1005.svg'),
              SvgPicture.asset('assets/images/Frame.svg')
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  adNo.toString(),
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                      color: ColorConstant.blueGray900,
                      fontSize: DeviceSize.itemWidth / 10),
                ),
                Text(
                  'Banner Ad',
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      color: ColorConstant.blueGray900,
                      fontSize: DeviceSize.itemWidth / 14),
                ),
                Text(
                  date.toString(),
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      color: ColorConstant.blueGray900,
                      fontSize: DeviceSize.itemWidth / 14),
                ),
                Row(
                  children: [
                    Text(
                      "Status: ",
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          color: ColorConstant.blueGray900,
                          fontSize: DeviceSize.itemWidth / 14),
                    ),
                    Text(
                      status.toString(),
                      style: TextStyle(
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w400,
                          color: ColorConstant.orangeColor1cl,
                          fontSize: DeviceSize.itemWidth / 14),
                    ),
                  ],
                ),
                D10HCustomClSizedBoxWidget(
                  height: 10,
                ),
                Container(
                  width: double.maxFinite,
                  // height: DeviceSize.itemHeight/3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border:
                          Border.all(color: ColorConstant.gray300, width: 2)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          viewsCount.toString(),
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w700,
                              color: ColorConstant.orangeColor1cl,
                              fontSize: DeviceSize.itemWidth / 10),
                        ),
                        Text(
                          'Views',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                              color: ColorConstant.gray600,
                              fontSize: DeviceSize.itemWidth / 14),
                        ),
                      ],
                    ),
                  ),
                ),
                D10HCustomClSizedBoxWidget(
                  height: 20,
                ),
                Container(
                  width: double.maxFinite,
                  // height: DeviceSize.itemHeight/3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border:
                          Border.all(color: ColorConstant.gray300, width: 2)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          balanceAmount.toString(),
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w700,
                              color: ColorConstant.deepPurpleA200,
                              fontSize: DeviceSize.itemWidth / 10),
                        ),
                        Text(
                          'Balance Amount',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                              color: ColorConstant.gray600,
                              fontSize: DeviceSize.itemWidth / 14),
                        ),
                      ],
                    ),
                  ),
                ),
                D10HCustomClSizedBoxWidget(
                  height: 20,
                ),
                Container(
                  width: double.maxFinite,
                  // height: DeviceSize.itemHeight/3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border:
                          Border.all(color: ColorConstant.gray300, width: 2)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              coins.toString(),
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w700,
                                  color: ColorConstant.orangeColor1cl,
                                  fontSize: DeviceSize.itemWidth / 10),
                            ),
                            Text(' '),
                            SvgPicture.asset('assets/images/Vectordiamond.svg'),
                          ],
                        ),
                        Text(
                          'Coin (0.5/views)',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                              color: ColorConstant.gray600,
                              fontSize: DeviceSize.itemWidth / 14),
                        ),
                      ],
                    ),
                  ),
                ),
                D10HCustomClSizedBoxWidget(
                  height: 20,
                ),
                Row(
                  children: [
                    FlutterSwitch(
                      height: 20.0,
                      width: 40.0,
                      padding: 4.0,
                      toggleSize: 15.0,
                      borderRadius: 10.0,
                      activeColor: ColorConstant.clGreen,
                      value: isSwitched,
                      onToggle: (value) {
                        // setState(() {
                        // isSwitched = value;
                        // });
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Close Ad',
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          color: ColorConstant.red400,
                          fontSize: DeviceSize.itemWidth / 14),
                    ),
                  ],
                ),
                D10HCustomClSizedBoxWidget(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 8,
                      child: Container(
                        // width: double.maxFinite,
                        // height: DeviceSize.itemHeight/3,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: ColorConstant.deepPurpleA200, width: 1)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'Copy Ad ID',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                                color: ColorConstant.deepPurpleA200,
                                fontSize: DeviceSize.itemWidth / 10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 8,
                      child: Container(
                        // width: double.maxFinite,
                        // height: DeviceSize.itemHeight/3,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: ColorConstant.deepPurpleA200, width: 1)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'Visibility',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                                color: ColorConstant.deepPurpleA200,
                                fontSize: DeviceSize.itemWidth / 10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                D10HCustomClSizedBoxWidget(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class dashboardCardAdDistributorCustomWidgetCl extends StatelessWidget {
  dashboardCardAdDistributorCustomWidgetCl({
    super.key,
    required this.number,
    required this.nameOfValue,
    required this.svgImagePath,
    required this.circleFillColor,
    this.numberFontColor = Colors.indigo,
  });

  final String number;
  final String nameOfValue;
  final String svgImagePath;
  final Color circleFillColor;
  final Color numberFontColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      shadowColor: Colors.white,
      elevation: 0,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        leading: Container(
          padding: EdgeInsets.all(10),
          // height: DeviceSize.itemHeight,
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: circleFillColor),
          child: SvgPicture.asset(
            svgImagePath,
            height: DeviceSize.itemHeight / 3,
          ),
        ),
        title: Text(
          number,
          style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              color: numberFontColor,
              fontSize: DeviceSize.itemHeight / 7),
        ),
        minLeadingWidth: 1,
        minVerticalPadding: 1,
        subtitle: Text(
          nameOfValue,
          style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              color: ColorConstant.clFontGreyColor,
              fontSize: DeviceSize.itemHeight / 10),
        ),
      ),
    );
  }
}

class drop_down_cl extends StatelessWidget {
  const drop_down_cl({
    super.key,
    required List<String> dropdownItemList,
  }) : _dropdownItemList = dropdownItemList;

  final List<String> _dropdownItemList;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          color: Colors.grey.shade300, borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: EdgeInsets.only(left: 10),
        child: DropdownButton(
          isExpanded: true,
          hint: Text('Select'),
          dropdownColor: Colors.red,
          // iconEnabledColor: Colors.yellow,
          // iconDisabledColor: Colors.green,
          icon: Icon(Icons.arrow_drop_down),
          underline: SizedBox(),

          // iconSize: 36,
          onChanged: (newValue) {
            //  setState(() {
            //    valueChoose = newValue.toString();
            //  });
          },

          items: _dropdownItemList.map((valueItem) {
            return DropdownMenuItem(value: valueItem, child: Text(valueItem));
          }).toList(),
        ),
      ),
    );
  }
}

class CustomClChoiceChip extends StatefulWidget {
  CustomClChoiceChip(
      {super.key, required this.valuePrimary, this.dataInput, this.title, this.subTitle, this.sharedPreffID});

  int valuePrimary;
  final List? dataInput;
  final String? title;
  final String? subTitle;
  final String? sharedPreffID;
  

  @override
  State<CustomClChoiceChip> createState() => _CustomClChoiceChipState();
}

class _CustomClChoiceChipState extends State<CustomClChoiceChip> {
 
  saveToSharedPrefferences(String? nameOfID, String valueToSave) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setString(nameOfID!, valueToSave);
  }

  

  // int selectedBackup = widget.valuePrimary;
 
 
 
 
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.title == null
            ? SizedBox()
            : Column(
                children: [
                  Text(
                    widget.title!,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const D10HCustomClSizedBoxWidget(
                    height: 50,
                  ),
                ],
              ),
        widget.subTitle == null
            ? SizedBox()
            : Column(
                children: [
                  Text(
                    widget.subTitle!,
                    style: const TextStyle(fontWeight: FontWeight.w400),
                  ),
                  D10HCustomClSizedBoxWidget(height: 20,),
                ],
              ),
        widget.title == null ? SizedBox() : SizedBox(height: 1),
        Wrap(
          // list of length 3
          spacing: 10,
          runSpacing: 10,
          children: List.generate(
            widget.dataInput!.length,
            (int indexx) {
              // choice chip allow us to
              // set its properties.
              return ChoiceChip(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.all(15),
                backgroundColor: ColorConstant.whiteA700,
                side: BorderSide(
                  color: widget.valuePrimary == indexx
                      ? ColorConstant.deepPurpleA200
                      : ColorConstant.clGreyFontColor2,
                ),
                label: Text(widget.dataInput![indexx]),
                labelStyle: TextStyle(
                    color: widget.valuePrimary == indexx
                        ? ColorConstant.deepPurpleA200
                        : ColorConstant.black900),
                // color of selected chip
                selectedColor: ColorConstant.whiteA700,

                // selected chip value
                selected: widget.valuePrimary == indexx,
                // selected: false,
                // onselected method
                onSelected: (bool selected) {
                  setState(() {
                    widget.valuePrimary = (selected ? indexx : null)!;

                    saveToSharedPrefferences(
                                  widget.sharedPreffID, widget.dataInput![widget.valuePrimary]);
                  });
                },
              );
            },
          ).toList(),
        ),
        D10HCustomClSizedBoxWidget(),
      ],
    );
  }
}
