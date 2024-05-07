import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:profile_finder/routes/app_routes.dart';

// import 'package:flutter/dart:ui';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

ThemeData _baseTheme = ThemeData(
  fontFamily: "Roboto",
  canvasColor: Colors.white,
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _baseTheme,
      title: 'marriyoo',
      debugShowCheckedModeBanner: false,

      initialRoute: AppRoutes.oneSplashScreen,
      routes: AppRoutes.routes,
    );
  }
}




/*
  
  // List<MyInvestigator> myInvestigator = [];

  // Future<String?> fetchMyInvestigatorData() async {
  //   setState(() {
  //     myInvestigator = [];
  //   });
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   userUid = preferences.getString("uid2").toString();

  //   print("myManagerList function start");
  //   print(userUid);
  //   final response = await http
  //       .get(Uri.parse("http://${ApiService.ipAddress}/my_investigator/$userUid"));
  //   print(response.body);
  //   final _data = jsonDecode(response.body) as Map;
  //   final idd = _data.keys.first;
  //   for (final pm in _data[idd]) {
  //     myInvestigator.add(MyInvestigator.fromJson(pm));
  //   }
  // }


// 
   body: 

      _isLoading ? 

        const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Center(
                  child: Text(
                    'View Complaintsssss',
                    style: TextStyle(
                      // fontFamily: "Inter",
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
            Expanded(child: SpinKitWave(color: Colors.blue, itemCount: 15, )),
          ],
        )

        :
        
      
      SingleChildScrollView(


  // 


  */