




import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:profile_finder/core/utils/color_constant.dart';
import 'package:profile_finder/core/utils/size_utils.dart';
import 'package:profile_finder/presentation/1ProfileFinder/HighlightProfile/HighlightProfileFourtySixScreen.dart';
import 'package:profile_finder/presentation/1ProfileFinder/MatchingList/1screen_advertisement.dart';
import 'package:profile_finder/presentation/1ProfileFinder/PrivateInvestigator/WhereIsTheSanFourtyThreeScreen.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/CustomWidgets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class WriteYourQuestionFourtyFiveScreen extends StatefulWidget {
  const WriteYourQuestionFourtyFiveScreen({super.key, required this.private_investicator_id_ques});

  final String private_investicator_id_ques;

  @override
  State<WriteYourQuestionFourtyFiveScreen> createState() => _WriteYourQuestionFourtyFiveScreenState();
}

class _WriteYourQuestionFourtyFiveScreenState extends State<WriteYourQuestionFourtyFiveScreen> {
 
String profile_finder_id = '';


// String questionn = '';

     // Asking Questions to Private Investigator
ask_question_to_private_investigator( String questionn) async{

    SharedPreferences preferences = await SharedPreferences.getInstance();
    profile_finder_id = preferences.getString("uid2").toString();
  
  final statusCode;
  final body;
  // const profile_finder_id = "VHNK85TM5TV";
  // const my_private_investicator_id = "Y9M0YCN82YA";
  final url = Uri.parse("http://${ApiService.ipAddress}/my_question_and_answer/$profile_finder_id");
  var request = http.MultipartRequest('POST', url);
  request.fields['my_investigator'] = widget.private_investicator_id_ques;
  request.fields['Questin'] = questionn; // TextEditingController()
  try {
    final response = await request.send();
    statusCode = response.statusCode;
    body = await response.stream.bytesToString();
    print("Prof finder id : $profile_finder_id");
    print("Priv inv id: ${widget.private_investicator_id_ques}");
    print("Status Code : $statusCode");
    print("Question : $questionn");
    print("Body : $body");
    
    

    if (response.statusCode == 200) {
      Navigator.pop(context);
       Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return WhereIsTheSanFourtyThreeScreen(private_investicator_id: widget.private_investicator_id_ques,);
                  }),
                );
    }
  } catch (e) {
    print("Do Something When Error Occurs");
  }
}


TextEditingController questionControllerScreen = TextEditingController();
 
 
 
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: const ClAppbarLeadGridSuffHeart(testingNextPage:  HighlightProfileFourtySixScreen()),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'Question',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: DeviceSize.itemHeight / 50,
              ),
             
              Text(
                'write your question here',
                style: TextStyle(
                  // fontWeight: FontWeight.bold,
                 fontSize: DeviceSize.itemHeight/15),
              ),
              SizedBox(
                height: DeviceSize.itemHeight / 10,
              ),
              //  CustomClTextformfieldWithSuffixIconWidget(
              //   questionController: questionControllerScreen,
               
              //  ),

              TextFormField(

      controller: questionControllerScreen ,
     
      // expands: true,
      maxLines: 5,
      minLines: null,

      decoration: InputDecoration(
          suffixIcon: Padding(
            padding: const EdgeInsets.only(top: 150, bottom: 0),
            child: SvgPicture.asset(
              'assets/images/img_menu.svg',
              alignment: Alignment.bottomLeft,
            ),
          ),
          suffixIconConstraints:
              const BoxConstraints(minWidth: 20, minHeight: 20),
          // contentPadding: EdgeInsets.only(left: 10,top: 30,right: 10, bottom: -10),
          border: OutlineInputBorder(
              borderSide: const BorderSide(),
              // gapPadding: 10,

              borderRadius: BorderRadius.circular(10))),
    ),
               SizedBox(
                height: DeviceSize.itemHeight / 10,
              ),
              // Text(
              //   'Required Answer Type',
              //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: DeviceSize.itemHeight/13),
              // ),
              // SizedBox(
              //   height: DeviceSize.itemHeight / 10,
              // ),
              // const CustomClRectangleCheckboxWithQuestionWidget(question: 'Video', completed: false,),
              // const CustomClRectangleCheckboxWithQuestionWidget(question: 'Image', completed: false,),
              // const CustomClRectangleCheckboxWithQuestionWidget(question: 'Voice', completed: false,),
              // const CustomClRectangleCheckboxWithQuestionWidget(question: 'Text', completed: false,),
              
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 10,
              child: MyElevatedButtonWithBorderColor(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  borderRadius: BorderRadius.circular(10),
                  width: double.maxFinite,
                  backgroundColor: Colors.white,
                  // gradient: LinearGradient(
                  //     begin: Alignment(0, 0.56),
                  //     end: Alignment(1, 0.56),
                  //     colors: [ColorConstant.indigo500, ColorConstant.purpleA100]),
                  child: Text(
                    'Cancel', style: TextStyle(
                      color: ColorConstant.clPurple5,
                  // fontWeight: FontWeight.bold,
                 fontSize: DeviceSize.itemHeight/15),
                  )),
            ),
            Expanded(
              flex: 1,
              child: SizedBox(
                  height: DeviceSize.itemHeight / 10,
                ),
            ),
            Expanded(
              flex: 10,
              child: MyElevatedButton(
                  onPressed: () {
                    ask_question_to_private_investigator(questionControllerScreen.text);
                  },
                  borderRadius: BorderRadius.circular(10),
                  width: double.maxFinite,
                  backgroundColor: Colors.transparent,
                  // gradient: LinearGradient(
                  //     begin: Alignment(0, 0.56),
                  //     end: Alignment(1, 0.56),
                  //     colors: [ColorConstant.indigo500, ColorConstant.purpleA100]),
                  child: const Text(
                    'Submit',
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

                                                                          
