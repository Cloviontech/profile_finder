import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:profile_finder/core/utils/color_constant.dart';
import 'package:profile_finder/model_final/model_final.dart';
import 'package:profile_finder/model_final/model_sibling/list_model_sibling.dart';
import 'package:profile_finder/model_final/model_sibling/model_sibling.dart';
import 'package:profile_finder/presentation/1ProfileFinder/MatchingList/1screen_advertisement.dart';
import 'package:profile_finder/presentation/1ProfileFinder/Profile/17screenContactDetails.dart';
import 'package:profile_finder/presentation/1ProfileFinder/Profile/21screenSiblingsDetails.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/CustomWidgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class TwentyThreeWorkExperience extends StatefulWidget {
  @override
  State<TwentyThreeWorkExperience> createState() =>
      _TwentyThreeWorkExperienceState();
}

class _TwentyThreeWorkExperienceState extends State<TwentyThreeWorkExperience> {
  static const String _title = "Work Experience";

  bool _editButtonClicked = false;

  bool _addMorebuttonClicked = false;

  ListModelSibling _listModelSibling = ListModelSibling([]);

  static Users _users = Users();

  bool _isLoading = true;

  late String _uidUser;

  Future _updateDetails() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    _uidUser = preferences.getString("uid2").toString();

    print("uid for Update $_uidUser ");

    final url =
        Uri.parse("http://${ApiService.ipAddress}/about_candidate/JJ30LIE1RVQ");
    final request = http.MultipartRequest('POST', url);

    for (String item in removeCommaSibName) {
      request.files
          .add(http.MultipartFile.fromString('company_nameedit', item));
    }

    for (String item in removeCommaSibRelation) {
      request.files.add(http.MultipartFile.fromString('position', item));
    }
    for (String item in removeCommaSibOccupation) {
      request.files.add(http.MultipartFile.fromString('salary_range', item));
    }

    try {
      final send = await request.send();
      final response = await http.Response.fromStream(send);
      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        Fluttertoast.showToast(
          msg: "Work Details Updated Successfully...!",
          backgroundColor: ColorConstant.deepPurpleA200,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_SHORT,
        );
      }
    } catch (e) {
      // print("Error While Uploading$e");
    }
  }

  List<String> removeCommaSibName = [""];

  List<String> removeCommaSibRelation = [""];

  List<String> removeCommaSibOccupation = [""];

  _getDataFromServer() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    _uidUser = preferences.getString("uid2").toString();
    final response = await http
        .get(Uri.parse("http://${ApiService.ipAddress}/alldata/JJ30LIE1RVQ"));
    var json = await jsonDecode(response.body);

    print("statusCodeIs ${response.statusCode}");

    Map<String, dynamic> des = jsonDecode(response.body);

    if (response.statusCode == 200) {
      setState(() {
        _users = Users.fromJson(json);

        String out = des["company_name"].replaceAll("[", "");
        String out1 = out.replaceAll("]", "");
        String out2 = out1.replaceAll(' ', "");
        String out3 = out2.replaceAll("'", "");

        removeCommaSibName = out3.split(",");

        out = des["position"].replaceAll("[", "");
        out1 = out.replaceAll("]", "");
        out2 = out1.replaceAll(' ', "");
        out3 = out2.replaceAll("'", "");

        removeCommaSibRelation = out3.split(",");

        out = des["salary_range"].replaceAll("[", "");
        out1 = out.replaceAll("]", "");
        out2 = out1.replaceAll(' ', "");
        out3 = out2.replaceAll("'", "");

        removeCommaSibOccupation = out3.split(",");
      });

      // print(response.body);
      // print("Siblings Details Retrieved");
      setState(() {
        _isLoading = false;
      });
    } else {
      print("error");
      // print(response.statusCode);
    }
  }

  @override
  void initState() {
    _getDataFromServer();
    _listModelSibling.data = <Siblingmodel>[];

    super.initState();
  }

  List<String> namelist = [];

  List<String> relationlist = [];

  List<String> joblist = [];

  TextEditingController nameController = TextEditingController();

  TextEditingController relationController = TextEditingController();

  TextEditingController jobController = TextEditingController();

  addMoreSiblings(context) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(child: Text("Add More")),
          content: SizedBox(
            height: 300,
            width: 300,
            child: Column(
              children: [
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(8)),
                  child: TextFormField(
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                    controller: nameController,
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: InputBorder.none,
                        hintText: "Enter Name Of Company"),
                  ),
                ),
                const D10HCustomClSizedBoxWidget(),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(8)),
                  child: TextFormField(
                    controller: relationController,
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: InputBorder.none,
                        hintText: "Enter the Name Of Position"),
                  ),
                ),
                const D10HCustomClSizedBoxWidget(),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(8)),
                  child: TextFormField(
                    controller: jobController,
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: InputBorder.none,
                        hintText: "Enter the Tenure(Month)"),
                  ),
                ),
                D10HCustomClSizedBoxWidget(),
                MyElevatedButton(
                    borderRadius: BorderRadius.circular(8),
                    height: 45,
                    onPressed: () {
                      setState(() {
                        // _listModelSibling.data.add(Siblingmodel(
                        //     sibling_namedit: nameController.text,
                        //     sibling_relation: relationController.text,
                        //     sibling_occupation: jobController.text));
                        removeCommaSibName.add(nameController.text);
                        removeCommaSibRelation.add(relationController.text);
                        removeCommaSibOccupation.add(jobController.text);
                        //
                        _updateDetails();

                        Navigator.pop(context);
                        _addMorebuttonClicked = false;
                      });
                    },
                    child: const Text("Submit"))
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        appBar: ClAppbarLeadGridSuffHeart(
            testingNextPage: SeventeenContactDetails()),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        _title,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                      const D10HCustomClSizedBoxWidget(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              // itemCount: _sharedPreffId.length ,
                              // itemCount: _listModelSibling.data.length,
                              // itemCount: _listModelSibling.data.length,
                              itemCount: removeCommaSibName.length,
                              itemBuilder: ((context, index) {
                                return _editButtonClicked
                                    ? Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text((index + 1).toString()),
                                          D10HCustomClSizedBoxWidget(
                                            height: 80,
                                          ),
                                          Text("Company Name"),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                                color: Colors.grey.shade100,
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            child: TextFormField(
                                              initialValue:
                                                  removeCommaSibName[index],
                                              style: const TextStyle(
                                                fontSize: 15,
                                              ),
                                              onChanged: (value) {
                                                setState(() async {
                                                  removeCommaSibName[index] =
                                                      value;
                                                });
                                              },
                                              decoration: const InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.all(10),
                                                  border: InputBorder.none,
                                                  hintText: "Enter"),
                                            ),
                                          ),
                                          const D10HCustomClSizedBoxWidget(),
                                          const Text("Position"),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Container(
                                            // height: DeviceSize.screenHeight - 150,
                                            decoration: BoxDecoration(
                                                color: Colors.grey.shade100,
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            child: TextFormField(
                                              initialValue:
                                                  removeCommaSibRelation[index],
                                              style: const TextStyle(
                                                fontSize: 15,
                                              ),
                                              onChanged: (value) {
                                                setState(() async {
                                                  // _listModelSibling.data[widget.index].sibling_relation = value;
                                                  removeCommaSibRelation[
                                                      index] = value;
                                                });
                                              },
                                              decoration: const InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.all(10),
                                                  border: InputBorder.none,
                                                  hintText: "Enter"),
                                            ),
                                          ),
                                          const D10HCustomClSizedBoxWidget(),
                                          const Text("Tenure(Month)"),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Container(
                                            // height: DeviceSize.screenHeight - 150,
                                            decoration: BoxDecoration(
                                                color: Colors.grey.shade100,
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            child: TextFormField(
                                              initialValue:
                                                  removeCommaSibOccupation[
                                                      index],
                                              style: const TextStyle(
                                                fontSize: 15,
                                              ),
                                              onChanged: (value) {
                                                setState(() async {
                                                  // _listModelSibling.data[widget.index].sibling_occupation = value;
                                                  removeCommaSibOccupation[
                                                      index] = value;
                                                });
                                              },
                                              decoration: const InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.all(10),
                                                  border: InputBorder.none,
                                                  hintText: "Enter"),
                                            ),
                                          ),
                                          const D10HCustomClSizedBoxWidget(),
                                          Divider(),
                                        ],
                                      )
                                    : Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          D10HCustomClSizedBoxWidget(),
                                          Text((index + 1).toString()),
                                          D10HCustomClSizedBoxWidget(
                                            height: 100,
                                          ),
                                          Divider(),
                                          ListViewTwoTextLineAndUnderlineNoButtonClickedWidgetCl(
                                            job:
                                                removeCommaSibOccupation[index],
                                            name: removeCommaSibName[index],
                                            relation:
                                                removeCommaSibRelation[index],
                                            title1: "Company Name",
                                            title2: "Position",
                                            title3: "Tenure(Month)",
                                          ),
                                        ],
                                      );
                              })),
                          const D10HCustomClSizedBoxWidget(
                            height: 50,
                          ),
                        ],
                      ),
                    ],
                  ),
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: 150,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyElevatedButton(
                  onPressed: () async {
                    setState(() {
                      _addMorebuttonClicked = !_addMorebuttonClicked;
                      // isLoading = true;
                    });
                    print("Button $_addMorebuttonClicked");
                    if (_addMorebuttonClicked == false) {
                      // _updateDetails();
                    }
                    addMoreSiblings(context);
                  },
                  borderRadius: BorderRadius.circular(10),
                  backgroundColor: Colors.white,
                  width: double.maxFinite,
                  child: Text(
                    _addMorebuttonClicked
                        ? "Add More"
                        : removeCommaSibName.length == 0
                            ? "Add"
                            : "Add More",
                    style: TextStyle(color: ColorConstant.deepPurpleA200),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                MyElevatedButton(
                  onPressed: () async {
                    setState(() {
                      _editButtonClicked = !_editButtonClicked;
                      // isLoading = true;
                    });
                    print("Button $_editButtonClicked");
                    if (_editButtonClicked == false) {
                      _updateDetails();
                    }
                  },
                  borderRadius: BorderRadius.circular(10),
                  backgroundColor: Colors.transparent,
                  width: double.maxFinite,
                  child: Text(
                    _editButtonClicked ? "Update" : "Edit",
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

/*
*/
