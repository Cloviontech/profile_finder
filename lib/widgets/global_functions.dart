  
  
  
//   import 'dart:convert';

// import 'package:flutter/material.dart';

// _getDataMatList() async {
//     debugPrint('_getDataMatList start');
    
//     final responseMatList = await http.get(
//         Uri.parse("http://${ApiService.ipAddress}/all_male_user_data/${ThreeSigninScreen.userUidAccess}"
//              ));
//     var json = jsonDecode(responseMatList.body);

//     print("statusCodeIs${responseMatList.statusCode}");

//     if (responseMatList.statusCode == 200) {
//       print(responseMatList.body);

//       setState(()  {
//         isLoading = false;
//         _allMaletest1 = AllMaletest1.fromJson(json,  ThreeSigninScreen.userUidAccess );
//       });
//         } else {
//       print("error");
//       print(responseMatList.statusCode);
//     }

//     debugPrint('_getDataMatList end');
//   }