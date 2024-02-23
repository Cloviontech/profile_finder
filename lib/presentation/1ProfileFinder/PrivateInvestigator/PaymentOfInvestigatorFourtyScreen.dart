import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:profile_finder/core/services/api_services.dart';
import 'package:profile_finder/core/utils/color_constant.dart';
import 'package:profile_finder/core/utils/size_utils.dart';
import 'package:profile_finder/model_final/private_inv/my_investigators.dart';
import 'package:profile_finder/model_final/private_inv/pi_my_data.dart';
import 'package:profile_finder/presentation/1ProfileFinder/MatchingList/1screen_advertisement.dart';
import 'package:profile_finder/presentation/1ProfileFinder/PrivateInvestigator/CloseAndRateFourtyFourScreen.dart';
import 'package:profile_finder/presentation/1ProfileFinder/PrivateInvestigator/CloseDealFourtyOneScreen.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/CustomWidgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;




class PaymentOfInvestigatorFourtyScreen extends StatefulWidget {
   PaymentOfInvestigatorFourtyScreen({super.key,  required this.private_investicator_id});

  final String private_investicator_id;

  @override
  State<PaymentOfInvestigatorFourtyScreen> createState() => _PaymentOfInvestigatorFourtyScreenState();
}

class _PaymentOfInvestigatorFourtyScreenState extends State<PaymentOfInvestigatorFourtyScreen> {
 
 

 
   static  List<PiMyData> userList = [];


   Future<void> _fetchData() async {

    print('test pi my data start');

    
      // late String private_investicator_id;
  //  SharedPreferences preferences = await SharedPreferences.getInstance();
  //   private_investicator_id = preferences.getString("uid2").toString();
  
    final response = await http.get(Uri.parse("http://${ApiService.ipAddress}/pi_my_data/${widget.private_investicator_id}"));

    // if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      setState(() {
        userList = jsonResponse.map((data) => PiMyData.fromJson(data)).toList();
      
      });
      print(response.statusCode);
      print(response.body);

      print(userList);

      debugPrint(userList[0].profilePicture);
    // } 
    
    // else {
    //   throw Exception('Failed to load data');
    // }
  }

  String profile_finder_id = '';

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
                    return CloseDealFourtyOneScreen(private_investicator_id_close_deal: private_investigator_id);
                  }),
                );

    }
  } catch (e) {
    print("Do Something When Error Occurs");
  }
}


  static List<PrivateInvestigatorModel> privateInvestigatorCollection = [];

 Future<String?>  callApi() async {

   SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      profile_finder_id = preferences.getString("uid2").toString();
    });

   
    final response = await http.get(Uri.parse(
        "http://${ApiServices.ipAddress}/my_investigator/$profile_finder_id"));
    final _data = jsonDecode(response.body) as Map;
    final idd = _data.keys.first;
    for (final pi in _data[idd]) {
      privateInvestigatorCollection.add(PrivateInvestigatorModel.fromJson(pi));
    }
  }

// 

  List <String>? MyInvestigatorsUidList = [];

  getMyInvestigatorsUid() {
    for (var i = 0; i < privateInvestigatorCollection.length; i++) {
      MyInvestigatorsUidList!.add(privateInvestigatorCollection[i].uid.toString());
    }
  }
  // 


@override
  void initState() {
    // TODO: implement initState

    _fetchData();
     callApi().whenComplete(() => getMyInvestigatorsUid());
   

    super.initState();
  }


 
 
  @override
  Widget build(BuildContext context) {
    // return Scaffold();
    return Scaffold(
      appBar:  ClAppbarLeadGridSuffHeart(testingNextPage:  CloseDealFourtyOneScreen(private_investicator_id_close_deal: '',)),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(profile_finder_id),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade300)),
                  // height: DeviceSize.itemHeight * 2.5,
                  height: DeviceSize.itemHeight * 3,

                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Column(
                        children: [
                          Container(
                            // cover pic
                            height: 200,

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.orange,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'assets/images/img_rectangle690.png', //cover pic
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        top: 150,
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration:  BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.green,
                              image: DecorationImage(
                                image: 
                                // AssetImage(
                                //     'assets/images/img_ellipse76.png'), 
                                NetworkImage("${userList[0].profilePicture}")
                                //
                                //// profile pic
                              )),
                        ),
                      ),
                      Positioned(
                        top: 260,
                        bottom: 30,
                        child: Column(
                          // mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             Text(
                             userList[0].firstName ??  'Ariene McCoy',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                             Row(
                               children: [
                                 Text("${userList[0].officeCity}"),
                                 Text(",  "),
                                 Text("${userList[0].officeCountry}"),
                                 
                               ],
                             ),
                             Text('Payment of Investigator'),
                            Text(
                              '₹ 1200',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40,
                                  color: ColorConstant.clgreenAmountColor),
                            ),
                            const Text('For one month'),
                            MyElevatedButton(
                              onPressed: () {
                                MyInvestigatorsUidList!.contains(widget.private_investicator_id) ? 
                                 
 Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return CloseDealFourtyOneScreen(private_investicator_id_close_deal: widget.private_investicator_id);
                  }),
                )
                                 :
                                my_investigator(widget.private_investicator_id);
                              },
                              borderRadius: BorderRadius.circular(10),
                              backgroundColor: Colors.transparent,
                              child: MyInvestigatorsUidList!.contains(widget.private_investicator_id) ? 
                              Text("Hired",
                               style: TextStyle(
                      color: Colors.white,)
                              ):
                              Text("Hire Investigator",
                               style: TextStyle(
                      color: Colors.white,)
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: DeviceSize.itemHeight / 15),
              Text(
                "Reviews",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: DeviceSize.itemWidth / 13,
                    color: ColorConstant.clgreenAmountColor),
              ),
              SizedBox(height: DeviceSize.itemHeight / 15),
               Text(MyInvestigatorsUidList.toString()),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/img_ticket.svg',
                    height: 20,
                  ),
                  Text(
                    "  4.2",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: DeviceSize.itemWidth / 13,
                    ),
                  ),
                ],
              ),
              SizedBox(height: DeviceSize.itemHeight / 15),
              ListTile(
                contentPadding: const EdgeInsets.all(10),
                title: Text('60%', style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: DeviceSize.itemWidth / 13,
                  ),),
                subtitle: const Text('Good Reviews'),
                leading: SvgPicture.asset(
                  'assets/images/img_location.svg',
                  height: 45,
                ),
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: ColorConstant.clgreyborderColor),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
              ),
              CustomClListtileWidget(
                  profilePic: 'assets/images/img_ellipse88.png',


                  // C:\Flutter projects\Saran\Official\Marriyo\Marriyo_17_May\marriyo_17_may\assets\images\img_ellipse88.png
                  title: "Jane Cooper",
                  subtitleImage: 'assets/images/img_ticket.svg',
                  subTitle:
                      "The investigator is very quick and collect all details what i request him. thanks lot for helping such a great job."),
              CustomClListtileWidget(
                  profilePic: 'assets/images/img_ellipse89.png',
                  title: "Darrel Steward",
                  subtitleImage: 'assets/images/img_ticket.svg',
                  subTitle:
                      "The investigator is very quick and collect all details what i request him. thanks lot for helping such a great job."),
              CustomClListtileWidget(
                  profilePic: 'assets/images/img_ellipse89_53x53.png',
                    
                  title: "Kristin Watson",
                  subtitleImage: 'assets/images/img_ticket.svg',
                  subTitle:
                      "The investigator is very quick and collect all details what i request him. thanks lot for helping such a great job."),
              CustomClListtileWidget(
                  profilePic: 'assets/images/img_ellipse89_1.png',
                  title: "Brooklyn Simmons",
                  subtitleImage: 'assets/images/img_ticket.svg',
                  subTitle:
                      "The investigator is very quick and collect all details what i request him. thanks lot for helping such a great job."),
              CustomClListtileWidget(
                  profilePic: 'assets/images/img_ellipse89_2.png',
                  title: "Cody Fisher",
                  subtitleImage: 'assets/images/img_ticket.svg',
                  subTitle:
                      "The investigator is very quick and collect all details what i request him. thanks lot for helping such a great job.",
                  borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)
                        
                      ),
                  ),
              
                  
              
               SizedBox(height: DeviceSize.itemHeight / 15),
               ListTile(
                // minLeadingWidth: 5,
                // horizontalTitleGap: 100,
                contentPadding: const EdgeInsets.all(10),
                title: Text('40%', style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: DeviceSize.itemWidth / 13,
                  ),),
                subtitle: const Text('Bad Reviews'),
                leading: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize:MainAxisSize.min,
                  children: [
                    const SizedBox(width: 5,),
                    SvgPicture.asset(
                      'assets/images/img_group_red_400.svg',
                      height: 50,
                    ),

                  ],
                ),
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: ColorConstant.clgreyborderColor),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
              ),
              CustomClListtileWidget(
                  profilePic: 'assets/images/img_ellipse88_53x53.png',
                  
                  title: "Cody Fisher",
                  subtitleImage: 'assets/images/img_ticket.svg',
                  subTitle:
                      "The investigator is very quick and collect all details what i request him. thanks lot for helping such a great job."),
              CustomClListtileWidget(
                  profilePic: 'assets/images/img_ellipse89_3.png',
                  
                  title: "Brooklyn Simmons",
                  subtitleImage: 'assets/images/img_ticket.svg',
                  subTitle:
                      "The investigator is very quick and collect all details what i request him. thanks lot for helping such a great job."),
              CustomClListtileWidget(
                  profilePic: 'assets/images/img_ellipse89_4.png',
                  title: "Brooklyn Simmons",
                  subtitleImage: 'assets/images/img_ticket.svg',
                  subTitle:
                      "The investigator is very quick and collect all details what i request him. thanks lot for helping such a great job."),
              CustomClListtileWidget(
                  profilePic: 'assets/images/img_ellipse89_5.png',
                  title: "Brooklyn Simmons",
                  subtitleImage: 'assets/images/img_ticket.svg',
                  borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10) ,),
                  subTitle:
                      "The investigator is very quick and collect all details what i request him. thanks lot for helping such a great job."),
             

              SizedBox(
                height: DeviceSize.itemHeight / 2,
              ),


            ],
          ),
        ),
      ),
    );
  }
}
