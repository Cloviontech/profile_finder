import 'package:flutter/material.dart';
import 'package:profile_finder/core/utils/color_constant.dart';
import 'package:profile_finder/core/utils/size_utils.dart';
import 'package:profile_finder/presentation/1ProfileFinder/PrivateInvestigator/CloseAndRateFourtyFourScreen.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/CustomWidgets.dart';

class WhereIsTheSanFourtyThreeScreen extends StatelessWidget {
  const WhereIsTheSanFourtyThreeScreen({super.key});

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
              const Text(
                'who is her best friend?',
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
                height: DeviceSize.itemHeight / 10,
              ),
              const Text(
                'Yes sir, she completed here graduation last year and her home is same place as her mentioned in her profile.',
                style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    fontSize: 18),
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
              Container(
                width: 150.0,
                height: 150.0,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/img_rectangle715.png')),
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  color: Colors.redAccent,
                ),
              ),
              SizedBox(
                height: DeviceSize.itemHeight / 10,
              ),
              Container(
                height: 50,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorConstant.clContainerFilledColorgrey),
              )
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
