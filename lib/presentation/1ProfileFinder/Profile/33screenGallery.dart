// static String img_full_size_photo = 'assets/images/img_full_size_photo.png';

// this page is a widget

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:profile_finder/core/utils/color_constant.dart';
import 'package:profile_finder/model_final/model_final.dart';
import 'package:profile_finder/presentation/1ProfileFinder/MatchingList/1screen_advertisement.dart';
import 'package:profile_finder/presentation/1ProfileFinder/PrivateInvestigator/AllInvestigatorThirtyEightScreen.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/ClCustomWidgets2.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class GalleryThirtyThreeScreen extends StatefulWidget {
  const GalleryThirtyThreeScreen({super.key});

  @override
  State<GalleryThirtyThreeScreen> createState() =>
      _GalleryThirtyThreeScreenState();
}

class _GalleryThirtyThreeScreenState extends State<GalleryThirtyThreeScreen> {
  // String userUid = FirebaseAuth.instance.currentUser!.uid;

  Users _users = Users();
  bool isLoading = true;
//  late List <String> datafromapiGallery;

  late String imagesForGallery;

  List<String>? removeComma;
//  late String data;

  late final String userUid;

  void getData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    userUid = preferences.getString("uid2").toString();

    final response = await http
        .get(Uri.parse("http://${ApiService.ipAddress}/alldata/$userUid"));
    var json = jsonDecode(response.body);

    Map<String, dynamic> des = jsonDecode(response.body);
    // List<dynamic> data = des["gallery"];

    // String data = json["gallery"[2]].toString();

    String out = des["gallery"].replaceAll("[", "");
    String out1 = out.replaceAll("]", "");
    String out2 = out1.replaceAll(' ', "");

    removeComma = out2.split(",");

// print("one"+substrings.toString()); // Output: [This is a, sample text]
// print("two"+substrings[0]); // Output: [This is a]
// print("three"+substrings[1]);

    print("gallery" + out1);

    print("statusCodeIs${response.statusCode}");

    if (response.statusCode == 200) {
      _users = Users.fromJson(json);
      print(response.body);
      //  data = _users.gallery.toString();

      // await Future.delayed(const Duration(seconds: 1), () {});

      setState(() {
        isLoading = false;
        // _datafromapi = _users.gallery.toString();
        //  datafromapiGallery = out1.split(",");

        //  imagesForGallery =
        //   removeComma[1].substring(2, removeComma[1].length - 1);
      });
    } else {
      print("error");
      print(response.statusCode);
    }
  }

  // splitdata() {
  //   final tagName = _users.gallery.toString();
  //   final split = tagName.split(',');
  //   final Map<int, String> values = {
  //     for (int i = 0; i < split.length; i++) i: split[i]
  //   };
  //   print(values); // {0: grubs, 1:  sheep}

  //   final value1 = values[0];
  //   final value2 = values[1];
  //   final value3 = values[2];
  // }

  @override
  initState() {
    getData();
    // splitdata();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    // final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    // final double itemWidth = size.width / 2;

    final double itemHeight = size.height;
    final double itemWidth = size.width;

    // final double dheight = DeviceSize.DeviceHeight;
    // final double dWidth = DeviceSize.DeviceWidth;

    return Scaffold(
      backgroundColor: ColorConstant.whiteA700,
      appBar: ClAppbarLeadArrowBackSuffHeart(
        // -----Navigate to -----------
        //----Private Investigator Page for Testing in Client Meeting-------
        testingNextPage: AllInvestigatorThirtyEightScreen(),
        //
      ),
      body: isLoading
          ? CircularProgressIndicator()
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Gallery",
                      style: TextStyle(fontSize: 35),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    // Text(itemHeight.toString(), style: TextStyle(fontSize: 35),),
                    // SizedBox(height: 20,),
                    //  Text(itemWidth.toString(), style: TextStyle(fontSize: 35),),
                    // SizedBox(height: 20,),

                    // Text(dheight.toString(), style: TextStyle(fontSize: 35),),
                    // SizedBox(height: 20,),
                    //  Text(dWidth.toString(), style: TextStyle(fontSize: 35),),
                    // SizedBox(height: 20,),

                    Container(
                      child: GridView.builder(
                          shrinkWrap: true,
                          itemCount: removeComma!.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  // childAspectRatio: (itemWidth / itemHeight),
                                  childAspectRatio: 1.2),
                          itemBuilder: (BuildContext context, int index) {
                            String url = removeComma![index]
                                .substring(1, removeComma![index].length - 1);

                            // productImage[index];
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                url.toString(),
                                // height: 50,
                                fit: BoxFit.cover,
                              ),
                            );
                          }),
                    ),
                  ],
                ),
                //  ListView.builder(
                //    shrinkWrap: true,
                //    itemCount: removeComma!.length,
                //    scrollDirection: Axis.vertical,
                //    itemBuilder: (context, index) {
                //      return Image.network(
                //          // dataFromAPI!.products[index].thumbnail,
                //          removeComma![index]
                //              .substring(1, removeComma![index].length - 1),

                //          width: 50,
                //          height: 100,
                //        );

                //    },
                //  ),

                //  ['http://54.159.186.219:8000/media/Q6WIMQ3RY5H/images/gallery/scaled_1000000038_vALSD2V.png',
                //  'http://54.159.186.219:8000/media/Q6WIMQ3RY5H/images/gallery/scaled_1000000039_MCPDpZa.png',
                //  'http://54.159.186.219:8000/media/Q6WIMQ3RY5H/images/gallery/scaled_1000000042_ELwFSJL.png',
                //   'http://54.159.186.219:8000/media/Q6WIMQ3RY5H/images/gallery/scaled_1000000044_6ZJCGDl.png']

                // Column(
                //   // crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Text(
                //       // removeComma![1].substring(2, removeComma![1].length - 1),
                //       removeComma![0]+
                //       removeComma![1]+
                //       removeComma![2]+
                //       removeComma![3],

                //       style:
                //           TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                //     ),
                //     SizedBox(
                //       height: 20,
                //     ),
                //     // Text(_users.gallery![2].toString()),
                //     // Text(datafromapi!.split(',').toString())

                //     Image.network(
                //       // dataFromAPI!.products[index].thumbnail,
                //       removeComma![1].substring(2, removeComma![1].length - 1),

                //       width: 100,
                //     ),

                //     //     isLoading ? const Center(
                //     //     child: CircularProgressIndicator(),
                //     //   )
                //     // :

                //     Expanded(

                //       child: ListView.builder(
                //         itemCount: removeComma!.length,
                //         scrollDirection: Axis.vertical,
                //         itemBuilder: (context, index) {
                //           return Container(
                //             child: Image.network(
                //               // dataFromAPI!.products[index].thumbnail,
                //               removeComma![index]
                //                   .substring(2, removeComma![index].length - 1),

                //               // width: 100,
                //             ),
                //           );
                //         },
                //       ),
                //     ),

                //     // StreamBuilder(
                //     //     stream:
                //     //     FirebaseFirestore.instance
                //     //         .collection("ProfileInfo")
                //     //         .doc(userUid)
                //     //         .collection("Gallery")
                //     //         .snapshots(),
                //     //     builder: (BuildContext context,
                //     //         AsyncSnapshot<QuerySnapshot> snapshot) {
                //     //       if (!snapshot.hasData) {
                //     //         return (Center(
                //     //           child: Text("No image uploaded"),
                //     //         ));
                //     //       } else {
                //     //         return

                //     //   }
                //     // }),
                //   ],
                // ),
              ),
            ),
      bottomNavigationBar: const BottomSingleButtomWidgetCustomCl(
        title1: 'Edit & Update',
      ),
    );
  }
}
