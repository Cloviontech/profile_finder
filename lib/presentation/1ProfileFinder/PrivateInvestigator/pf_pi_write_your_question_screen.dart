import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:profile_finder/core/utils/color_constant.dart';
import 'package:profile_finder/core/utils/size_utils.dart';
import 'package:profile_finder/model_final/complaints/all_pm_data_list_model.dart';
import 'package:profile_finder/presentation/1ProfileFinder/HighlightProfile/HighlightProfileFourtySixScreen.dart';
import 'package:profile_finder/presentation/1ProfileFinder/MatchingList/1screen_advertisement.dart';
import 'package:profile_finder/presentation/1ProfileFinder/PrivateInvestigator/PiCloseDealScreen.dart';
import 'package:profile_finder/presentation/1ProfileFinder/PrivateInvestigator/WhereIsTheSanFourtyThreeScreen.dart';
import 'package:profile_finder/presentation/1ProfileFinder/Profile%20Manager/PmCloseDealScreen.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/CustomWidgets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PfPiWriteYourQuestioncreen extends StatefulWidget {
  const PfPiWriteYourQuestioncreen(
      {super.key, required this.private_investigator_id_ques});

  final String private_investigator_id_ques;

  @override
  State<PfPiWriteYourQuestioncreen> createState() =>
      _PfPiWriteYourQuestioncreenState();
}

class _PfPiWriteYourQuestioncreenState
    extends State<PfPiWriteYourQuestioncreen> {










      ask_question_to_private_investigator( String questionn) async{

    SharedPreferences preferences = await SharedPreferences.getInstance();
    profile_finder_id = preferences.getString("uid2").toString();
  
  final statusCode;
  final body;
  // const profile_finder_id = "VHNK85TM5TV";
  // const my_private_investicator_id = "Y9M0YCN82YA";
  final url = Uri.parse("http://${ApiService.ipAddress}/my_question_and_answer/$profile_finder_id");
  var request = http.MultipartRequest('POST', url);
  request.fields['my_investigator'] = widget.private_investigator_id_ques;
  request.fields['Questin'] = questionn; // TextEditingController()
  try {
    final response = await request.send();
    statusCode = response.statusCode;
    body = await response.stream.bytesToString();
    print("Prof finder id : $profile_finder_id");
    print("Priv inv id: ${widget.private_investigator_id_ques}");
    print("Status Code : $statusCode");
    print("Question : $questionn");
    print("Body : $body");
    
    

    if (response.statusCode == 200) {

      Navigator.pop(context);
       Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return PfPiCloseDealScreen(private_investicator_id_close_deal: widget.private_investigator_id_ques, profile_manager_id_close_deal: '',);
                  }),
                );
    }
  } catch (e) {
    print("Do Something When Error Occurs");
  }
}


 
 
  String profile_finder_id = '';

// String questionn = '';

  // Asking Questions to Private Investigator
  complaint(String complaint) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    profile_finder_id = preferences.getString("uid2").toString();

    final statusCode;
    final body;
    // const profile_finder_id = "VHNK85TM5TV";
    // const my_private_investicator_id = "Y9M0YCN82YA";
    final url = Uri.parse(
        "http://${ApiService.ipAddress}/my_complaints/$profile_finder_id");
    var request = http.MultipartRequest('POST', url);
    request.fields['my_manager'] =
        widget.private_investigator_id_ques; 
    request.fields['complaints'] = complaint;

    try {
      final response = await request.send();
      statusCode = response.statusCode;
      body = await response.stream.bytesToString();
      print("Prof finder id : $profile_finder_id");
      print("Profile manager id: ${widget.private_investigator_id_ques}");
      print("Status Code : $statusCode");
      print("Body : $body");

      if (response.statusCode == 200) {

        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return PmCloseDealScreen(
               profile_manager_id_close_deal: widget.private_investigator_id_ques, 
            );
          }),
        );
      }
    } catch (e) {
      print("Do Something When Error Occurs");
    }
  }

  static List<AllPmDataList> model = [];

  Future<List<AllPmDataList>?> _fetchallPmDataList() async {
    debugPrint('entering getUsers function');
    try {
      // var url = Uri.parse("http://$ipAddress/alluserdata");
      var url = Uri.parse("http://${ApiService.ipAddress}/all_pm_data");
      //  var url = Uri.parse("http://127.0.0.1:3000/alluserdata");

      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<AllPmDataList> model = allPmDataListFromJson(response.body);
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

  List _allPmUidList = [];

  _allPmDataListLooping() {
    for (var i = 0; i < model.length; i++) {
      _allPmUidList.add(model[i].uid);
    }

    for (var j = 0; j < _allPmUidList.length; j++) {}
  }

  TextEditingController questionController = TextEditingController();
  
  @override
  void initState() {
    _fetchallPmDataList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ClAppbarLeadGridSuffHeart(
          testingNextPage: HighlightProfileFourtySixScreen()),
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
                'write your Question here',
                style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    fontSize: DeviceSize.itemHeight / 15),
              ),
              SizedBox(
                height: DeviceSize.itemHeight / 10,
              ),
              //  CustomClTextformfieldWithSuffixIconWidget(
              //   questionController: questionControllerScreen,

              //  ),

              TextFormField(
                controller: questionController,

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
                    // Navigator.pop(context);
                  },
                  borderRadius: BorderRadius.circular(10),
                  width: double.maxFinite,
                  backgroundColor: Colors.white,
                  // gradient: LinearGradient(
                  //     begin: Alignment(0, 0.56),
                  //     end: Alignment(1, 0.56),
                  //     colors: [ColorConstant.indigo500, ColorConstant.purpleA100]),
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                        color: ColorConstant.clPurple5,
                        // fontWeight: FontWeight.bold,
                        fontSize: DeviceSize.itemHeight / 15),
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
                    ask_question_to_private_investigator(questionController.text);
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
