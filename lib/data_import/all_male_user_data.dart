import 'dart:convert';

import 'package:flutter/material.dart';

import '../model_final/model_all_male_7.dart';

import 'package:http/http.dart' as http;

import '../presentation/1ProfileFinder/MatchingList/1screen_advertisement.dart';
import '../presentation/1ProfileFinder/Registeration/3ScreenSignin.dart';

class DataImport  {





 static  AllMaletest1 allMaleUsers = AllMaletest1();

  

 static bool  isLoading_all_male_users = true;

//  Future<List<AllMaletest1>?> getMaleUsers() async {
//     debugPrint('entering getMaleUsers function');
//     try {
//       // var url = Uri.parse("http://$ipAddress/alluserdata");
//        var url = Uri.parse("http://10.0.2.2:8000/all_male_user_data/${ThreeSigninScreen.userUidAccess}");
//       //  var url = Uri.parse("http://127.0.0.1:3000/alluserdata");
       

//       var response = await http.get(url);
//       var json = jsonDecode(response.body);

//       if (response.statusCode == 200) {
//         allMaleUsers1 = 
//         allMaletest1FromJson(json);
//         //  AllMaletest1.fromJson(json,ThreeSigninScreen.userUidAccess);
//         //  userModelFromJson(response.body);
//         return allMaleUsers1;
//       }
      
//       debugPrint('error code');
//       print(response.statusCode);
//     } catch (e) {
//       // log(e.toString());
//       print("error $e");
//     }
//     return model;
//   }


  static Future< AllMaletest1> allMaleUsers_import () async {
    debugPrint('allMaleUsers_import start');

    final response = await http.get(Uri.parse(
        "http://${ApiService.ipAddress}/all_male_user_data/${ThreeSigninScreen.userUidAccess}"
        // "http://10.0.2.2:8000/all_male_user_data/0PPQMBPEWTL"
        ));
    var json = jsonDecode(response.body);
    debugPrint(response.body);

    print("statusCodeIs${response.statusCode}");
    debugPrint('allMaleUsers_import process');

    if (response.statusCode == 200) {
      isLoading_all_male_users = false;
      try {
        // setState(() {
      AllMaletest1  allMaleUsers = 
              AllMaletest1.fromJson(json, ThreeSigninScreen.userUidAccess);
          //  allMaleUsers =  allMaletest1FromJson(json);
        // });

        return allMaleUsers;
      } catch (e) {
        debugPrint('try1' + e.toString());
      }

      debugPrint('allMaleUsers_import process1');

      try {
        //  debugPrint(json);

        debugPrint(allMaleUsers.curUsers![0].id.toString());
        // debugPrint(responseMatList.body[0]);
        // debugPrint(allMaleUsers.curUsers!.length.toString());
      } catch (e) {
        debugPrint('try2' + e.toString());
      }

      // isLoading = false;
      // allMaleUsers = await AllMaletest1.fromJson(json);
    } else {
      print("error");
      print(response.statusCode);
    }

    debugPrint('allMaleUsers_import end');


    return allMaleUsers;

    
  }
 


  }

 