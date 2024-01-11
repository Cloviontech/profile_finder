import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:profile_finder/core/utils/color_constant.dart';
import 'package:profile_finder/core/utils/image_constant.dart';
import 'package:profile_finder/model_final/model_final.dart';
import 'package:profile_finder/presentation/1ProfileFinder/MatchingList/1screen_advertisement.dart';
import 'package:profile_finder/routes/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

class HeadSizeTwentyEightScreen extends StatefulWidget {
  const HeadSizeTwentyEightScreen({super.key});

  @override
  State<HeadSizeTwentyEightScreen> createState() =>
      _HeadSizeTwentyEightScreenState();
}

class _HeadSizeTwentyEightScreenState extends State<HeadSizeTwentyEightScreen> {
//  late String imageAddress;

  Users _users = Users();
  bool isLoading = true;

  late final String userUid;

  void getData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    userUid = preferences.getString("uid2").toString();

    final response = await http
        .get(Uri.parse("http://${ApiService.ipAddress}/alldata/$userUid"));
    var json = jsonDecode(response.body);

    print("statusCodeIs${response.statusCode}");

    if (response.statusCode == 200) {
      _users = Users.fromJson(json);
      print(response.body);
      // await Future.delayed(const Duration(seconds: 1), () {});

      setState(() {
        isLoading = false;
      });
    } else {
      print("error");
      print(response.statusCode);
    }
  }


// bool _editbuttonClicked = false;

  @override
  initState() {
    getData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteA700,
      appBar: AppBar(
        backgroundColor: ColorConstant.whiteA700,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: ColorConstant.black900,
              size: 16,
            )),
        actions: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(
                  context, AppRoutes.FullSizePhotoTwentyNineScreenscr);
            },
            child: Row(
              children: [
                SvgPicture.asset('assets/images/img_heartline.svg'),
                SvgPicture.asset('assets/images/img_notification.svg'),
                SizedBox(
                  width: 20,
                )
              ],
            ),
          )
        ],
        elevation: 0,
      ),
      body: isLoading == true
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10 + 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Head Size(Selfieeeeee)",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    // _editbuttonClicked ?
                    // center(child: Text("Test"))

                    // Container(
                    //             width: double.maxFinite,
                    //             child: DottedBorder(
                    //                 // borderPadding: EdgeInsets.all(10),
                    //                 borderType: BorderType.RRect,
                    //                 strokeWidth: 1,
                    //                 color: Colors.grey,
                    //                 radius: const Radius.circular(10),
                    //                 dashPattern: const [3, 5],
                    //                 // strokeCap: StrokeCap.butt,
                    //                 child: Center(
                    //                   child: Column(
                    //                     mainAxisAlignment: MainAxisAlignment.center,
                    //                     crossAxisAlignment: CrossAxisAlignment.center,
                    //                     children: [
                    //                       Padding(
                    //                         padding: const EdgeInsets.only(
                    //                             left: 80, right: 80, top: 0, bottom: 0),
                    //                         child: Container(
                    //                           height: 130,
                    //                           child: Column(
                    //                             mainAxisAlignment:
                    //                                 MainAxisAlignment.center,
                    //                             children: [
                    //                               GestureDetector(
                    //                                 onTap: () {
                    //                                   pickSingleFileHeadSize();

                    //                                   // pickFile();
                    //                                 },
                    //                                 child: Container(
                    //                                   height: 65,
                    //                                   width: 65,
                    //                                   decoration: BoxDecoration(
                    //                                       color: Colors.indigo.shade50,
                    //                                       borderRadius:
                    //                                           BorderRadius.circular(8)),
                    //                                   child: headsizePath == "abc"
                    //                                       ? Padding(
                    //                                           padding:
                    //                                               const EdgeInsets.all(
                    //                                                   15.0),
                    //                                           child: SvgPicture.asset(
                    //                                             "assets/images/Frame.svg",
                    //                                           ),
                    //                                         )
                    //                                       : ClipRRect(
                    //                                           borderRadius:
                    //                                               BorderRadius.circular(
                    //                                                   8),
                    //                                           child: Image.file(
                    //                                             headsizeFile!,
                    //                                             fit: BoxFit.cover,
                    //                                             width: 80,
                    //                                             height: 80,
                    //                                           )),
                    //                                 ),
                    //                               ),
                    //                               const SizedBox(
                    //                                 height: 10,
                    //                               ),
                    //                               const Text(
                    //                                   "Click and capture your Selfie"),
                    //                             ],
                    //                           ),
                    //                         ),
                    //                       ),
                    //                     ],
                    //                   ),
                    //                 )),
                    //           )

                    // :

                    _users.selfie == "null"
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              ImageConstant.imgMaskgroup368x342,
                              height: 400,
                              width: double.maxFinite,
                              fit: BoxFit.cover,
                            ),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              _users.selfie.toString(),
                              height: 400,
                              width: double.maxFinite,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ]),
            ),
      bottomSheet: Padding(
        padding:
            const EdgeInsets.only(top: 15, bottom: 30, left: 25, right: 25),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () {
                // setState(){
                //   _editbuttonClicked= true;
                // }

                //  Navigator.pushNamed(context, AppRoutes.FullSizePhotoTwentyNineScreenscr);
              },
              child: const Text(
                "Edit & UpdateeS",
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: ColorConstant.deepPurpleA200,
                  minimumSize: const Size(380, 50),
                  elevation: 0,
                  side: const BorderSide(width: 1, color: Colors.blue),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
            ),
          ],
        ),
      ),
    );
  }
}
