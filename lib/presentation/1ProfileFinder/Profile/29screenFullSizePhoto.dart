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

class FullSizePhotoTwentyNineScreen extends StatefulWidget {
  const FullSizePhotoTwentyNineScreen({super.key});

  @override
  State<FullSizePhotoTwentyNineScreen> createState() =>
      _FullSizePhotoTwentyNineScreenState();
}

class _FullSizePhotoTwentyNineScreenState
    extends State<FullSizePhotoTwentyNineScreen> {
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
                  context, AppRoutes.FamilyGroupThirtyScreenscr);
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
                      "Full Size Photo",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    _users.fullSizeImage == "null"
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              ImageConstant.img_full_size_photo,
                              fit: BoxFit.cover,
                              width: double.maxFinite,
                              height: 550,
                            ),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              _users.fullSizeImage.toString(),
                              height: 550,
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
                Navigator.pushNamed(
                    context, AppRoutes.FamilyGroupThirtyScreenscr);
              },
              child: const Text(
                "Edit & Update",
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





  // static String img_full_size_photo = 'assets/images/img_full_size_photo.png';
