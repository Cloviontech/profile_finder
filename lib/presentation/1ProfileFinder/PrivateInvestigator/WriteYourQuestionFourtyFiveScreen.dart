




import 'package:flutter/material.dart';
import 'package:profile_finder/core/utils/color_constant.dart';
import 'package:profile_finder/core/utils/size_utils.dart';
import 'package:profile_finder/presentation/1ProfileFinder/HighlightProfile/HighlightProfileFourtySixScreen.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/CustomWidgets.dart';

class WriteYourQuestionFourtyFiveScreen extends StatelessWidget {
  const WriteYourQuestionFourtyFiveScreen({super.key});

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
              const CustomClTextformfieldWithSuffixIconWidget(),
               SizedBox(
                height: DeviceSize.itemHeight / 10,
              ),
              Text(
                'Required Answer Type',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: DeviceSize.itemHeight/13),
              ),
              SizedBox(
                height: DeviceSize.itemHeight / 10,
              ),
              const CustomClRectangleCheckboxWithQuestionWidget(question: 'Video', completed: false,),
              const CustomClRectangleCheckboxWithQuestionWidget(question: 'Image', completed: false,),
              const CustomClRectangleCheckboxWithQuestionWidget(question: 'Voice', completed: false,),
              const CustomClRectangleCheckboxWithQuestionWidget(question: 'Text', completed: false,),
              
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
                  onPressed: () {},
                  borderRadius: BorderRadius.circular(10),
                  width: double.maxFinite,
                  backgroundColor: Colors.transparent,
                  // gradient: LinearGradient(
                  //     begin: Alignment(0, 0.56),
                  //     end: Alignment(1, 0.56),
                  //     colors: [ColorConstant.indigo500, ColorConstant.purpleA100]),
                  child: const Text(
                    'Submit',
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

                                                                          
