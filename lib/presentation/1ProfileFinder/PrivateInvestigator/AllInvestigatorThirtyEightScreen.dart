
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:profile_finder/core/utils/color_constant.dart';
import 'package:profile_finder/core/utils/size_utils.dart';
import 'package:profile_finder/model_final/model_final.dart';
import 'package:profile_finder/model_final/private_inv/all_private_inv.dart';
import 'package:profile_finder/presentation/1ProfileFinder/MatchingList/1screen_advertisement.dart';
import 'package:profile_finder/presentation/1ProfileFinder/PrivateInvestigator/PaymentOfInvestigatorFourtyScreen.dart';
import 'package:profile_finder/presentation/1ProfileFinder/PrivateInvestigator/TaskCompleteThirtyNineScreen.dart';
import 'package:profile_finder/routes/app_routes.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/CustomWidgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;



class AllInvestigatorThirtyEightScreen extends StatefulWidget {
  @override
  State<AllInvestigatorThirtyEightScreen> createState() => _AllInvestigatorThirtyEightScreenState();
}

class _AllInvestigatorThirtyEightScreenState extends State<AllInvestigatorThirtyEightScreen> {
  final double itemHeight = (size.height - kToolbarHeight - 24) / 4;

  final double itemWidth = size.width / 2;


 List <bool> hire = [
  
 ]; 


 


 List <String> pi_my_Clients = [];

  // late String private_investicator_id;
   String profile_finder_id = '';


  static late List<AllPiData> _allPiData;


   Future<void> _fetchData(int index) async {

    
    
    final response = await http.get(Uri.parse("http://${ApiService.ipAddress}/all_private_investigator_data"));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      setState(() {
        _allPiData = jsonResponse.map((data) => AllPiData.fromJson(data)).toList();
      
       pi_my_Clients.add(_allPiData[index].myClient);
      print("fetchData_myclients : ${_allPiData[index].myClient}");
       print("hire alldata bool :${_allPiData[index].myClient.toString().contains(profile_finder_id)}");
       print("hire alldata bool :${_allPiData[index].myClient.toString().contains('abcdef')}");
                 
      print(_allPiData[index]);
      
      
      });

      // debugPrint(_allPiData[0].profilePicture);
    } else {
      throw Exception('Failed to load data');
    }
  }

 

 my_investigator(String private_investigator_id,) async{
  final statusCode;
  final statusCode1;
  final body;
  final body1;
  // await Future.delayed(Duration(seconds: 2));
  // debugPrint("My investigator start");
      
  SharedPreferences preferences = await SharedPreferences.getInstance();
  setState(() {
     profile_finder_id = preferences.getString("uid2").toString();
  });
   
  
  final url = Uri.parse("http://${ApiService.ipAddress}/my_investigator/$profile_finder_id");
  final pi_client = Uri.parse("http://${ApiService.ipAddress}/pi_my_clients/$private_investigator_id");
   print("private_inv_id : $private_investigator_id");
  
  // var request =  http.MultipartRequest('POST', url);
  var request1 = http.MultipartRequest('POST', pi_client);
  // request.fields['pf_id'] = profile_finder_id;
  // request.fields['pi_id'] = private_investigator_id;

  request1.fields['pf_id'] = profile_finder_id;
  request1.fields['pi_id'] = private_investigator_id;
  try {

    // if (_users.myInvestigator.toString().contains(private_investigator_id))
    // {

    // }


    // else{
       var request =  http.MultipartRequest('POST', url);
       request.fields['pf_id'] = profile_finder_id;
  request.fields['pi_id'] = private_investigator_id;
      

    final response = await request.send();
    statusCode = response.statusCode;
    body = await response.stream.bytesToString();
    print("Status Code : $statusCode");
    print("UID : $body");


    // }

    final response1 = await request1.send();
    statusCode1 = response1.statusCode;
    body1 = await response1.stream.bytesToString();


   
    print("Status Code1 : $statusCode1");
    print("UID1 : $body1");
    print("Private Investigator selected succesfully, Uid : $private_investigator_id");
    
    if (response.statusCode == 200) {
      // setState(() {
      //   hire[hiree] = true;
      // });

      // Navigator.pushNamed(context, AppRoutes.paymentOfInvestigatorFourtyScreen);
     
 Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return PaymentOfInvestigatorFourtyScreen(private_investicator_id: private_investigator_id,);
                  }),
                );

    }
  } catch (e) {
    print("Do Something When Error Occurs");
  }
}


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

 static bool displayInvestigator = true;



  @override
  void initState() {
    // TODO: implement initState
     getData();
    _fetchData(0);
   
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ClAppbarLeadGridSuffHeart(testingNextPage:  TaskCompleteThirtyNineScreen()),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: const BoxDecoration(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SvgPicture.asset(
                          'assets/images/img_clock_black_900.svg',
                        ),
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child:
                            SvgPicture.asset('assets/images/img_settings.svg'),
                      ),
                      hintText: "Search",
                      filled: true,
                      fillColor: ColorConstant.clTextFormfieldFilledColor,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10))),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 8,
                        child: MyElevatedButton(
                          onPressed: () {
                            setState(() {
                              displayInvestigator = true;
                              debugPrint(displayInvestigator.toString());
                            });
                          },
                          borderRadius: BorderRadius.circular(30),
                          backgroundColor:  displayInvestigator  ? ColorConstant.clElevatedButtonColor : ColorConstant.clElevatedButtonFontColor,
                          child:  Text(
                            "All Investigator",
                            style: TextStyle(color: displayInvestigator  ? Colors.white : ColorConstant.clElevatedButtonFontColor),
                            
                          ),
                        ),
                      ),
                      const Expanded(
                          flex: 1,
                          child: SizedBox(
                            width: 20,
                          )),
                      Expanded(
                        flex: 8,
                        child: MyElevatedButton(
                          onPressed: () {
                             displayInvestigator = false;
                              debugPrint(displayInvestigator.toString());
                          },
                          child: Text(
                            "My Investigator",
                            style: TextStyle(
                                color:  displayInvestigator ? Colors.white :  ColorConstant.clElevatedButtonFontColor),
                          ),
                          borderRadius: BorderRadius.circular(30),
                          backgroundColor:  displayInvestigator  ? ColorConstant.clElevatedButtonColor : ColorConstant.clElevatedButtonColor2,
                        ),
                      )
                    ],
                  ),
                ),

                ListView.builder(
                  controller: ScrollController(),
                  itemCount:  displayInvestigator ? _allPiData.length : _allPiData.length,
                  shrinkWrap: true,
                  itemBuilder: ((context, index) {
                    return GestureDetector(
                      onTap: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) {
                        //   return SuccessStoryThirtyFiveScreen(
                        //     index: index,
                        //   );
                        // }));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Column(
                            children: [
                             
                               ClProfilePictureWithCover(
                  itemHeight: itemHeight, 
                profilePicturepath: 'assets/images/img_ellipse76.png', 
                coverPicturepath: 'assets/images/img_rectangle690.png', 
                name:_allPiData[index].firstName.toString(), 
                place: '${_allPiData[index].officeCity.toString()},  ${_allPiData[index].officeCountry.toString()}',
                 
                 
                //  onPressed: my_investigator(_allPiData[index].uid), 
                // onPressed: testFunction(),
                onPressed: () async{
                  _fetchData(index);
                  my_investigator(_allPiData[index].uid,);
                  
                  print("button$pi_my_Clients");
                  print("hire :${pi_my_Clients[index].contains(profile_finder_id)}");
                  print("hire alldata bool :${_allPiData[index].myClient.toString().contains(profile_finder_id)}");
                  
                  print("hire_allData :${_allPiData[index].myClient}");
                  print("profilefind_myInv :${_users.myInvestigator.toString()}");
                  
                   
                  
                }, 
                // hire: pi_my_Clients[index].contains(profile_finder_id) 
                hire: _allPiData[index].myClient.toString().contains(profile_finder_id), elevatedButtonText: 'Hire Investigator' ,



                // onPressed: my_investigator(_allPiData[index].uid), buttonData: '', 
                // onTapHirePi:my_investigator(_allPiData[index].uid),
                
                ),
                            ],
                          )
                          
                          // Image.network(
                          //   _allPiData[index].firstName .toString(),
                          //   fit: BoxFit.cover,
                          //   height: 200,
                          //   width: double.maxFinite,
                          // ),
                        ),
                      ),
                    );
                  })),



               
                // ClProfilePictureWithCover(
                //   itemHeight: itemHeight, 
                // profilePicturepath: 'assets/images/img_ellipse76.png', 
                // coverPicturepath: 'assets/images/img_rectangle690.png', 
                // name: 'Ariene McCoy', place: 'Dubai, United Arab Emirates',),
                // ClProfilePictureWithCover(itemHeight: itemHeight, 
                // profilePicturepath: 'assets/images/img_ellipse77.png', 
                // coverPicturepath: 'assets/images/img_rectangle692.png', 
                // name: "Ariene McCoy", place: 'Dubai, United Arab Emirates'),
                // ClProfilePictureWithCover(itemHeight: itemHeight, 
                // profilePicturepath: 'assets/images/img_ellipse78.png', 
                // coverPicturepath: 'assets/images/img_rectangle694.png', 
                // name: "Ariene McCoy", place: 'Dubai, United Arab Emirates'),
                // ClProfilePictureWithCover(
                // itemHeight: itemHeight, 
                // profilePicturepath: 'assets/images/img_ellipse79.png', 
                // coverPicturepath: 'assets/images/img_rectangle696.png', 
                // name: "Ariene McCoy", place: 'Dubai, United Arab Emirates'),
                ],
            ),
          ),
        ),
      ),
    );
  }
}
