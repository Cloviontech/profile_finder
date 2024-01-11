import 'package:flutter/material.dart';
import 'package:profile_finder/core/utils/size_utils.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/CustomWidgets.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/WidgetTitleAndDropdown.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/WidgetTitleAndTextfield.dart';

class ReferAFriendFourtySeven2Screen extends StatelessWidget {
  const ReferAFriendFourtySeven2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ClAppbarLeadGridSuffHeart(
          testingNextPage: ReferAFriendFourtySeven2Screen()),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: DeviceSize.itemHeight / 10,
              ),
              const Text(
                'Refer a friend',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: DeviceSize.itemHeight / 5,
              ),
              WidgetTitleAndTextfield(
                  textFieldTitle: 'First Name*',
                  textFieldHint: 'Enter',
                  onChanged: (value) {}),
              WidgetTitleAndTextfield(
                  textFieldTitle: 'Email*',
                  textFieldHint: 'Enter',
                  onChanged: (value) {}),
              WidgetTitleAndTextfield(
                  textFieldTitle: 'Phone Number*',
                  textFieldHint: 'Enter',
                  onChanged: (value) {}),
              const WidgetTitleAndDropdown(
                DbdItems: [],
                DdbHint: '',
                DdbTitle: 'Gender*',
                onChanged: null,
              ),
              //
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
            child: const Text(
              'Submit',
            )),
      ),
    );
  }
}
