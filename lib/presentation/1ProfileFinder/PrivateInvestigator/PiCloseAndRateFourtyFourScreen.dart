import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:profile_finder/core/utils/color_constant.dart';
import 'package:profile_finder/core/utils/size_utils.dart';
import 'package:profile_finder/presentation/1ProfileFinder/MatchingList/1screen_advertisement.dart';
import 'package:profile_finder/presentation/1ProfileFinder/PrivateInvestigator/PiCloseDealScreen.dart';
import 'package:profile_finder/presentation/1ProfileFinder/PrivateInvestigator/CloseDealFourtyOneScreen.dart';
import 'package:profile_finder/presentation/1ProfileFinder/PrivateInvestigator/not_used_WriteYourQuestionFourtyFiveScreen.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/CustomWidgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class CloseAndRateFourtyFourScreen extends StatefulWidget {
  CloseAndRateFourtyFourScreen(
      {super.key, required this.private_investicator_id});

  final String private_investicator_id;

  @override
  State<CloseAndRateFourtyFourScreen> createState() =>
      _CloseAndRateFourtyFourScreenState();
}

class _CloseAndRateFourtyFourScreenState
    extends State<CloseAndRateFourtyFourScreen> {
  feedBackAndRatingPrivInv(String privateInvId) async {
    late String profileFinderId;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    profileFinderId = preferences.getString("uid2").toString();

    final url = Uri.parse(
        "http://${ApiService.ipAddress}/ratings_feedback/$profileFinderId");
    var request = http.MultipartRequest('POST', url);

    request.fields['rating'] = selectedRating;
    request.fields['feedback'] = feedbackController.text;
    request.fields['investigator_uid'] = privateInvId;

    try {
      final response = await request.send();

      print(response.statusCode);
      print(response.stream.bytesToString());

      if (response.statusCode == 200) {
        Fluttertoast.showToast(
          msg: "Rated Successfully...!",
          backgroundColor: ColorConstant.deepPurpleA200,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_SHORT,
        );

        Navigator.pop(context);

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return 
            
            // PfPiCloseDealScreen(
            //   profile_manager_id_close_deal: '',
            //   private_investicator_id_close_deal:
            //       widget.private_investicator_id,
            // );

            CloseDealFourtyOneScreen(private_investicator_id_close_deal: widget.private_investicator_id,);


          }),
        );
      } else {
        Fluttertoast.showToast(
          msg: "Feedback Error...!",
          backgroundColor: ColorConstant.deepPurpleA200,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_SHORT,
        );
      }
    } catch (e) {
      // print("Do Something When Error Occurs");
      Fluttertoast.showToast(
        msg: "FeedBack Error...! Please Check...!",
        backgroundColor: ColorConstant.deepPurpleA200,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT,
      );
    }
  }

  TextEditingController feedbackController = TextEditingController();

  String selectedRating = '';
  double _height = 150;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ClAppbarLeadGridSuffHeart(
          testingNextPage: WriteYourQuestionFourtyFiveScreen(
        private_investicator_id_ques: '',
      )),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'Close & Rate',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const D10HCustomClSizedBoxWidget(),
              RatingBar.builder(
                initialRating: 1,
                minRating: 1,
                direction: Axis.horizontal,
                // allowHalfRating: true,
                itemCount: 5,
                itemSize: 40,
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  setState(() {
                    selectedRating = rating.toString();
                  });
                  print(rating);
                },
              ),
              const D10HCustomClSizedBoxWidget(),

              // Text(selectedRating),
              Text(
                'write your feedback here',
                style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    fontSize: DeviceSize.itemHeight / 15),
              ),
              SizedBox(
                height: DeviceSize.itemHeight / 10,
              ),
              // CustomClTextformfieldWithSuffixIconWidget(
              //   questionController: _controller,
              // ),

              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: ColorConstant.deepPurpleA200),
                    borderRadius: BorderRadius.circular(10)),
                child: GestureDetector(
                  onVerticalDragUpdate: (details) {
                    setState(() {
                      _height += details.delta.dy;
                      // Constrain the height to a reasonable range
                      _height = _height.clamp(
                          50.0, MediaQuery.of(context).size.height);
                    });
                  },
                  child: Stack(
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        height: _height,
                        padding: const EdgeInsets.all(10.0),
                        child: TextField(
                          controller: feedbackController,
                          maxLines: null,
                          decoration: const InputDecoration(
                            hintText: 'Enter Feedback',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 2.0, // Adjust the position as needed
                        right: 2.0, // Adjust the position as needed
                        child: IconButton(
                          icon: const Icon(Icons.menu),
                          onPressed: () {
                            // Add your onPressed logic here
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )
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
                  onPressed: () {},
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
                    feedBackAndRatingPrivInv(widget.private_investicator_id);
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
