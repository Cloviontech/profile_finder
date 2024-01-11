// import 'dart:convert';
// import 'package:http/http.dart' as http;

// import 'package:flutter/material.dart';
// import 'package:marriyo_17_may/model_final/model_final.dart';

// class ProfileClasses {
//   Users _users = Users();
//   bool isLoading = true;


//    Future getData() async{
//     final response = await http.get(Uri.parse("http://54.159.186.219:8000/alldata/HO87X3TAIOT"));
//     var json = jsonDecode(response.body);
    
//     print("statusCodeIs${response.statusCode}");

//     if(response.statusCode == 200){
//       _users= Users.fromJson(json);
//     print(response.body);
//     // setState(() {
//     //   isLoading= false;
//     // });
//     } else{
//       print("error");
//       print(response.statusCode);
//     }
    
//     // _users= Users.fromJson(json);
//     // setState(() {
//     //   isLoading= false;
//     // });
//    }



// }

 

