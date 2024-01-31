import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:profile_finder/core/utils/color_constant.dart';
import 'package:profile_finder/core/utils/size_utils.dart';
import 'package:profile_finder/model_final/modelAllUser.dart';
import 'package:profile_finder/presentation/1ProfileFinder/MatchingList/AddRefferenceFiftyThreeScreen.dart';
import 'package:profile_finder/presentation/1ProfileFinder/Registeration/3ScreenSignin.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../../../data_import/all_male_user_data.dart';
import '../../../../model_final/blockedProfByMe1.dart';
import '../../../../model_final/blocked_users_by_me.dart';
import '../../../../model_final/model_all_male_4.dart';
import '../../../../model_final/model_all_male_7.dart';
import '../1screen_advertisement.dart';
import '../Id123456FiftyScreen.dart';

class ApiService1 {
  static const String ipAddress1 = "10.0.2.2:8000";

  // http://10.0.2.2:8000/signup/
  // static const String ipAddress = "localhost:8000/";

  // static const String ipAddress = "192.168.1.2:8000";

  late String userUid;
  Future<List<UserModel>?> getUsers1() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    userUid = preferences.getString("uid2").toString();
    debugPrint('entering getUsers function1');
    try {
      // var url = Uri.parse("http://$ipAddress/alluserdata");
      var url = Uri.parse("http://10.0.2.2:8000/all_male_user_data/$userUid");
      //  var url = Uri.parse("http://127.0.0.1:3000/alluserdata");

      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<UserModel> model = userModelFromJson(response.body);
        return model;
      }

      debugPrint('error code');
      print(response.statusCode);
    } catch (e) {
      // log(e.toString());
      print("error $e");
    }
    return null;
  }
}

// class ApiService2 {
//   static const String ipAddress1 = "10.0.2.2:8000";

//   // http://10.0.2.2:8000/signup/
//   // static const String ipAddress = "localhost:8000/";

//   // static const String ipAddress = "192.168.1.2:8000";

//   late String userUid;
//   Future<List<UserModel>> getUsers2() async {
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//     userUid = preferences.getString("uid2").toString();
//     debugPrint('entering getUsers function1');
//     try {
//       // var url = Uri.parse("http://$ipAddress/alluserdata");
//        var url = Uri.parse("http://10.0.2.2:8000/all_male_user_data/$userUid");
//       //  var url = Uri.parse("http://127.0.0.1:3000/alluserdata");

//       var response = await http.get(url);
//       if (response.statusCode == 200) {
//         List<UserModel> model = userModelFromJson(response.body);
//         return model;
//       }

//       debugPrint('error code');
//       print(response.statusCode);
//     } catch (e) {
//       // log(e.toString());
//       print("error $e");
//     }
//     return null;
//   }
// }

class EveryMaleFourtyNineScreen extends StatefulWidget {
  EveryMaleFourtyNineScreen({super.key});

  static BlockedProfilesByMe1 blockedUsersByMe =
      BlockedProfilesByMe1(myProf: []);

  @override
  State<EveryMaleFourtyNineScreen> createState() =>
      _EveryMaleFourtyNineScreenState();
}

class _EveryMaleFourtyNineScreenState extends State<EveryMaleFourtyNineScreen> {
  AllMaletest1 _allMaletest1 = AllMaletest1();

  bool isLoading = true;

  _getblockedProfilesByMe() async {
    debugPrint('getblockedProfilesByMe start');

    try {
      final responseMatList = await http.get(Uri.parse(
          "http://${ApiService.ipAddress}/block/${ThreeSigninScreen.userUidAccess}"));
      var kson = jsonDecode(responseMatList.body);

      print("statusCodeIs${responseMatList.statusCode}");

      if (responseMatList.statusCode == 200) {
        print(responseMatList.body);

        setState(() {
          isLoading = false;
          EveryMaleFourtyNineScreen.blockedUsersByMe =
              BlockedProfilesByMe1.fromJson(
                  kson, ThreeSigninScreen.userUidAccess);
        });
      } else {
        print("error");
        print(responseMatList.statusCode);
      }
    } catch (e) {
      debugPrint(e.toString());
    }

    debugPrint('getblockedProfilesByMe end');
  }


   late String profile_finder_id;

  getDataMatList() async {
    debugPrint('_getDataMatList start');
     SharedPreferences preferences = await SharedPreferences.getInstance();
      profile_finder_id = preferences.getString("uid2").toString();


    final response = await http.get(Uri.parse(
        "http://${ApiService.ipAddress}/all_male_user_data/$profile_finder_id"));
    var json = jsonDecode(response.body);

    print("statusCodeIs${response.statusCode}");
    debugPrint('wa1');

    if (response.statusCode == 200) {
      isLoading = false;
      try {
        setState(() {
          _allMaletest1 =
              AllMaletest1.fromJson(json, ThreeSigninScreen.userUidAccess);
          //  _allMaletest1 =  allMaletest1FromJson(json);
        });
      } catch (e) {
        debugPrint('try1' + e.toString());
      }

      debugPrint('wa');

      try {
        //  debugPrint(json);

        // debugPrint(_allMaletest1.curUsers![0].id.toString());
      } catch (e) {
        debugPrint('try2' + e.toString());
      }
    } else {
      print("error");
      print(response.statusCode);
    }

    debugPrint('_getDataMatList end');
  }

  TextEditingController _searchController = TextEditingController();
  List<String> savedSearches = [];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  late List<UserModel>? _userModel = [];

  void _getData() async {
    debugPrint('getdata start');
    try {
      _userModel = (await ApiService().getUsers())!;
      Future.delayed(const Duration(seconds: 1))
          .then((value) => setState(() {}));
      debugPrint('usermodel test');

      debugPrint(_userModel.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
    debugPrint('getdata end');
  }

  //

//   List<String> allUserUids1 = [];

//   List<String> allUserUidsa() {
//     debugPrint('All user id s');

//     for (var _i = 0; _i < _allMaletest1.curUsers!.length; _i++) {
//       allUserUids1.add(_allMaletest1.curUsers![_i].uid);
// // allUserUids1=_userModel![i].uid
//       debugPrint(allUserUids1[_i]);
//     }

//     debugPrint(allUserUids1.length.toString());

//     return allUserUids1;
//   }

  // Future<void> addsavedSearch(String data) async {
  //   try {
  //     // Replace the URL with your API endpoint
  //     String apiUrl =
  //         "http://${ApiService.ipAddress}/saved_search/${ThreeSigninScreen.userUidAccess}"; // Example API endpoint

  //     Map<String, dynamic> requestBody = {
  //       // 'data': data,
  //       'add new': {
  //         'tag': ['tag'],
  //         'country': ['country'],
  //         'city': ['city'],
  //         'age': ['age'],
  //         'complexion': ('complexion'),
  //         'gender': ['gender'],
  //         'denomination': ['denomination']
  //       }
  //       // Add other fields as needed for your API request
  //     };

  //     final response = await http.post(
  //       Uri.parse(apiUrl),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //         // Add any other headers if required by your API
  //       },
  //       body: jsonEncode(requestBody),
  //     );

  //     if (response.statusCode == 200) {
  //       // Successful API call
  //       print('Data sent successfully');
  //       print('Response: ${response.body}');
  //     } else {
  //       // Handle error when API call fails
  //       print('Failed to send data. Error: ${response.reasonPhrase}');
  //     }
  //   } catch (error) {
  //     // An error occurred during the request, handle it here
  //     print('Error sending data: $error');
  //   }
  // }

  List<String> suggestions = [
    'Apple',
    'Banana',
    'Orange',
    'Pineapple',
    'Grapes',
    'Mango',
    'Strawberry',
  ];

  List<String> filteredSuggestions = [];

  void _onSearchTextChanged(String value) {
    setState(() {
      filteredSuggestions = suggestions
          .where((suggestion) =>
              suggestion.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  void _chooseSuggestion(String suggestion) {
    setState(() {
      _searchController.text = suggestion;
      filteredSuggestions.clear(); // Clear the suggestions after choosing one
    });
  }

  static const List<String> listUsers = ["apple", "banana", "melon"];

  @override
  void initState() {
    //  _getData();
    //  allUserUidsa();
    getDataMatList();
    _getblockedProfilesByMe();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? CircularProgressIndicator(
              semanticsLabel: 'Loading Matching List',
            )
          : SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 10, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // CustomClSizedBoxD10Widget(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: DeviceSize.itemWidth * 1.5,
                          height: 50,
                          child:
                              // Autocomplete<String>
                              // (optionsBuilder: (TextEditingValue textEditingValue) {
                              //   if (textEditingValue.text == '') {
                              //     return const Iterable<String>.empty();
                              //   }
                              //   return listUsers.where((String item){
                              //     return item.contains(textEditingValue.text.toLowerCase());
                              //   });
                              // },

                              // onSelected: (String item) {
                              //   debugPrint('The $item was selected');
                              // },
                              // )

                              TextField(
                            controller: _searchController,
                            // onChanged: _onSearchTextChanged,
                            decoration: InputDecoration(
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, top: 15, bottom: 20, right: 10),
                                  child: SvgPicture.asset(
                                    'assets/images/img_clock_black_900.svg',
                                    height: 5,
                                  ),
                                ),
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: SvgPicture.asset(
                                      'assets/images/img_settings.svg'),
                                ),
                                hintText: "Search",
                                hintStyle: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                                filled: true,
                                fillColor:
                                    ColorConstant.clTextFormfieldFilledColor,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return const AddRefferenceFiftyThreeScreen();
                              }),
                            );
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: ColorConstant.clElevatedButtonColor),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                    //          SizedBox(height: 10),
                    // Container(
                    //   height: 50, // Height for suggestion list
                    //   child: ListView.builder(
                    //     itemCount: filteredSuggestions.length,
                    //     itemBuilder: (context, index) {
                    //       return ListTile(
                    //         title: Text(filteredSuggestions[index]),
                    //         onTap: () {
                    //           _chooseSuggestion(filteredSuggestions[index]);
                    //         },
                    //       );
                    //     },
                    //   ),
                    // ),
                    SizedBox(
                      height: DeviceSize.itemHeight / 10,
                    ),
                    Container(
                        // height: DeviceSize.itemHeight * 0.70,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                                image: AssetImage(
                                  'assets/images/Rectangle 665.png',
                                ),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(10),
                            color: ColorConstant.clElevatedButtonColor),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.all(DeviceSize.itemWidth / 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Every male has a female and every female has amale but The problem is dependent on choosing',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: DeviceSize.itemHeight / 15),
                                  ),
                                  Text(
                                    '"Find a perfect similar taste and Get the beautiful life"',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: DeviceSize.itemHeight / 10),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )),
                    SizedBox(
                      height: DeviceSize.itemHeight / 10,
                    ),
                    // Text(_allMaletest1.curUsers!.length.toString()),
                    // Text(_allMaletest1.userUid[1].length.toString()),

                    // Text(_allMaletest1.curUsers!),

                    // Text( _ AllMaletest1.curUsers!.length.toString(),),
                    // Text(
                    //   _allMaletest1.allmaleuserdata4A![0].selfie ?? 'http://127.0.0.1:3000//media/0PPQMBPEWTL/images/full_size_image/100437133_8sbeOnP.webp',
                    // ),

                    // Text(isLoading.toString()),

                    // MatchingListImageHorizontalListView(imageWord4: '', listLength: 3,),

                    //
                    // Column(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   mainAxisSize: MainAxisSize.min,
                    //   children: [

                    //     Row(
                    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //       children: [
                    //         const Column(
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: [
                    //             Text(
                    //               'New Registeration',
                    //               style: TextStyle(
                    //                   fontWeight: FontWeight.bold,
                    //                   fontSize: 15),
                    //             ),
                    //             Text(
                    //                 '76 matching profiles are available for you',
                    //                 style: TextStyle(fontSize: 13)),
                    //           ],
                    //         ),
                    //         Text('View All',
                    //             // "Test",
                    //             style: TextStyle(
                    //                 fontSize: 15,
                    //                 color: ColorConstant.deepPurpleA200))
                    //       ],
                    //     ),
                    //     const D10HCustomClSizedBoxWidget(
                    //         // height: 30,
                    //         ),

                    //     // Text(_allMaletest1.curUsers![0].selfie),

                    //     SizedBox(
                    //       height: MediaQuery.of(context).size.height / 5,
                    //       child: ListView.builder(
                    //           shrinkWrap: true,
                    //           physics: const PageScrollPhysics(),
                    //           itemCount: _allMaletest1.curUsers!.length,
                    //           scrollDirection: Axis.horizontal,
                    //           itemBuilder: (BuildContext context, int index) {
                    //             return Center(
                    //               child: Stack(children: [
                    //                 Padding(
                    //                   padding: const EdgeInsets.only(right: 15),
                    //                   child: ClipRRect(
                    //                     borderRadius: BorderRadius.circular(10),
                    //                     child: GestureDetector(
                    //                       onTap: () {
                    //                         Navigator.push(context,
                    //                             MaterialPageRoute(
                    //                                 builder: (context) {
                    //                           return Id123456FiftyScreen(
                    //                             userUidMaLi: index,
                    //                           );
                    //                         }));
                    //                       },
                    //                       child: CachedNetworkImage(
                    //                         height: 200,
                    //                         width: 150,
                    //                         fit: BoxFit.cover,

                    //                         imageUrl: _allMaletest1
                    //                                 .curUsers![index].selfie
                    //                                 .toString() ??
                    //                             'http://127.0.0.1:8000//media/0PPQMBPEWTL/images/full_size_image/100437133_8sbeOnP.webp',
                    //                         progressIndicatorBuilder: (context,
                    //                                 url, downloadProgress) =>
                    //                             Container(
                    //                           margin: const EdgeInsets.only(
                    //                             top: 5,
                    //                             bottom: 5,
                    //                           ),
                    //                           child: CircularProgressIndicator(
                    //                               value:
                    //                                   downloadProgress.progress,
                    //                               color: Colors.blue),
                    //                         ),
                    //                         errorWidget: (context, url,
                    //                                 error) =>
                    //                             const Icon(Icons
                    //                                 .error), // replace with your own error widget
                    //                       ),
                    //                     ),
                    //                   ),
                    //                 ),
                    //                 Positioned(
                    //                   left: 10,
                    //                   top: 10,
                    //                   child: GestureDetector(
                    //                     onTap: () {},
                    //                     child: const Icon(
                    //                       Icons.crop_square_outlined,
                    //                       color: Colors.white,
                    //                     ),
                    //                   ),
                    //                 ),
                    //                 Positioned(
                    //                     right: 20,
                    //                     top: 10,
                    //                     child: Column(
                    //                       children: [
                    //                         GestureDetector(
                    //                           onTap: () {
                    //                             MatchingListImageHorizontalListView
                    //                                 .profMore(
                    //                                     context,
                    //                                     _allMaletest1
                    //                                         .curUsers![index]
                    //                                         .uid
                    //                                         .toString(),
                    //                                     ThreeSigninScreen
                    //                                         .userUidAccess);
                    //                           },
                    //                           child: Container(
                    //                               decoration: BoxDecoration(
                    //                                   borderRadius:
                    //                                       BorderRadius.circular(
                    //                                           4),
                    //                                   color: Colors.black38),
                    //                               child: const Icon(
                    //                                   Icons.more_vert,
                    //                                   color: Colors.white)),
                    //                         ),
                    //                         const SizedBox(
                    //                           height: 10,
                    //                         ),
                    //                         Container(
                    //                             decoration: BoxDecoration(
                    //                                 borderRadius:
                    //                                     BorderRadius.circular(
                    //                                         4),
                    //                                 color: Colors.black38),
                    //                             child: Padding(
                    //                               padding:
                    //                                   const EdgeInsets.all(6.5),
                    //                               child: SvgPicture.asset(
                    //                                   "assets/images/imageIcon.svg"),
                    //                             )),
                    //                       ],
                    //                     )),
                    //                 Positioned(
                    //                   bottom: 10,
                    //                   left: 10,
                    //                   child: Column(
                    //                     crossAxisAlignment:
                    //                         CrossAxisAlignment.start,
                    //                     children: [
                    //                       Text(
                    //                         // widget.imageWord1,
                    //                         _allMaletest1.curUsers![index].uid
                    //                             .toString(),

                    //                         style: const TextStyle(
                    //                             fontSize: 10,
                    //                             color: Colors.white),
                    //                       ),
                    //                       Text(
                    //                         // widget.imageWord2,
                    //                         _allMaletest1
                    //                             .curUsers![index].address
                    //                             .toString(),
                    //                         style: const TextStyle(
                    //                             fontSize: 10,
                    //                             color: Colors.white),
                    //                       ),
                    //                       Text(
                    //                         // widget.imageWord3,
                    //                         _allMaletest1
                    //                             .curUsers![index].yourIntrest
                    //                             .toString(),
                    //                         style: const TextStyle(
                    //                             fontSize: 10,
                    //                             color: Colors.white),
                    //                       ),
                    //                       const Text(
                    //                         'test',
                    //                         style: TextStyle(
                    //                             fontSize: 10,
                    //                             color: Colors.white),
                    //                       ),
                    //                     ],
                    //                   ),
                    //                 ),
                    //                 Positioned(
                    //                     right: 20,
                    //                     bottom: 10,
                    //                     child: Container(
                    //                       // width: 30,
                    //                       // height: 100,
                    //                       decoration: BoxDecoration(
                    //                         gradient: LinearGradient(
                    //                           begin: const Alignment(-0.8, 1),
                    //                           end: const Alignment(-0.5, -1),
                    //                           colors: [
                    //                             ColorConstant.indigo500,
                    //                             ColorConstant.purpleA100,
                    //                           ],
                    //                           // transform: GradientRotation(0.15)
                    //                         ),
                    //                         borderRadius:
                    //                             BorderRadius.circular(10),
                    //                       ),

                    //                       child: Padding(
                    //                         padding: const EdgeInsets.all(8.0),
                    //                         child: SvgPicture.asset(
                    //                           "assets/images/handicon.svg",
                    //                           fit: BoxFit.cover,
                    //                         ),
                    //                       ),
                    //                     )),
                    //               ]),
                    //             );
                    //           }),
                    //     ),

                    //     SizedBox(
                    //       height: 10,
                    //     ),
                    //   ],
                    // ),
                    //

                    //

                    // isLoading
                    //     ? const CircularProgressIndicator()
                    //     :

                    Column(
                      children: [
                        MatchingListImageHorizontalListView(
                          leftTitle: "New Registeration",
                          leftSubTitle:
                              "75 Matching profilesare available for you",
                          rightTitle: "View All",
                          imageWord1: "_allUsers",
                          imageWord2: "Dubai, United Arab Emirates",

                          // imageWord2: _userModel![1].address.toString(),
                          imageWord3: "Life is full of Possibility",
                          imageWord4: "Online",
                          listLength: _allMaletest1.curUsers!.length,
                          imageAddress:
                              _allMaletest1.curUsers![0].selfie.toString(),
                          listType: 'New Registeration',
                        ),
                        D10HCustomClSizedBoxWidget(),
                        MatchingListImageHorizontalListView(
                              leftTitle: "My Prefference",
                              leftSubTitle:
                                  "76 Matching profilesare available for you",
                              rightTitle: "View All",
                              imageWord1: "_allUsers",
                              imageWord2: "Dubai, United Arab Emirates",
                              imageWord3: "Life is full of Possibility",
                              imageWord4: "Online",
                              listLength: _allMaletest1.curUsers!.length,
                              imageAddress:
                                  _allMaletest1.curUsers![0].selfie.toString(),
                              listType: "My Prefference",
                            ) ??
                            CircularProgressIndicator(),
                        D10HCustomClSizedBoxWidget(),
                        MatchingListImageHorizontalListView(
                          leftTitle: "Follwed List",
                          leftSubTitle:
                              "76 Matching profilesare available for you",
                          rightTitle: "View All",
                          imageWord1: "_allUsers",
                          imageWord2: "Dubai, United Arab Emirates",
                          imageWord3: "Life is full of Possibility",
                          imageWord4: "Online",
                          listLength: _allMaletest1.curUsers!.length,
                          imageAddress:
                              _allMaletest1.curUsers![0].selfie.toString(),
                          listType: 'Follwed List',
                        ),
                        D10HCustomClSizedBoxWidget(),
                        MatchingListImageHorizontalListView(
                          leftTitle: "Related List",
                          leftSubTitle:
                              "76 Matching profilesare available for you",
                          rightTitle: "View All",
                          imageWord1: "_allUsers",
                          imageWord2: "Dubai, United Arab Emirates",
                          imageWord3: "Life is full of Possibility",
                          imageWord4: "Online",
                          listLength: _allMaletest1.curUsers!.length,
                          imageAddress:
                              _allMaletest1.curUsers![0].selfie.toString(),
                          listType: 'Related List',
                        ),
                      ],
                    ),

                    D10HCustomClSizedBoxWidget(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Text(
                        //   _allMaleUserData4.the0Ppqmbpewtl!.length.toString(),
                        // ),
                        // Text(
                        //   _userModel![1].selfie.toString(),
                        // ),
                        // Text( _userModel![0].name.toString(),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Blocked List',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            Text('View All',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: ColorConstant.deepPurpleA200)),
                          ],
                        ),
                        // :

                        //  Text(
                        //     widget.leftBigTitle.toString(),
                        //     style: TextStyle(
                        //         color: ColorConstant.clFontDarkBlueColor,
                        //         fontWeight: FontWeight.bold,
                        //         fontSize: DeviceSize.itemHeight / 10),
                        //   ),

                        // EveryMaleFourtyNineScreen.blockedUsersByMe.myProf!.isEmpty ?
                        Text('You have not blocked any Profiles',
                            // "Test",
                            style: TextStyle(
                              fontSize: 13,
                            )),
                        // Text('${EveryMaleFourtyNineScreen.blockedUsersByMe.myProf.length.toString()}')
                        //     :

                        // Text('You have been blocked ${EveryMaleFourtyNineScreen
                        //                               .blockedUsersByMe
                        //                               .myProf!.length.toString()} Profiles',
                        //     // "Test",
                        //     style: TextStyle(
                        //       fontSize: 13,
                        //     )),
                      ],
                    ),
                    const D10HCustomClSizedBoxWidget(
                        // height: 30,
                        ),
                    // isLoading == true
                    //     ? Center(
                    //         child: CircularProgressIndicator(
                    //         semanticsLabel: 'Loading',
                    //       ))
                    //     :
                    EveryMaleFourtyNineScreen.blockedUsersByMe.myProf.length ==
                            1
                        // && MatchingListImageHorizontalListView.bugNullBlock != 0
                        ? SizedBox()
                        : SizedBox(
                            height: 200,
                            child: ListView.builder(
                                shrinkWrap: true,
                                physics: PageScrollPhysics(),
                                itemCount: EveryMaleFourtyNineScreen
                                    .blockedUsersByMe.myProf.length,
                                // itemCount: DataImport.allMaleUsers.curUsers!.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) {
                                  return Center(
                                    child: Stack(children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 15),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                                return Id123456FiftyScreen(
                                                  userUidMaLi: index,
                                                );
                                              }));
                                            },
                                            child: CachedNetworkImage(
                                              height: 200,
                                              width: 150,
                                              fit: BoxFit.cover,
                                              // imageUrl: MatchingListImageHorizontalListView.imageAddress,

                                              // imageUrl: MatchingListImageHorizontalListView.allMaletest1.curUsers![index].selfie,
                                              imageUrl:
                                                  EveryMaleFourtyNineScreen
                                                      .blockedUsersByMe
                                                      .myProf[index]
                                                      .selfie
                                                      .toString(),

                                              // progressIndicatorBuilder:
                                              //     (context, url, downloadProgress) =>
                                              //         Container(
                                              //   margin: EdgeInsets.only(
                                              //     top: 5,
                                              //     bottom: 5,
                                              //   ),
                                              //   child: CircularProgressIndicator(
                                              //       value: downloadProgress.progress,
                                              //       color: Colors.blue),
                                              // ),
                                              // errorWidget: (context, url, error) => Icon(Icons
                                              //     .error),
                                              //// replace with your own error widget
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 10,
                                        top: 10,
                                        child: GestureDetector(
                                          onTap: () {},
                                          child: const Icon(
                                            Icons.crop_square_outlined,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                          right: 20,
                                          top: 10,
                                          child: Column(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  MatchingListImageHorizontalListView
                                                      .profMore(
                                                          context,
                                                          // _allMaleUserData4.the0Ppqmbpewtl![index].uid
                                                          //     .toString(),
                                                          EveryMaleFourtyNineScreen
                                                              .blockedUsersByMe
                                                              .myProf![index]
                                                              .uid
                                                              .toString(),
                                                          ThreeSigninScreen
                                                              .userUidAccess,
                                                          'block');
                                                },
                                                child: Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4),
                                                        color: Colors.black38),
                                                    child: const Icon(
                                                        Icons.more_vert,
                                                        color: Colors.white)),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                      color: Colors.black38),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            6.5),
                                                    child: SvgPicture.asset(
                                                        "assets/images/imageIcon.svg"),
                                                  )),
                                            ],
                                          )),
                                      Positioned(
                                        bottom: 10,
                                        left: 10,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              // widget.imageWord1,
                                              EveryMaleFourtyNineScreen
                                                  .blockedUsersByMe
                                                  .myProf![index]
                                                  .uid
                                                  .toString(),

                                              style: const TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              // widget.imageWord2,
                                              EveryMaleFourtyNineScreen
                                                  .blockedUsersByMe
                                                  .myProf![index]
                                                  .address
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              // widget.imageWord3,
                                              EveryMaleFourtyNineScreen
                                                  .blockedUsersByMe
                                                  .myProf![index]
                                                  .yourIntrest
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                          right: 20,
                                          bottom: 10,
                                          child: InkWell(
                                            onTap: () {
                                              // debugPrint('ontap');

                                              // favourites(MatchingListImageHorizontalListView.allMaletest1.curUsers![index].uid);
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  begin:
                                                      const Alignment(-0.8, 1),
                                                  end:
                                                      const Alignment(-0.5, -1),
                                                  colors: [
                                                    ColorConstant.indigo500,
                                                    ColorConstant.purpleA100,
                                                  ],
                                                  // transform: GradientRotation(0.15)
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: SvgPicture.asset(
                                                  "assets/images/handicon.svg",
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          )),
                                    ]),
                                  );
                                }),
                          ),
                  ],
                ),
              ),
            ),
    );
  }
}
