import 'package:flutter/material.dart';
import 'package:profile_finder/core/utils/size_utils.dart';
import 'package:profile_finder/presentation/1ProfileFinder/PrivateInvestigator/PaymentOfInvestigatorFourtyScreen.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/CustomClAll.dart';

class TaskCompleteThirtyNineScreen extends StatefulWidget {
  const TaskCompleteThirtyNineScreen({super.key});

  @override
  State<TaskCompleteThirtyNineScreen> createState() => _TaskCompleteThirtyNineScreenState();
}

class _TaskCompleteThirtyNineScreenState extends State<TaskCompleteThirtyNineScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar:  ClAppbarLeadGridSuffHeart(testingNextPage:  PaymentOfInvestigatorFourtyScreen(private_investicator_id: '',)),

      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(children:  [
          ClProfilePictureWithCoverWithLinearPercentIndicator(itemHeight: DeviceSize.itemHeight, 
                profilePicturepath: 'assets/images/img_ellipse76.png', 
                coverPicturepath: 'assets/images/img_rectangle690.png', 
                name: 'Ariene McCoy', place: 'Dubai, United Arab Emirates', percentage: 45,),

        ClProfilePictureWithCoverWithLinearPercentIndicator(itemHeight: DeviceSize.itemHeight,  percentage: 65,
        profilePicturepath: 'assets/images/img_ellipse77.png', 
                coverPicturepath: 'assets/images/img_rectangle692.png', 
        ),
        ClProfilePictureWithCoverWithLinearPercentIndicator(itemHeight: DeviceSize.itemHeight,  percentage: 90,
        profilePicturepath: 'assets/images/img_ellipse78.png', 
                coverPicturepath: 'assets/images/img_rectangle694.png', 
        ),
        



       

        ],),
        ),
      ),

    );
  }
}