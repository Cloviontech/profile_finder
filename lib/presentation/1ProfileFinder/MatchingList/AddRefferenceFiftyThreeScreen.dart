import 'package:flutter/material.dart';
import 'package:profile_finder/core/utils/size_utils.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/WidgetTitleAndDropdown.dart';

class AddRefferenceFiftyThreeScreen extends StatefulWidget {
  const AddRefferenceFiftyThreeScreen({super.key});

  @override
  State<AddRefferenceFiftyThreeScreen> createState() =>
      _AddRefferenceFiftyThreeScreenState();
}

class _AddRefferenceFiftyThreeScreenState
    extends State<AddRefferenceFiftyThreeScreen> {
  List<String> Dbditems = ["Yes", "No"];

  List<String> firstPriority = ["Fair", "Rich", "Education"];

  late String maritalStatusPreff;
  late String physicalStatusPreff;
  late String familyStatusPreff;
  late String ageGroupPreff;
  late String higherEducationPreff;

  late bool? workingPreff;

  List<String> maritalStatus = [
    "Unmarried",
    "Married",
    "Diverse",
    "Widow",
  ];

  List<String> physicalStatus = [
    "Normal",
    "Difficult",
  ];

  List<String> familyStatus = [
    "Small",
    "Big",
  ];

  // List<String> _myInterest = [
  //   "Music",
  //   "Travel",
  //   "Gaming",
  //   "Reading",
  //   "Photography",
  //   "Writing",
  //   "Paint or drawing"
  //       "Singing",
  //   "Dancer",
  //   "Movies",
  //   "Swimming",
  //   "Artist",
  // ];

  // List<String> _myNonInterest = [
  //   "Music",
  //   "Travel",
  //   "Gaming",
  //   "Reading",
  //   "Photography",
  //   "Writing",
  //   "Paint or drawing",
  //   "Singing",
  //   "Dancer",
  //   "Movies",
  //   "Swimming",
  //   "Artist",
  // ];

  // List<String> _complexion = [
  //   "Dark",
  //   "Medium",
  //   "Moderate Fair",
  //   "Fair",
  //   "Very Fair",
  // ];

  // List<String> _foodTaste = [
  //   "Sweet",
  //   "Bitter",
  //   "Umami",
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: DeviceSize.itemHeight / 4,
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
                  title: Center(
                    child: Text(
                      'Add Prefference',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  horizontalTitleGap: 0,
                  minLeadingWidth: 0,
                ),
                SizedBox(
                  height: DeviceSize.itemHeight / 10,
                ),
                // WidgetTitleAndDropdown(
                //     DdbTitle: 'First Priority Of Prefference*',
                //     DdbHint: 'Select',
                //     DbdItems: firstPriority,
                //     onChanged: (value) {
                //       setState(() {
                //         firstPriorityPreff = value;
                //       });
                //     }),
                WidgetTitleAndDropdown(
                    DdbTitle: 'Marital Status*',
                    DdbHint: 'Select',
                    DbdItems: maritalStatus,
                    onChanged: (value) {
                      setState(() {
                        maritalStatusPreff = value;
                      });
                    }),
                WidgetTitleAndDropdown(
                    DdbTitle: 'Physical & Mental Status*',
                    DdbHint: 'Select',
                    DbdItems: physicalStatus,
                    onChanged: (value) {
                      setState(() {
                        physicalStatusPreff = value;
                      });
                    }),
                WidgetTitleAndDropdown(
                    DdbTitle: 'Email*',
                    DdbHint: 'Select',
                    DbdItems: Dbditems,
                    onChanged: (value) {}),
                WidgetTitleAndDropdown(
                    DdbTitle: 'Family Status*',
                    DdbHint: 'Select',
                    DbdItems: familyStatus,
                    onChanged: (value) {
                      setState(() {
                        familyStatusPreff = value;
                      });
                    }),
                WidgetTitleAndDropdown(
                    DdbTitle: 'Age Group*',
                    DdbHint: 'Select',
                    DbdItems: familyStatus,
                    onChanged: (value) {
                      setState(() {
                        ageGroupPreff = value;
                      });
                    }),
                WidgetTitleAndDropdown(
                    DdbTitle: 'Higher Education*',
                    DdbHint: 'Select',
                    DbdItems: familyStatus,
                    onChanged: (value) {
                      setState(() {
                        higherEducationPreff = value;
                      });
                    }),
                Text(
                  'Working Now?',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: DeviceSize.itemHeight / 13),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text('Yes'),
                        value: true,
                        onChanged: ((value) {
                          setState(() {
                            workingPreff = value;
                          });
                        }),
                      ),
                    ),
                    Expanded(
                      child: CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text('Non'),
                        value: false,
                        onChanged: ((value) {
                          setState(() {
                            workingPreff = value;
                          });
                        }),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: DeviceSize.itemHeight / 10,
                ),
                // Text(
                //   'Your Interest?',
                //   style: TextStyle(
                //       fontWeight: FontWeight.bold,
                //       fontSize: DeviceSize.itemHeight / 13),
                // ),
                // SizedBox(
                //   height: DeviceSize.itemHeight / 100,
                // ),
                // Text(
                //   'Choose the closest one from the List.',
                //   style: TextStyle(
                //       // fontWeight: FontWeight.bold,
                //       fontSize: DeviceSize.itemHeight / 15),
                // ),
                // SizedBox(
                //   height: DeviceSize.itemHeight / 10,
                // ),
                // TagSimpleFont15WidgetCustomCl(myInterest: _myInterest),
                // SizedBox(
                //   height: DeviceSize.itemHeight / 10,
                // ),
                // Text(
                //   'Non Interest?',
                //   style: TextStyle(
                //       fontWeight: FontWeight.bold,
                //       fontSize: DeviceSize.itemHeight / 13),
                // ),
                // SizedBox(
                //   height: DeviceSize.itemHeight / 100,
                // ),
                // Text(
                //   'Choose the closest one from the List.',
                //   style: TextStyle(
                //       // fontWeight: FontWeight.bold,
                //       fontSize: DeviceSize.itemHeight / 15),
                // ),
                // SizedBox(
                //   height: DeviceSize.itemHeight / 10,
                // ),
                // TagSimpleFont15WidgetCustomCl(myInterest: _myNonInterest),
                // SizedBox(
                //   height: DeviceSize.itemHeight / 10,
                // ),
                // Text(
                //   'Complexion',
                //   style: TextStyle(
                //       fontWeight: FontWeight.bold,
                //       fontSize: DeviceSize.itemHeight / 13),
                // ),
                // SizedBox(
                //   height: DeviceSize.itemHeight / 100,
                // ),
                // Text(
                //   'Choose the closest one from the List.',
                //   style: TextStyle(
                //       // fontWeight: FontWeight.bold,
                //       fontSize: DeviceSize.itemHeight / 15),
                // ),
                // SizedBox(
                //   height: DeviceSize.itemHeight / 10,
                // ),
                // TagSimpleFont15WidgetCustomCl(myInterest: _complexion),
                // SizedBox(
                //   height: DeviceSize.itemHeight / 5,
                // ),
                // Text(
                //   'Food Taste',
                //   style: TextStyle(
                //       fontWeight: FontWeight.bold,
                //       fontSize: DeviceSize.itemHeight / 13),
                // ),
                // SizedBox(
                //   height: DeviceSize.itemHeight / 100,
                // ),
                // Text(
                //   'What is the opinion of your daily diet plan after marriage',
                //   style: TextStyle(
                //       // fontWeight: FontWeight.bold,
                //       fontSize: DeviceSize.itemHeight / 15),
                // ),
                // SizedBox(
                //   height: DeviceSize.itemHeight / 50,
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Row(
                //       // mainAxisAlignment: MainAxisAlignment.values.first,
                //       children: [
                //         Radio(
                //             value: true,
                //             groupValue: true,
                //             onChanged: (value) {}),
                //         Text(
                //           'Veg',
                //           style: TextStyle(
                //             color: Colors.black54,
                //             letterSpacing: 0.7,
                //             fontSize: DeviceSize.itemHeight / 13,
                //             fontWeight: FontWeight.bold,
                //           ),
                //         ),
                //       ],
                //     ),
                //     Row(
                //       children: [
                //         Radio(
                //             value: true,
                //             groupValue: true,
                //             onChanged: (value) {}),
                //         Text(
                //           'Non-veg',
                //           style: TextStyle(
                //             color: Colors.black54,
                //             letterSpacing: 0.7,
                //             fontSize: DeviceSize.itemHeight / 13,
                //             fontWeight: FontWeight.bold,
                //           ),
                //         ),
                //       ],
                //     ),
                //     Row(
                //       children: [
                //         Radio(
                //             value: true,
                //             groupValue: true,
                //             onChanged: (value) {}),
                //         Text(
                //           'Both',
                //           style: TextStyle(
                //             color: Colors.black54,
                //             letterSpacing: 0.7,
                //             fontSize: DeviceSize.itemHeight / 13,
                //             fontWeight: FontWeight.bold,
                //           ),
                //         ),
                //       ],
                //     ),
                //   ],
                // ),
                // SizedBox(
                //   height: DeviceSize.itemHeight / 100,
                // ),
                // TagSimpleFont15WidgetCustomCl(myInterest: _foodTaste),
                // SizedBox(
                //   height: DeviceSize.itemHeight / 10,
                // ),
                // Container(
                //   height: DeviceSize.itemHeight / 1.8,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(10),
                //     // color: ColorConstant.clPurple05,
                //     gradient: LinearGradient(
                //       begin: Alignment(0, -1),
                //       end: Alignment(0, 1),
                //       colors: [
                //         ColorConstant.clPurple05,
                //         ColorConstant.clPurple05,
                //         ColorConstant.whiteA700,
                //       ],
                //       // transform: GradientRotation(
                //       //   0.15,
                //       // ),
                //     ),
                //   ),
                //   child: Padding(
                //     padding: const EdgeInsets.all(10),
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Text(
                //           'Can you Able To Cook?',
                //           style: TextStyle(
                //               color: ColorConstant.clFontDarkBlueColor,
                //               fontWeight: FontWeight.bold,
                //               fontSize: DeviceSize.itemHeight / 15),
                //         ),
                //         Row(
                //           mainAxisAlignment: MainAxisAlignment.start,
                //           children: [
                //             Row(
                //               children: [
                //                 Radio(
                //                     value: true,
                //                     groupValue: true,
                //                     onChanged: (value) {}),
                //                 Text(
                //                   'Yes',
                //                   style: TextStyle(
                //                     color: Colors.black,
                //                     fontSize: DeviceSize.itemHeight / 13,
                //                   ),
                //                 ),
                //               ],
                //             ),
                //             Row(
                //               children: [
                //                 Radio(
                //                     value: true,
                //                     groupValue: true,
                //                     onChanged: (value) {}),
                //                 Text(
                //                   'Non',
                //                   style: TextStyle(
                //                     color: Colors.black,
                //                     fontSize: DeviceSize.itemHeight / 13,
                //                   ),
                //                 ),
                //               ],
                //             ),
                //           ],
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: DeviceSize.itemHeight / 10,
                // ),
                // Container(
                //   height: DeviceSize.itemHeight / 1.8,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(10),
                //     // color: ColorConstant.clPurple05,
                //     gradient: LinearGradient(
                //       begin: Alignment(0, -1),
                //       end: Alignment(0, 1),
                //       colors: [
                //         ColorConstant.clPurple05,
                //         ColorConstant.clPurple05,
                //         ColorConstant.whiteA700,
                //       ],
                //       // transform: GradientRotation(
                //       //   0.15,
                //       // ),
                //     ),
                //   ),
                //   child: Padding(
                //     padding: const EdgeInsets.all(10),
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Text(
                //           'Re You Willing To Marry Orphan?',
                //           style: TextStyle(
                //               color: ColorConstant.clFontDarkBlueColor,
                //               fontWeight: FontWeight.bold,
                //               fontSize: DeviceSize.itemHeight / 15),
                //         ),
                //         Row(
                //           mainAxisAlignment: MainAxisAlignment.start,
                //           children: [
                //             Row(
                //               children: [
                //                 Radio(
                //                     value: true,
                //                     groupValue: true,
                //                     onChanged: (value) {}),
                //                 Text(
                //                   'Yes',
                //                   style: TextStyle(
                //                     color: Colors.black,
                //                     fontSize: DeviceSize.itemHeight / 13,
                //                   ),
                //                 ),
                //               ],
                //             ),
                //             Row(
                //               children: [
                //                 Radio(
                //                     value: true,
                //                     groupValue: true,
                //                     onChanged: (value) {}),
                //                 Text(
                //                   'Non',
                //                   style: TextStyle(
                //                     color: Colors.black,
                //                     fontSize: DeviceSize.itemHeight / 13,
                //                   ),
                //                 ),
                //               ],
                //             ),
                //   ],
                // ),
                //   ],
                // ),
                //   ),
                // ),
                // SizedBox(
                //   height: DeviceSize.itemHeight / 4,
                // ),
              ]),
        ),
      ),
    );
  }
}
