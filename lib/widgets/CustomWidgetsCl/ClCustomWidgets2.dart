import 'dart:ui';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  });

  final String text1;
  final String text2;
  final double containerHeight;

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
            color: ColorConstant.clPurple05,
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
                    fontSize: DeviceSize.itemHeight / 15,
                  ),
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

class TextContainerTwoLineFromListWidgetCustomCl extends StatelessWidget {
  const TextContainerTwoLineFromListWidgetCustomCl({
    super.key,
    required this.text1,
    required this.text2,
    required this.containerHeight,
  });

  final String text1;
  final List<dynamic> text2;
  final double containerHeight;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.end, children: [
      Container(
        // height: DeviceSize.itemHeight / 2,
        height: containerHeight,
        alignment: Alignment.centerLeft,

        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorConstant.clPurple05,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView.builder(
              itemCount: text2.length,
              shrinkWrap: true,
              itemBuilder: ((context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "$text1 $index",
                      style: TextStyle(
                        color: ColorConstant.clFontGreyColor,
                        fontWeight: FontWeight.bold,
                        fontSize: DeviceSize.itemHeight / 15,
                      ),
                    ),
                    SizedBox(
                      height: DeviceSize.itemHeight / 20,
                    ),
                    Text(
                      text2[index],
                      style: TextStyle(
                          color: ColorConstant.black900,
                          fontWeight: FontWeight.bold,
                          fontSize: DeviceSize.itemHeight / 15),
                    ),
                  ],
                );
              })),
        ),
      ),
      SizedBox(
        height: DeviceSize.itemHeight / 20,
      ),
    ]);
  }
}

class TextContainerMultiLineFromListWidgetCustomCl extends StatelessWidget {
  TextContainerMultiLineFromListWidgetCustomCl({
    super.key,
    required this.value1,
    required this.containerHeight,
    required this.value2,
    required this.value3,
    this.heading1 = "",
    this.heading2 = "",
    this.heading3 = "",
  });

  String heading1;
  String heading2;
  String heading3;

  final List<dynamic> value1;
  final List<dynamic> value2;
  final List<dynamic> value3;

  final double containerHeight;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.end, children: [
      Container(
        // height: DeviceSize.itemHeight / 2,
        // height: containerHeight,
        alignment: Alignment.centerLeft,

        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorConstant.clPurple05,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: ListView.separated(
            itemCount: value1.length,
            shrinkWrap: true,
            itemBuilder: ((context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    heading1,
                    style: TextStyle(
                      color: ColorConstant.clFontGreyColor,
                      fontWeight: FontWeight.bold,
                      fontSize: DeviceSize.itemHeight / 15,
                    ),
                  ),
                  Text(
                    value1[index],
                    style: TextStyle(
                        color: ColorConstant.black900,
                        fontWeight: FontWeight.bold,
                        fontSize: DeviceSize.itemHeight / 15),
                  ),
                  const D10HCustomClSizedBoxWidget(),
                  Text(
                    heading2,
                    style: TextStyle(
                      color: ColorConstant.clFontGreyColor,
                      fontWeight: FontWeight.bold,
                      fontSize: DeviceSize.itemHeight / 15,
                    ),
                  ),
                  SizedBox(
                    height: DeviceSize.itemHeight / 20,
                  ),
                  Text(
                    value2[index],
                    style: TextStyle(
                        color: ColorConstant.black900,
                        fontWeight: FontWeight.bold,
                        fontSize: DeviceSize.itemHeight / 15),
                  ),
                  const D10HCustomClSizedBoxWidget(),
                  Text(
                    heading3,
                    style: TextStyle(
                      color: ColorConstant.clFontGreyColor,
                      fontWeight: FontWeight.bold,
                      fontSize: DeviceSize.itemHeight / 15,
                    ),
                  ),
                  SizedBox(
                    height: DeviceSize.itemHeight / 20,
                  ),
                  Text(
                    value3[index],
                    style: TextStyle(
                        color: ColorConstant.black900,
                        fontWeight: FontWeight.bold,
                        fontSize: DeviceSize.itemHeight / 15),
                  ),
                  const D10HCustomClSizedBoxWidget(
                    height: 10,
                  ),
                ],
              );
            }),
            separatorBuilder: (BuildContext context, int index) {
              return const Divider();
            },
          ),
        ),
      ),
      SizedBox(
        height: DeviceSize.itemHeight / 20,
      ),
    ]);

    /*
    SizedBox(
      height:  DeviceSize.itemHeight / 1.8,
      child: ListView.builder(
        itemCount: text2.length,
        shrinkWrap: true,
        itemBuilder: ( (context, index) {
        return Column(
        children: [
          Container(
            // height: DeviceSize.itemHeight / 2,
            height: containerHeight,
    
            width: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ColorConstant.clPurple05,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$text1 $index",
                    style: TextStyle(
                      color: ColorConstant.clFontGreyColor,
                      fontWeight: FontWeight.bold,
                      fontSize: DeviceSize.itemHeight / 15,
                    ),
                  ),
                  SizedBox(
                    height: DeviceSize.itemHeight / 20,
                  ),
                  Text(
                    text2[index],
                    style: TextStyle(
                        color: ColorConstant.black900,
                        fontWeight: FontWeight.bold,
                        fontSize: DeviceSize.itemHeight / 15),
                  ),
                ],
              ),
            ),
          ),
          // SizedBox(
          //   height: DeviceSize.itemHeight / 20,
          // ),
        ],
      );
        
      })),
    );
    */
  }
}

class BlurTextContainerTwoLineWidgetCustomCl extends StatelessWidget {
  const BlurTextContainerTwoLineWidgetCustomCl({
    super.key,
    required this.text1,
    required this.text2,
    required this.containerHeight,
  });

  final String text1;
  final String text2;
  final double containerHeight;

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
            color: ColorConstant.clPurple05,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Text(
                    text1,
                    style: TextStyle(
                      color: ColorConstant.clFontGreyColor,
                      fontWeight: FontWeight.bold,
                      fontSize: DeviceSize.itemHeight / 15,
                    ),
                  ),
                ),
                SizedBox(
                  height: DeviceSize.itemHeight / 20,
                ),
                ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Text(
                    text2,
                    style: TextStyle(
                      color: ColorConstant.clFontGreyColor,
                      fontWeight: FontWeight.bold,
                      fontSize: DeviceSize.itemHeight / 15,
                    ),
                  ),
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
    required this.text1,
    required this.text2,
    required this.containerHeight,
    required this.text3,
    required this.text4,
    required this.text5,
    required this.text6,
  });

  final String text1;
  final String text2;
  final double containerHeight;
  final String text3;
  final String text4;
  final String text5;
  final String text6;

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
            color: ColorConstant.clPurple05,
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
                  height: DeviceSize.itemHeight / 30,
                ),
                Text(
                  text2,
                  style: TextStyle(
                      color: ColorConstant.black900,
                      fontWeight: FontWeight.bold,
                      fontSize: DeviceSize.itemHeight / 15),
                ),
                SizedBox(
                  height: DeviceSize.itemHeight / 10,
                ),
                Text(
                  text3,
                  style: TextStyle(
                      color: ColorConstant.clFontGreyColor,
                      fontWeight: FontWeight.bold,
                      fontSize: DeviceSize.itemHeight / 15),
                ),
                SizedBox(
                  height: DeviceSize.itemHeight / 30,
                ),
                Text(
                  text4,
                  style: TextStyle(
                      color: ColorConstant.black900,
                      fontWeight: FontWeight.bold,
                      fontSize: DeviceSize.itemHeight / 15),
                ),
                SizedBox(
                  height: DeviceSize.itemHeight / 10,
                ),
                Text(
                  text5,
                  style: TextStyle(
                      color: ColorConstant.clFontGreyColor,
                      fontWeight: FontWeight.bold,
                      fontSize: DeviceSize.itemHeight / 15),
                ),
                SizedBox(
                  height: DeviceSize.itemHeight / 30,
                ),
                Text(
                  text6,
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
      tagContainerPadding:
          const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      tagTextStyle: TextStyle(
        color: Colors.black54,
        letterSpacing: 0.7,
        fontSize: DeviceSize.itemHeight / 12,
        fontWeight: FontWeight.bold,
      ),
      tagContainerDecoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade100),
        borderRadius: const BorderRadius.all(
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
      tagContainerPadding:
          const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      tagTextStyle: TextStyle(
        color: Colors.black54,
        letterSpacing: 0.7,
        fontSize: DeviceSize.itemHeight / 13,
        fontWeight: FontWeight.bold,
      ),
      tagContainerDecoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade100),
        borderRadius: const BorderRadius.all(
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
    return const Scaffold();
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
      dashPattern: const [6, 6],
      radius: const Radius.circular(20),
      child: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),

        // height: 300,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
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
            const SizedBox(
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
            const SizedBox(
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
        const D10HCustomClSizedBoxWidget(
          height: 20,
        ),
      ],
    );
  }
}

class ClListviewBuilderTableWidget extends StatelessWidget {
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
          shrinkWrap: true,
          physics: const PageScrollPhysics(),
          itemCount: officeDetailsQus.length,
          itemBuilder: (context, Index) {
            return ListTile(
              horizontalTitleGap: DeviceSize.itemWidth / 3.11,
              leading: SizedBox(
                // width: MediaQuery.of(context).size.width/3,
                width: size.width / 4,
                child: Text(
                  officeDetailsQus[Index],
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      color: ColorConstant.blueGray900,
                      fontSize: DeviceSize.itemWidth / 13.411),
                ),
              ),
              title: Text(
                officeDetailsAns[Index],
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    color: ColorConstant.indigo900,
                    fontSize: DeviceSize.itemWidth / 13.411),
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
        const D10HCustomClSizedBoxWidget(
          height: 20,
        ),
      ],
    );
  }
}

class TwoTextLineAndUnderlineWidgetCl extends StatefulWidget {
  const TwoTextLineAndUnderlineWidgetCl(
      {super.key,
      required this.title,
      required this.cInivalue,
      required this.buttonclicked,
      required this.sharedPreffId,
      this.onChanged});

  final String title;
  final String cInivalue;
  final bool buttonclicked;
  final String sharedPreffId;

  final onChanged;

  //  OnChanged onChanged;

  @override
  State<TwoTextLineAndUnderlineWidgetCl> createState() =>
      _TwoTextLineAndUnderlineWidgetClState();
}

class _TwoTextLineAndUnderlineWidgetClState
    extends State<TwoTextLineAndUnderlineWidgetCl> {
  saveToSharedPrefferences(String nameOfID, String valueToSave) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setString(nameOfID, valueToSave);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(
            fontSize: 11,
          ),
        ),
        const SizedBox(
          height: 3,
        ),
        // widget.buttonclicked
        //     ?
        Container(
          height: 40,
          decoration: BoxDecoration(
              color: widget.buttonclicked
                  ? Colors.grey.shade100
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: TextFormField(
              // key: Key(widget.cInivalue),
              initialValue: widget.cInivalue,
              style: const TextStyle(
                fontSize: 15,
              ),
              onChanged: widget.onChanged,

              // onChanged: (newValue) {
              //   saveToSharedPrefferences(widget.sharedPreffId, newValue);
              //   print("saveToSharedPrefferences $newValue");
              // },
              decoration: InputDecoration(
                  isDense: true,
                  border: InputBorder.none,
                  contentPadding: widget.buttonclicked
                      ? const EdgeInsets.only(bottom: -20, top: 10)
                      : const EdgeInsets.only(
                          left: -20,
                          bottom: -20,
                        )

                  // contentPadding: EdgeInsets.only(left: -20, bottom: -20, top: 10),
                  ),
            ),
          ),
        ),
        // :
        // Text(
        //     widget.value,
        //     style: const TextStyle(
        //         fontWeight: FontWeight.bold,
        //         fontSize: 15,
        //         color: Colors.black),
        //   ),
        const D10HCustomClSizedBoxWidget(
          height: 50,
        ),
        widget.buttonclicked ? const SizedBox() : const Divider(),
        const D10HCustomClSizedBoxWidget(
          height: 50,
        ),
      ],
    );
  }
}
