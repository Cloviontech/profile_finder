
// import 'dart:convert';
// // import 'dart:js';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:marriyo_17_may/model/data_model.dart';
// import 'package:marriyo_17_may/model_final/model_final.dart';
// import 'package:shared_preferences/shared_preferences.dart';


// class CommonlyUsedMethods {
  
//   Users users = Users();
//   bool isLoading = true;

//  late final String userUid ;

//   void getData() async {
//     SharedPreferences preferences = await SharedPreferences.getInstance();

//     userUid = preferences.getString("uid2").toString();
    
//     final response = await http
//         .get(Uri.parse("http://54.159.186.219:8000/alldata/$userUid"));
//     var json = jsonDecode(response.body);

//     print("statusCodeIs${response.statusCode}");

//     if (response.statusCode == 200) {
//       users = Users.fromJson(json);
//       print(response.body);
//       // await Future.delayed(const Duration(seconds: 1), () {});

//       // setState(() {
//       //   isLoading = false;
//       // });
//     } else {
//       print("error");
//       print(response.statusCode);
//     }

// }
// }


// // class GeneralMethodsRegisteration {
// //    bool _isLoading = true;
// //       DataModel? dataFromAPI;
// //   _getData() async {
// //     try {
// //       String url = "https://dummyjson.com/products";
// //       http.Response res = await http.get(Uri.parse(url));
// //       if (res.statusCode == 200) {
// //         dataFromAPI = DataModel.fromJson(json.decode(res.body));
// //         _isLoading = false;
// //         // setState(() {});
// //       }
// //     } catch (e) {
// //       debugPrint(e.toString());
// //     }
// //   }
// // }



// // class RetrieveDatafromApi extends StatefulWidget {
// //   const RetrieveDatafromApi({super.key});

// //   @override
// //   State<RetrieveDatafromApi> createState() => _RetrieveDatafromApiState();
// // }

// // class _RetrieveDatafromApiState extends State<RetrieveDatafromApi> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Text(GeneralMethodsRegisteration().dataFromAPI.products.id  ),
// //     );
// //   }
// // }


// // class ApiConstants {
// //   static String baseUrl = 'http://3.86.99.140:8000/alldata/$id';
// //   static String usersEndpoint = '/users';

// //   final String id;

// //   ApiConstants(this.id);


// // }


// // class DeviceSize extends StatelessWidget {

// //   var size = MediaQuery.of(context).size;

  

// //     final double deviceHeight = size.height ;
// //     final double deviceHidth = size.width ;

// // }