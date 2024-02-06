import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:profile_finder/core/utils/color_constant.dart';
import 'package:profile_finder/core/utils/size_utils.dart';
import 'package:profile_finder/model_final/private_inv/my_ques_and_ans.dart';
import 'package:profile_finder/model_final/private_inv/my_ques_ans.dart';
import 'package:profile_finder/presentation/1ProfileFinder/MatchingList/1screen_advertisement.dart';
import 'package:profile_finder/presentation/1ProfileFinder/PrivateInvestigator/CloseAndRateFourtyFourScreen.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/CustomWidgets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';



 class  MyQuestionAndAnswer  {

  

  static List<MyQuesAndAns1> privateInvestigatorCollection = [];
String profile_finder_id = ' ';

   MyQuestAndAnswerFetchData () async {
   SharedPreferences preferences = await SharedPreferences.getInstance();
    profile_finder_id = preferences.getString("uid2").toString();
  }

  //  static callApi() async {
  //      SharedPreferences preferences = await SharedPreferences.getInstance();
  //   profile_finder_id = preferences.getString("uid2").toString();
  //   final response = await http.get(Uri.parse(
  //       "http://${ApiService.ipAddress}/my_question_and_answer/$profile_finder_id"));
  //   final data = jsonDecode(response.body) as Map;
  //   final id = data.keys.first;
  //   for (final pi in data[id]) {
  //     privateInvestigatorCollection.add(MyQuesAndAns1.fromJson(pi));
  //   }
  // }
}

class WhereIsTheSanFourtyThreeScreen extends StatefulWidget {
  const WhereIsTheSanFourtyThreeScreen({super.key, required this.private_investicator_id});

  final String private_investicator_id;

  @override
  State<WhereIsTheSanFourtyThreeScreen> createState() => _WhereIsTheSanFourtyThreeScreenState();
}


// MyQuesAndAns1 _myQuesAndAns = MyQuesAndAns1();
 late String _profile_finder_id;

class _WhereIsTheSanFourtyThreeScreenState extends State<WhereIsTheSanFourtyThreeScreen> {
  
  
  void get_answer_from_private_investigator () async{

    SharedPreferences preferences = await SharedPreferences.getInstance();
    _profile_finder_id = preferences.getString("uid2").toString();
 

  // var headers = {
  //     'Context-Type': 'application/json',
  //   };

  //   var requestBody = {

  //     'my_investigator': widget.private_investicator_id,

  //     'question':"What is her nick name",

  //     'answer':"Her name is Brindav",

      
  //   };
  final response = await http
        .get(
          Uri.parse("http://${ApiService.ipAddress}/my_question_and_answer/$_profile_finder_id"));
    var json = jsonDecode(response.body);

     print("statusCodeIs${response.statusCode}");
  
  // const my_private_investicator_id = "Y9M0YCN82YA";
  // final url = Uri.parse("http://${ApiService.ipAddress}/my_question_and_answer/$profile_finder_id");
  // var request = http.MultipartRequest('POST', url);
  // request.fields['my_investigator'] = widget.private_investicator_id;
  // request.fields['question'] = "What is her nick name"; // TextEditingController()
  // request.fields['answer'] = "Her name is Brindav"; // TextEditingController()
  // try {

    if (response.statusCode == 200) {
      // _myQuesAndAns = MyQuesAndAns.fromJson(json);
      // _myQuesAndAns = myQuesAndAnsFromJson(json);
      

      
      print(response.body);


      //  Navigator.push(
      //             context,
      //             MaterialPageRoute(builder: (context) {
      //               return WhereIsTheSanFourtyThreeScreen(private_investicator_id: widget.private_investicator_id,);
      //             }),
      //           );
    }


    // final response = await request.send();
    // var json = jsonDecode(response.body);
    // statusCode = response.statusCode;
    // body = await response.stream.bytesToString();
    // print("Status Code : $statusCode");
    // print("Body : $body");

 
      
  }
  //   }
  // } catch (e) {
  //   print("Do Something When Error Occurs");
  // }


    callApi() async {
       SharedPreferences preferences = await SharedPreferences.getInstance();
    _profile_finder_id = preferences.getString("uid2").toString();
    final response = await http.get(Uri.parse(
        "http://${ApiService.ipAddress}/my_question_and_answer/$_profile_finder_id"));
    final data = jsonDecode(response.body) as Map;
    final id = data.keys.first;
    for (final pi in data[id]) {
    MyQuestionAndAnswer.privateInvestigatorCollection.add(MyQuesAndAns1.fromJson(pi));
    }
  }



  @override
  void initState() {
   callApi();
    // MyQuestionAndAnswer.callApi();

    super.initState();
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  ClAppbarLeadGridSuffHeart(testingNextPage:  CloseAndRateFourtyFourScreen(private_investicator_id: '',)),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'Answer',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: DeviceSize.itemHeight / 50,
              ),
              const Text(
                'Question',
                style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              SizedBox(
                height: DeviceSize.itemHeight / 10,
              ),
              //  Text(
              //   MyQuestionAndAnswer.privateInvestigatorCollection[4].question.toString(),

              //   //  _myQuesAndAns.pfId![0].question.toString() ??
              //     // 'who is her best friend?',
              //   // 'who is her best friend?',
               
              //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              // ),
              SizedBox(
                height: DeviceSize.itemHeight / 10,
              ),
              const Text(
                'Answer',
                style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              SizedBox(
                height: DeviceSize.itemHeight / 10,
              ),
              //  Text(
              //   // 'Yes sir, she completed here graduation last year and her home is same place as her mentioned in her profile.',
              //    MyQuestionAndAnswer.privateInvestigatorCollection[1].answer.toString(),
                
              //   style: TextStyle(
              //       // fontWeight: FontWeight.bold,
              //       fontSize: 18),
              // ),
              SizedBox(
                height: DeviceSize.itemHeight / 10,
              ),


              // 
              ListView.builder(
                controller: ScrollController(),
                shrinkWrap: true,
                itemCount: MyQuestionAndAnswer.privateInvestigatorCollection.length,
                itemBuilder: (context, index){
                return Text("${ MyQuestionAndAnswer.privateInvestigatorCollection[index].question.toString()}");
              })







              // const Text(
              //   'Answer',
              //   style: TextStyle(
              //       // fontWeight: FontWeight.bold,
              //       fontSize: 15),
              // ),
              // SizedBox(
              //   height: DeviceSize.itemHeight / 50,
              // ),
              // Container(
              //   width: 150.0,
              //   height: 150.0,
              //   decoration: const BoxDecoration(
              //     image: DecorationImage(
              //         fit: BoxFit.cover,
              //         image: AssetImage('assets/images/img_rectangle715.png')),
              //     borderRadius: BorderRadius.all(Radius.circular(8.0)),
              //     color: Colors.redAccent,
              //   ),
              // ),
              // SizedBox(
              //   height: DeviceSize.itemHeight / 10,
              // ),
              // Container(
              //   height: 50,
              //   width: double.maxFinite,
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(10),
              //       color: ColorConstant.clContainerFilledColorgrey),
              // )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: MyElevatedButton(
            onPressed: () {},
            borderRadius: BorderRadius.circular(10),
            backgroundColor: Colors.transparent,
            // gradient: LinearGradient(
            //     begin: Alignment(0, 0.56),
            //     end: Alignment(1, 0.56),
            //     colors: [ColorConstant.indigo500, ColorConstant.purpleA100]),
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.white),
            )),
      ),
    );
  }
}

// gradient: LinearGradient(begin: Alignment(0, 0.56), end: Alignment(1, 0.56), colors: [
//                                                                                 ColorConstant.indigo500,
//                                                                                 ColorConstant.purpleA100
//                                                                               ])
