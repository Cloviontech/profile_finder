import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:profile_finder/core/utils/color_constant.dart';
import 'package:profile_finder/model_final/model_final.dart';
import 'package:profile_finder/presentation/1ProfileFinder/MatchingList/1screen_advertisement.dart';
import 'package:profile_finder/presentation/1ProfileFinder/Profile/17screenContactDetails.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/CustomWidgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_tags/simple_tags.dart';
import 'package:http/http.dart' as http;

class TwentyFiveMyNonInterest extends StatefulWidget {
  const TwentyFiveMyNonInterest({super.key});

  @override
  State<TwentyFiveMyNonInterest> createState() =>
      _TwentyFiveMyNonInterestState();
}

class _TwentyFiveMyNonInterestState extends State<TwentyFiveMyNonInterest> {
  static const String _title = "My Non-Interest";

  bool _editButtonClicked = false;

  bool _addMorebuttonClicked = false;

  static Users _users = Users();

  bool _isLoading = true;

  late String _uidUser;

  Future _updateDetails() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    _uidUser = preferences.getString("uid2").toString();

    final url =
        Uri.parse("http://${ApiService.ipAddress}/about_candidate/JJ30LIE1RVQ");
    final request = http.MultipartRequest('POST', url);

    for (String item in _myNonInterestSelected) {
      request.files.add(http.MultipartFile.fromString('non_intrest', item));
    }

    try {
      final send = await request.send();
      final response = await http.Response.fromStream(send);

      if (response.statusCode == 200) {
        Fluttertoast.showToast(
          msg: "My Non-Interest Details Updated Successfully...!",
          backgroundColor: ColorConstant.deepPurpleA200,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_SHORT,
        );
      }
    } catch (e) {
      // print("Error While Uploading$e");
    }
  }

  List<String> _removeCommaSibName = [""];

  _getDataFromServer() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    _uidUser = preferences.getString("uid2").toString();
    final response = await http
        .get(Uri.parse("http://${ApiService.ipAddress}/alldata/JJ30LIE1RVQ"));
    var json = await jsonDecode(response.body);

    Map<String, dynamic> des = jsonDecode(response.body);

    if (response.statusCode == 200) {
      setState(() {
        _users = Users.fromJson(json);

        String out = des["non_intrest"].replaceAll("[", "");
        String out1 = out.replaceAll("]", "");
        String out2 = out1.replaceAll(' ', "");
        String out3 = out2.replaceAll("'", "");

        _myNonInterestSelected = out3.split(",");
      });

      setState(() {
        _isLoading = false;
      });
    } else {}
  }

  @override
  void initState() {
    _getDataFromServer();
    super.initState();
  }

  List<String> _namelist = [];

  TextEditingController _nameController = TextEditingController();

  addMoreSiblings(context) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(child: Text("Add More")),
          content: SizedBox(
            height: 120,
            width: 200,
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
                    controller: _nameController,
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: InputBorder.none,
                        hintText: "Enter the Name of Non-Interest"),
                  ),
                ),
                D10HCustomClSizedBoxWidget(),
                MyElevatedButton(
                    borderRadius: BorderRadius.circular(8),
                    height: 45,
                    onPressed: () async {
                      setState(() async {
                        // _listModelSibling.data.add(Siblingmodel(
                        //     sibling_namedit: nameController.text,
                        //     sibling_relation: relationController.text,
                        //     sibling_occupation: jobController.text));
                        _myNonInterest.add(_nameController.text); //
                        _updateDetails();
                        _getDataFromServer();

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

  List<String> _myNonInterest = [
    "Music",
    "Travel",
    "Gaming",
    "Reading",
    "Photography",
    "Writing",
    "Painting or drawing",
    "Singing",
    "Dancer",
    "Movies",
    "Swimming",
    "Artist",
  ];

  List<String> _myNonInterestSelected = [];

  List<String> _myNonInterestInitial = [
    "Music",
    "Travel",
    "Gaming",
  ];

  List<int> _value = [];

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
                      Text(
                        _editButtonClicked ? "Edit My Interest" : _title,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                      const D10HCustomClSizedBoxWidget(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _editButtonClicked
                              ? Wrap(
                                  children: List.generate(
                                    _myNonInterest.length,
                                    (int index) {
                                      // choice chip allow us to
                                      // set its properties.
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(right: 5),
                                        child: ChoiceChip(
                                          padding: EdgeInsets.all(8),
                                          label: Text(
                                            _myNonInterest[index],
                                            style: TextStyle(
                                                color: _myNonInterestSelected
                                                        .contains(
                                                            _myNonInterest[
                                                                index])
                                                    ? ColorConstant
                                                        .deepPurpleA200
                                                    : null),
                                          ),
                                          backgroundColor: Colors.white,
                                          selectedColor: Colors.white,
                                          side: BorderSide(
                                              color: _myNonInterestSelected
                                                      .contains(
                                                          _myNonInterest[index])
                                                  ? ColorConstant.deepPurpleA200
                                                  : Colors.grey.shade400),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          // color of selected chip
                                          // selectedColor: Colors.green,
                                          // selected chip value
                                          selected: _value.contains(index),
                                          // onselected method
                                          onSelected: (bool selected) {
                                            setState(() {
                                              //  selected ? _value.add(index) : null;
                                              _value.contains(index)
                                                  ? _value.remove(index)
                                                  : _value.add(index);
                                              _myNonInterestSelected.contains(
                                                      _myNonInterest[index])
                                                  ? _myNonInterestSelected
                                                      .remove(
                                                          _myNonInterest[index])
                                                  : _myNonInterestSelected.add(
                                                      _myNonInterest[index]);
                                            });
                                          },
                                        ),
                                      );
                                    },
                                  ).toList(),
                                )
                              : SimpleTags(
                                  content:
                                      //  _editButtonClicked
                                      //     ? _myNonInterest
                                      // :
                                      //  _removeCommaSibName.length == 0 ?
                                      //  _myNonInterestInitial
                                      //  :
                                      _myNonInterestSelected,
                                  wrapSpacing: 20,
                                  wrapRunSpacing: 10,
                                  tagContainerPadding: EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 15),
                                  tagTextStyle: TextStyle(
                                      color: Colors.black, fontSize: 13),
                                  tagContainerDecoration: BoxDecoration(
                                    color: Colors.white,
                                    border:
                                        Border.all(color: Colors.grey.shade100),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            Color.fromRGBO(139, 139, 142, 0.16),
                                        spreadRadius: 1,
                                        blurRadius: 1,
                                        offset: Offset(1.75, 3.5), // c
                                      )
                                    ],
                                  ),
                                ),
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
                _editButtonClicked
                    ? MyElevatedButton(
                        onPressed: () async {
                          setState(() {
                            _addMorebuttonClicked = !_addMorebuttonClicked;
                            // isLoading = true;
                          });
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
                              : _myNonInterestSelected.length == 0
                                  ? "Add"
                                  : "Add More",
                          style: TextStyle(color: ColorConstant.deepPurpleA200),
                        ),
                      )
                    : const SizedBox(),
                const SizedBox(
                  height: 8,
                ),
                // _myNonInterestSelected.length == 0 ? SizedBox() :
                MyElevatedButton(
                  onPressed: () async {
                    setState(() {
                      _editButtonClicked = !_editButtonClicked;
                      // isLoading = true;
                    });
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
