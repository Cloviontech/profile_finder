import 'package:flutter/material.dart';
import 'package:profile_finder/core/utils/size_utils.dart';
import 'package:profile_finder/presentation/1ProfileFinder/PrivateInvestigator/WhereIsTheSanFourtyThreeScreen.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/CustomWidgets.dart';

class AnswerFourtyTwoScreen extends StatelessWidget {
  const AnswerFourtyTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: const ClAppbarLeadGridSuffHeart(testingNextPage:  WhereIsTheSanFourtyThreeScreen()),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Answer',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: DeviceSize.itemHeight / 10,
              ),
              const Text(
                'Question',
                style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
               SizedBox(
                height: DeviceSize.itemHeight / 50,
              ),
              const Text(
                'where is the San Sebastian home? and she completed here graduation?',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
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
                height: DeviceSize.itemHeight / 50,
              ),
              const Text(
                'Yes sir, she completed here graduation last year and her home is same place as her mentioned in her profile.',
                style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    fontSize: 15),
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
            backgroundColor: Colors.transparent,
            // gradient: LinearGradient(
            //     begin: Alignment(0, 0.56),
            //     end: Alignment(1, 0.56),
            //     colors: [ColorConstant.indigo500, ColorConstant.purpleA100]),
            child: const Text(
              'Cancel',
            )),
      ),
    );
  }
}

// gradient: LinearGradient(begin: Alignment(0, 0.56), end: Alignment(1, 0.56), colors: [
//                                                                                 ColorConstant.indigo500,
//                                                                                 ColorConstant.purpleA100
//                                                                               ])
