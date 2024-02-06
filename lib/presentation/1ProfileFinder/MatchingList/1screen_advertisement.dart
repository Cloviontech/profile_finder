import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:profile_finder/model_final/modelAllUser.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/CustomClAll.dart';

class ApiService {

  static const String ipAddress = "192.168.43.53:8000";

  // static const String ipAddress = "192.168.1.4:8000";

   
  
  // static const String ipAddress = "10.0.2.2:8000";



  

  // http://10.0.2.2:8000/signup/
  // static const String ipAddress = "localhost:8000/";
  
  // static const String ipAddress = "192.168.1.2:8000";

  static List<UserModel> model =[];

  Future<List<UserModel>?> getUsers() async {
    debugPrint('entering getUsers function');
    try {
      // var url = Uri.parse("http://$ipAddress/alluserdata");
       var url = Uri.parse("http://10.0.2.2:8000/alluserdata");
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
    return model;
  }
}

// {

// 'email' = 'umsrn333@gmail.com',
//     'mobile' = '9876543210',
//     'password' = '123456',
//     'referral_code' = '123123'

// }

class OneAdvertisementScreenMatchingList extends StatefulWidget {
  const OneAdvertisementScreenMatchingList({super.key});

  @override
  State<OneAdvertisementScreenMatchingList> createState() =>
      _OneAdvertisementScreenMatchingListState();
}

class _OneAdvertisementScreenMatchingListState
    extends State<OneAdvertisementScreenMatchingList> {
  bool isLoading = true;

  late final String userUid;

  late List<UserModel>? _userModel = [];

  @override
  void initState() {
    _getData();

    super.initState();
  }

  void _getData() async {
    _userModel = (await ApiService().getUsers())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          // _userModel == null || _userModel!.isEmpty
          //     ? const Center(
          //         child: CircularProgressIndicator(),
          //       )
          //     :

          SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              // height: DeviceSize.DeviceHeight,
              height: MediaQuery.of(context).size.height,
              width: double.maxFinite,
              color: Colors.red,
              child: Center(
                  child:
                      // SvgPicture.asset("assets/images/Rectangle 1153.svg")
                      Container(
                          height: MediaQuery.of(context).size.height - 200,
                          width: double.maxFinite,
                          color: Colors.yellow,
                          child: const Center(child: Text("Advertisement")))),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  const D10HCustomClSizedBoxWidget(),
                  MatchingListImageHorizontalListView(
                    leftTitle: "Follwed List",
                    leftSubTitle: "76 Matching profilesare available for you",
                    rightTitle: "View All",
                    imageWord1: "_allUsers",
                    imageWord2: "Dubai, United Arab Emirates",
                    imageWord3: "Life is full of Possibility",
                    imageWord4: "Online",
                    listLength: _userModel!.length, 
                    imageAddress: _userModel![0].selfie.toString(),
                    listType: 'Related List',
                  ),
                  const D10HCustomClSizedBoxWidget(),
                  MatchingListImageHorizontalListView(
                    leftTitle: "Related List",
                    leftSubTitle: "76 Matching profilesare available for you",
                    rightTitle: "View All",
                    imageWord1: "_allUsers",
                    imageWord2: "Dubai, United Arab Emirates",
                    imageWord3: "Life is full of Possibility",
                    imageWord4: "Online",
                    listLength: _userModel!.length,
                    imageAddress: _userModel![0].selfie.toString(),
                    listType: 'Related List',
                  ),
                ],
              ),
            ),

            //   })
            // )
          ],
        ),
      ),
    );
  }
}
