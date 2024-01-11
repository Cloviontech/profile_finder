import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:http/http.dart' as http;
import 'package:profile_finder/core/utils/color_constant.dart';
import 'package:profile_finder/model_final/model_final.dart';
import 'package:profile_finder/presentation/1ProfileFinder/MatchingList/1screen_advertisement.dart';
import 'package:profile_finder/presentation/1ProfileFinder/Registeration/3ScreenSignin.dart';
import 'package:profile_finder/routes/app_routes.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:shared_preferences/shared_preferences.dart';

//  class deviceSize {
//   int deviceheight = MediaQuery.of(context).size.height,
//     int deviceheight = MediaQuery.of(context).size.width,

//   //  String? hai;
//   //  int deviceHeight = MediaQuery.of(context).size.height,

//   }

class FourteenProfileCompleteness extends StatefulWidget {
  const FourteenProfileCompleteness({Key? key}) : super(key: key);

  @override
  State<FourteenProfileCompleteness> createState() =>
      _FourteenProfileCompletenessState();
}

class _FourteenProfileCompletenessState
    extends State<FourteenProfileCompleteness> {
  // dynamic value = false;
  bool value = true;

  List<String> profileItems = [
    "About Me",
    "Current Status",
    "Contact Details",
    "Other Details",
    "General Details",
    "Family Details",
    "Sibling's Details",
    "Educations",
    "Work Experience",
    "My Interest",
    "My Non-Interest",
    "Complexion",
    "Food Taste",
    "Head Size(Selfie)",
    "Full Size Photo",
    "Family Group Photo",
    "Gallery"
  ];

  List AppRoutesList = [
    AppRoutes.FifteenAboutMescr,
    AppRoutes.SixteenCurrentStatusscr,
    AppRoutes.SeventeenContactDetailsscr,
    AppRoutes.EighteenOtherDetailsscr,
    AppRoutes.NineteenGeneralDetailsscr,
    AppRoutes.TwentyFamilyDetailsscr,
    AppRoutes.TwentyOneSiblingsDetailsscr,
    AppRoutes.TwentyTwoEducationscr,
    AppRoutes.TwentyThreeWorkExperiencescr,
    AppRoutes.TwentyFourMyInterestscr,
    AppRoutes.TwentyFiveMyNonInterestscr,
    AppRoutes.ComplexionTwentySixScreenscr,
    AppRoutes.FoodTasteTwentySevenScreenscr,
    AppRoutes.HeadSizeTwentyEightScreenscr,
    AppRoutes.FullSizePhotoTwentyNineScreenscr,
    AppRoutes.FamilyGroupThirtyScreenscr,
    AppRoutes.GalleryThirtyThreeScreenscr,
    AppRoutes.GalleryThirtyThreeScreenscr,
    AppRoutes.GalleryThirtyThreeScreenscr,
  ];

  // 16

// List<dynamic, String> profilePages = [
//    fifteenAboutMescr : AppRoutes.FifteenAboutMescr;
// ];

  Users _users = Users();
  bool isLoading = true;

  late String userUid;
  late String nameOfBrideGroom;

  void getData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    userUid = preferences.getString("uid2").toString();
    setState(() {
      nameOfBrideGroom = preferences.getString("nameOfBrideGroom").toString();
    });
    final response = await http
        .get(Uri.parse("http://${ApiService.ipAddress}/alldata/${userUid}"));
    var json = jsonDecode(response.body);

    print("statusCodeIs${response.statusCode}");

    if (response.statusCode == 200) {
      _users = Users.fromJson(json);
      print(response.body);
      setState(() {
        isLoading = false;
      });

      debugPrint(_users.profilePicture);
    }
    
     else {
      print("error");
      print(response.statusCode);
    }

    // _users= Users.fromJson(json);
    // setState(() {
    //   isLoading= false;
    // });
  }

  @override
  void initState() {
    // TODO: implement initState
    // getData();
    getData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return

        // isLoading == true ? Scaffold(body: Center(child: CircularProgressIndicator())) :
        Scaffold(
      body: isLoading
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  D10HCustomClSizedBoxWidget(),
                  Text("Connecting... Please Wait...!"),
                ],
              ),
            )
          : SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // spacing: 10,
                      // alignment: WrapAlignment.spaceBetween,
                      // runAlignment: WrapAlignment.spaceBetween,
                      // crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        const Text(
                          "Profile Completeness",
                          style: TextStyle(fontSize: 12),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          height: 10,
                          width: 170,
                          child: ClipRRect(
                            
                            borderRadius: BorderRadius.circular(8),
                            child: LinearProgressIndicator(
                              valueColor:
                                  const AlwaysStoppedAnimation(Colors.green),
                              backgroundColor: Colors.grey.shade400,
                              value: 0.75,
                            ),
                          ),
                        ),
                        const Text("80%")
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        // color: Colors.red,
                        height: 150,
                        decoration: BoxDecoration(
                            color: ColorConstant.clContainerFillGreyColor,
                            borderRadius: BorderRadius.circular(8)),
                        // color: Colors.red,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 100,
                                    decoration: const BoxDecoration(
                                        // borderRadius: BorderRadius.circular(10),
                                        shape: BoxShape.circle),
                                    child: _users.selfie!.isEmpty
                                        ? const Image(
                                            image: AssetImage(
                                                'assets/images/img_maskgroup.png'))
                                        : SizedBox(
                                            // height: 100,
                                            width: 100,
                                            child: CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                  _users.profilePicture.toString()),
                                            ),
                                          ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 30),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: ColorConstant
                                              .clContainerFillGreyColor,
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      height: 100,
                                      width: double.maxFinite,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                           
                                             const Text(
                                              "ID12345",
                                              style: TextStyle(fontSize: 8),
                                            ),
                                             
                                            Text(
                                              // "Thomas Miller",
                                              _users.name ?? "Update Name",
                                              // nameOfBrideGroom,
                                              style: const TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                                // "Emirati",
                                                _users.email ?? "Second Name",
                                                style: const TextStyle(
                                                  fontSize: 13,
                                                )),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.blue),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      color:
                                                          Colors.grey.shade300,
                                                    ),
                                                    width: 30,
                                                    height: 30,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5),
                                                      child: SvgPicture.asset(
                                                          'assets/images/img_facebook_deep_purple_a200.svg'),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.blue),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      color:
                                                          Colors.grey.shade300,
                                                    ),
                                                    width: 30,
                                                    height: 30,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5),
                                                      child: SvgPicture.asset(
                                                          'assets/images/img_frame_deep_purple_a200.svg'),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.blue),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      color:
                                                          Colors.grey.shade300,
                                                    ),
                                                    width: 30,
                                                    height: 30,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5),
                                                      child: SvgPicture.asset(
                                                          'assets/images/img_frame_deep_purple_a200_14x14.svg'),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.blue),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      color:
                                                          Colors.grey.shade300,
                                                    ),
                                                    width: 30,
                                                    height: 30,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5),
                                                      child: SvgPicture.asset(
                                                          'assets/images/img_frame_14x14.svg'),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.blue),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      color:
                                                          Colors.grey.shade300,
                                                    ),
                                                    width: 30,
                                                    height: 30,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5),
                                                      child: SvgPicture.asset(
                                                          'assets/images/img_clock.svg'),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    //  MyElevatedButton(
                    //                 onPressed: () {},
                    //                 child: Text("Hire Investigator"),
                    //                 borderRadius: BorderRadius.circular(10),
                    //                 backgroundColor: Colors.transparent,
                    //               ),
                    // MyElevatedButton(onPressed: (){}, child: Text('data')),
                    // MyElevatedButtonWithBorderColorAdj(onPressed: (){}, child: Text('data')),
                    Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, AppRoutes.ThirteenScreenscr);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(185, 8, 42, 236),
                            minimumSize: const Size(300, 40),
                            elevation: 0,
                            side: const BorderSide(
                                width: 1,
                                color: Color.fromARGB(255, 102, 7, 226)),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/images/img_sharefill.svg'),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Share Profile",
                                  style: TextStyle(
                                    color: Colors.white,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),

                    MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: profileItems.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: ListTile(
                                  // minVerticalPadding: 10,
                                  visualDensity: const VisualDensity(
                                    vertical: -4,
                                  ),
                                  // contentPadding: EdgeInsets.only(top: 1),
                                  // minVerticalPadding: 0,
                                  tileColor: Colors.blue.shade100,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  onTap: () {
                                    // setState(() {
                                    //   this.value = !value;
                                    // });
                                    Navigator.pushNamed(
                                        context, AppRoutesList[index]);
                                  },
                                  leading: Checkbox(
                                      // splashRadius: 20,
                                      // fillColor: MaterialStatePropertyAll(Colors.green),
                                      activeColor: Colors.green,
                                      // overlayColor: MaterialStatePropertyAll(Colors.green),

                                      shape: const CircleBorder(),
                                      side: BorderSide.none,
                                      value: value,
                                      onChanged: (value) {
                                        setState(() {
                                          this.value = value!;
                                        });
                                      }),
                                  // title: Text("About Me1"),
                                  title: Text(profileItems[index]),
                                  // trailing: SvgPicture.asset(
                                  //     'assets/images/img_arrowright_black_900.svg'),
                                  trailing: const Icon(
                                    Icons.keyboard_arrow_right,
                                    weight: 50,
                                    size: 25,
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),

                    const SizedBox(
                      height: 8,
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
