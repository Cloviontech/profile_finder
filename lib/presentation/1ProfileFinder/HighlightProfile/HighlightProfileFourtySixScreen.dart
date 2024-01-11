import 'package:flutter/material.dart';
import 'package:profile_finder/core/utils/color_constant.dart';
import 'package:profile_finder/core/utils/size_utils.dart';
import 'package:profile_finder/presentation/1ProfileFinder/Account%20Settings/Aed3100FourtySevenScreen.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/CustomWidgets.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/WidgetTitleAndDropdown.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/WidgetTitleAndTextfield.dart';
class HighlightProfileFourtySixScreen extends StatelessWidget {
  const HighlightProfileFourtySixScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ClAppbarLeadArrowBackSuffHeart(testingNextPage:  Aed3100FourtySevenScreen()),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Highlight Profile',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: DeviceSize.itemHeight / 10,
              ),
              WidgetTitleAndDropdown(
                DbdItems: [],
                DdbHint: '',
                DdbTitle: 'Country (Multiple)*',
                onChanged: null,
              ),
              WidgetTitleAndDropdown(
                DbdItems: [],
                DdbHint: '',
                DdbTitle: 'State (Multiple)*',
                onChanged: null,
              ),
              WidgetTitleAndDropdown(
                DbdItems: [],
                DdbHint: '',
                DdbTitle: 'District (Multiple)*',
                onChanged: null,
              ),
              WidgetTitleAndDropdown(
                DbdItems: [],
                DdbHint: '',
                DdbTitle: 'Languages (Multiple)*',
                onChanged: null,
              ),
              WidgetTitleAndDropdown(
                DbdItems: [],
                DdbHint: '',
                DdbTitle: 'Gender (Multiple)*',
                onChanged: null,
              ),
              WidgetTitleAndDualTextfield(
                onChanged: (value) {},
                textFieldHint1: '25',
                textFieldTitle: 'Age Group*',
                textFieldHint2: '30',
              ),
              // Container(
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(10)),
              //   child: Text('data'),
              // ),

              Row(
                children: [
                  Container(
                    width: DeviceSize.itemWidth / 1.5,
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      tileColor: ColorConstant.clPurple05,
                      title: Center(child: Text('25-30')),
                      trailing: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorConstant.clPurple5),
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: DeviceSize.itemWidth / 10,
                  ),
                  Container(
                    width: DeviceSize.itemWidth / 1.5,
                    child: ListTile(
                      tileColor: ColorConstant.clPurple05,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      title: Center(child: Text('25-30')),
                      trailing: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorConstant.clPurple5),
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: DeviceSize.itemHeight / 10,
              ),
              MyElevatedButton(
                onPressed: () {},
                child: Text("Add More"),
                backgroundColor: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
                height: DeviceSize.itemHeight / 5,
              ),
              SizedBox(
                height: DeviceSize.itemHeight / 10,
              ),
              Text(
                'Target Settings',
                style: TextStyle(
                    color: ColorConstant.clFontDarkBlueColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              SizedBox(
                height: DeviceSize.itemHeight / 10,
              ),
              WidgetTitleAndTextfield(
                  textFieldTitle: 'Total Number Of Views',
                  textFieldHint: '100 or less',
                  onChanged: (value) {}),

              WidgetTitleAndTextfield(
                  textFieldTitle: 'How Many Days Required',
                  textFieldHint: 'Enter',
                  onChanged: (value) {}),

              WidgetTitleAndTextfield(
                  textFieldTitle: 'How Many Times Repeat Per Day',
                  textFieldHint: 'Enter',
                  onChanged: (value) {}),
                  Text(
                'If you select special days you need to pay some additional charge ',
                style: TextStyle(
                    color: ColorConstant.clFontDarkBlueColor,
                    fontStyle: FontStyle.italic,
                    
                    fontSize: DeviceSize.itemHeight/15),
              ),
               SizedBox(
                height: DeviceSize.itemHeight / 10,
              ),
             
              CustomClRectangleCheckboxWithQuestionWidget2( question: 'I agree to the Terms of Service and Privacy Policy.',),
               SizedBox(
                height: DeviceSize.itemHeight / 10,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: MyElevatedButton(
            onPressed: () {},
            borderRadius: BorderRadius.circular(10),
            width: double.maxFinite,
            backgroundColor: Colors.transparent,
            // gradient: LinearGradient(
            //     begin: Alignment(0, 0.56),
            //     end: Alignment(1, 0.56),
            //     colors: [ColorConstant.indigo500, ColorConstant.purpleA100]),
            child: Text(
              'Submit',
            )),
      ),
    );
  }
}
