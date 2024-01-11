import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:profile_finder/core/utils/color_constant.dart';
import 'package:profile_finder/model_final/model_final.dart';
import 'package:profile_finder/model_final/model_sibling/list_model_sibling.dart';
import 'package:profile_finder/model_final/model_sibling/model_sibling.dart';
import 'package:profile_finder/presentation/1ProfileFinder/MatchingList/1screen_advertisement.dart';
import 'package:profile_finder/presentation/1ProfileFinder/Profile/17screenContactDetails.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/CustomWidgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class TwentyOneSiblingsDetails extends StatefulWidget {
  const TwentyOneSiblingsDetails({super.key});

  @override
  State<TwentyOneSiblingsDetails> createState() =>
      _TwentyOneSiblingsDetailsState();
}

class _TwentyOneSiblingsDetailsState extends State<TwentyOneSiblingsDetails> {
  static const String _title = "Sibling's Details";

  bool _editButtonClicked = false;
  bool _addMorebuttonClicked = false;

  static Users _users = Users();

  ListModelSibling _listModelSibling = ListModelSibling([]);

  bool isLoading = true;

  late String uidUser;

  Future _updateDetails() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    uidUser = preferences.getString("uid2").toString();

    print("uid for Update $uidUser ");

    final url =
        Uri.parse("http://${ApiService.ipAddress}/about_candidate/JJ30LIE1RVQ");
    final request = http.MultipartRequest('POST', url);

//     List<String> sibling_nameedit = ['xx', 'yy', 'zz'];
// for (String item in sibling_nameedit) {
//     request.files.add(http.MultipartFile.fromString('sibling_nameedit', item));

// }
// List<String> sibling_relation = ['xx', 'yy', 'zz'];
// for (String item in sibling_relation) {
//     request.files.add(http.MultipartFile.fromString('sibling_relation', item));

// }
// List<String> sibling_occupation = ['xx', 'yy', 'zz'];
// for (String item in sibling_occupation) {
//     request.files.add(http.MultipartFile.fromString('sibling_occupation', item));

// }

    for (String item in removeCommaSibName) {
      request.files
          .add(http.MultipartFile.fromString('sibling_nameedit', item));
    }

    for (String item in removeCommaSibRelation) {
      request.files
          .add(http.MultipartFile.fromString('sibling_relation', item));
    }
    for (String item in removeCommaSibOccupation) {
      request.files
          .add(http.MultipartFile.fromString('sibling_occupation', item));
    }

    // var response = await http.post(url,
    //     // headers: {"Content-type": "application/json"},
    //     headers: {
    //       'Content-type': 'application/json',
    //       'Accept': 'application/json'
    //     },
    //     body: json.encode(_listModelSibling.toJson())
//     body: {
// "sibling_nameedit":["a","a"],
// "sibling_relation":["b","c"],
// "sibling_occupation":["far","u"],

// }

    // );

    // print(response.statusCode);
    // print(response.body);
    //  if (response.statusCode == 200) {
    //     Fluttertoast.showToast(
    //       msg: "Sibling Details Updated Successfully...!",
    //       backgroundColor: ColorConstant.deepPurpleA200,
    //       textColor: Colors.white,
    //       toastLength: Toast.LENGTH_SHORT,
    //     );
    //  }

    // setState(() {
    // request.fields['sibling_nameedit'] =["a","a"];
    //     // preferences.getString(_sharedPreffId[0]).toString();
    // request.fields['sibling_relation'] = ["Hai"],
    //     // preferences.getString(_sharedPreffId[1]).toString();
    // request.fields['sibling_occupation'] = ["Hai"],
    // preferences.getString(_sharedPreffId[2]).toString();
    //  request.fields['sibling_job'] =
    //     preferences.getString(_sharedPreffId[2]).toString();
    // });

    try {
      final send = await request.send();
      final response = await http.Response.fromStream(send);
      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        Fluttertoast.showToast(
          msg: "Sibling Details Updated Successfully...!",
          backgroundColor: ColorConstant.deepPurpleA200,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_SHORT,
        );
        // _getDataFromServer();
        // Navigator.push(context,MaterialPageRoute(builder: (context) =>TwentyFamilyDetails()));
        // Navigator.pushReplacement(context,
        //     MaterialPageRoute(builder: (BuildContext context) => super.widget));
        print("Family Details Updated ${_users.fatherName}");
        // Future.delayed(const Duration(seconds: 10), () {});
        // Navigator.pushNamed(context, AppRoutes.FourteenScreenscr);
      }
    } catch (e) {
      print("Error While Uploading$e");
    }
  }

  List<String> removeCommaSibName = [""];
  List<String> removeCommaSibRelation = [""];
  List<String> removeCommaSibOccupation = [""];

  _getDataFromServer() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    uidUser = preferences.getString("uid2").toString();
    final response = await http
        .get(Uri.parse("http://${ApiService.ipAddress}/alldata/JJ30LIE1RVQ"));
    var json = await jsonDecode(response.body);

    print("statusCodeIs ${response.statusCode}");

    Map<String, dynamic> des = jsonDecode(response.body);
    // List<dynamic> data = des["gallery"];

    // String data = json["gallery"[2]].toString();

    // String out = des["siblingName"].replaceAll("[", "");
    // String out1 = out.replaceAll("]", "");
    // String out2 = out1.replaceAll(' ', "");

    // removeComma = out2.split(",");

    if (response.statusCode == 200) {
      setState(() {
        _users = Users.fromJson(json);
        // removeComma =(des["sibling_name"]);

        String out = des["sibling_name"].replaceAll("[", "");
        String out1 = out.replaceAll("]", "");
        String out2 = out1.replaceAll(' ', "");
        String out3 = out2.replaceAll("'", "");

        removeCommaSibName = out3.split(",");

        out = des["sibling_relation"].replaceAll("[", "");
        out1 = out.replaceAll("]", "");
        out2 = out1.replaceAll(' ', "");
        out3 = out2.replaceAll("'", "");

        removeCommaSibRelation = out3.split(",");

        out = des["sibling_occupation"].replaceAll("[", "");
        out1 = out.replaceAll("]", "");
        out2 = out1.replaceAll(' ', "");
        out3 = out2.replaceAll("'", "");

        removeCommaSibOccupation = out3.split(",");

        // for (var i = 0; i < ; i++) {

        // }
      });

      // Future.delayed(const Duration(seconds: 3)).then((value) => setState(() {
      //       isLoading = false;
      //     }));

      print(response.body);
      print("Siblings Details Retrieved");
      setState(() {
        isLoading = false;
      });
    } else {
      print("error");
      print(response.statusCode);
    }
  }

  @override
  void initState() {
    _getDataFromServer();
    _listModelSibling.data = <Siblingmodel>[];

    super.initState();
  }

  List<dynamic> _modelDatafromApi = [
    _users.siblingName.toString(),
    _users.siblingRelation.toString(),
    // _users.siblingOccupation.toString(),
    _users.siblingJob.toString(),
  ];

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
                        hintText: "Enter Name Of Sibling"),
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
                        hintText: "Enter Relation Of Sibling"),
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
                        hintText: "Enter Job Of Sibling"),
                  ),
                ),
                D10HCustomClSizedBoxWidget(),
                MyElevatedButton(
                    borderRadius: BorderRadius.circular(8),
                    height: 45,
                    onPressed: () {
                      setState(() {
                        _listModelSibling.data.add(Siblingmodel(
                            sibling_namedit: nameController.text,
                            sibling_relation: relationController.text,
                            sibling_occupation: jobController.text));

                        // nameController.text,
                        //  relationController.text,
                        //    jobController.text,
                        namelist.add(nameController.text);
                        relationlist.add(relationController.text);
                        joblist.add(jobController.text);
                        removeCommaSibName.add(nameController.text);
                        removeCommaSibRelation.add(relationController.text);
                        removeCommaSibOccupation.add(jobController.text);
                        //
                        _updateDetails();

                        Navigator.pop(context);
                        _addMorebuttonClicked = false;
                      });
                    },
                    child: Text("Submit"))
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
            child: isLoading
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
                          // ListView.builder(
                          //     shrinkWrap: true,
                          //     itemCount: removeCommaSibName.length,
                          //     itemBuilder: (context, index) {
                          //       return Column(
                          //         children: [
                          //           Text(removeCommaSibName[index]),
                          //           Text(removeCommaSibRelation[index]),
                          //           Text(removeCommaSibOccupation[index]),

                          //           // Text(removeCommaSibName.length.toString()),
                          //         ],
                          //       );
                          //     }),

                          ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              // itemCount: _sharedPreffId.length ,
                              // itemCount: _listModelSibling.data.length,
                              // itemCount: _listModelSibling.data.length,
                              itemCount: removeCommaSibName.length,
                              itemBuilder: ((context, index) {
                                return _editButtonClicked
                                    ?
                                    // TextndTextFormList(
                                    //     iniValueTextForm:
                                    //         _listModelSibling.data![index].siRelation.toString(),
                                    //     name: _titleItems[index],
                                    //     idSharePreff: _sharedPreffId[index],
                                    //   )
                                    ListViewTextndTextFormList(
                                        index: index,
                                        jobController: jobController,
                                        nameController: nameController,
                                        relationController: relationController,
                                        // jobList: _listModelSibling.data[index].sibling_occupation,
                                        // nameList: namelist,
                                        // relationList: relationlist,
                                        name: removeCommaSibName[index],
                                        job: removeCommaSibOccupation[index],
                                        relation: removeCommaSibRelation[index],
                                      )
                                    :

                                    // TwoTextLineAndUnderlineNoButtonClickedWidgetCl(
                                    //     title: _titleItems[index],
                                    //     // cInivalue: _users.fatherCountry.toString(),
                                    //     // cInivalue: _modelDatafromApi[index],
                                    //     cInivalue: _listModelSibling.data![ index].siName.toString(),

                                    //     sharedPreffId: _sharedPreffId[index],
                                    //     userM: _users,
                                    //   );

                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          D10HCustomClSizedBoxWidget(),
                                          Text({index + 1}.toString()),
                                          D10HCustomClSizedBoxWidget(
                                            height: 100,
                                          ),
                                          Divider(),
                                          ListViewTwoTextLineAndUnderlineNoButtonClickedWidgetCl(
                                            // job: _listModelSibling
                                            //     .data[index].sibling_occupation
                                            //     .toString(),
                                            // name: _listModelSibling
                                            //     .data[index].sibling_namedit
                                            //     .toString(),
                                            // relation: _listModelSibling
                                            //     .data[index].sibling_relation
                                            //     .toString(),
                                            job:
                                                removeCommaSibOccupation[index],
                                            name: removeCommaSibName[index],
                                            relation:
                                                removeCommaSibRelation[index],
                                            title1: "Name",
                                            title2: "Relation",
                                            title3: "Occupation",
                                          ),
                                          // D10HCustomClSizedBoxWidget(),
                                        ],
                                      );
                              })),
                          // D10HCustomClSizedBoxWidget(
                          //   height: 0.5,
                          // ),
                          // _addMorebuttonClicked
                          //     ? ListView.builder(
                          //         itemCount: _listModelSibling.data.length,
                          //         shrinkWrap: true,
                          //         itemBuilder: (context, index) {
                          //           return Column(
                          //             children: [
                          //               Column(
                          //                 crossAxisAlignment:
                          //                     CrossAxisAlignment.start,
                          //                 children: [
                          //                   Text(_listModelSibling
                          //                       .data![index].sibling_namedit
                          //                       .toString()),
                          //                   Text(_listModelSibling
                          //                       .data![index].sibling_relation
                          //                       .toString()),
                          //                   Text(_listModelSibling
                          //                       .data![index].sibling_occupation
                          //                       .toString()),
                          //                 ],
                          //               )
                          //             ],
                          //           );
                          //         })
                          //     :

                          // ),
                          // D10HCustomClSizedBoxWidget(),
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

class ListViewTwoTextLineAndUnderlineNoButtonClickedWidgetCl
    extends StatefulWidget {
  const ListViewTwoTextLineAndUnderlineNoButtonClickedWidgetCl({
    super.key,
    required this.name,
    required this.relation,
    required this.job,
    this.title1,
    this.title2,
    this.title3,
  });

  final dynamic name;
  final dynamic relation;
  final dynamic job;
  final String? title1;
  final String? title2;
  final String? title3;

  //  OnChanged onChanged;

  @override
  State<ListViewTwoTextLineAndUnderlineNoButtonClickedWidgetCl> createState() =>
      _ListViewTwoTextLineAndUnderlineNoButtonClickedWidgetClState();
}

class _ListViewTwoTextLineAndUnderlineNoButtonClickedWidgetClState
    extends State<ListViewTwoTextLineAndUnderlineNoButtonClickedWidgetCl> {
  saveToSharedPrefferences(String nameOfID, String valueToSave) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setString(nameOfID, valueToSave);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title1.toString(),
          style: const TextStyle(
            fontSize: 11,
          ),
        ),

        SizedBox(
          height: 3,
        ),

        Text(
          widget.name,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
        ),

        D10HCustomClSizedBoxWidget(
          height: 50,
        ),

        Divider(),
        // widget.buttonclicked ? SizedBox() : Divider(),
        D10HCustomClSizedBoxWidget(
          height: 50,
        ),
        Text(
          widget.title2.toString(),
          style: const TextStyle(
            fontSize: 11,
          ),
        ),

        SizedBox(
          height: 3,
        ),

        Text(
          widget.relation,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
        ),

        D10HCustomClSizedBoxWidget(
          height: 50,
        ),
        Divider(),
        // widget.buttonclicked ? SizedBox() : Divider(),
        D10HCustomClSizedBoxWidget(
          height: 50,
        ),
        Text(
          widget.title3.toString(),
          style: const TextStyle(
            fontSize: 11,
          ),
        ),

        SizedBox(
          height: 3,
        ),

        Text(
          widget.job,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
        ),

        D10HCustomClSizedBoxWidget(
          height: 50,
        ),
        Divider(),
        // widget.buttonclicked ? SizedBox() : Divider(),
        D10HCustomClSizedBoxWidget(
          height: 50,
        ),
      ],
    );
  }
}

class ListViewTextndTextFormList extends StatefulWidget {
  final TextEditingController nameController;
  final TextEditingController relationController;
  final TextEditingController jobController;
  final int index;
  // final List<String> nameList;
  // final List<String> jobList;
  // final List<String> relationList;
  final String name;
  final String job;
  final String relation;

  const ListViewTextndTextFormList({
    super.key,
    required this.nameController,
    required this.relationController,
    required this.jobController,
    required this.index,
    required this.name,
    required this.job,
    required this.relation,
    // required this.nameList,
    // required this.jobList,
    // required this.relationList,
  });

  @override
  State<ListViewTextndTextFormList> createState() =>
      _ListViewTextndTextFormListState();
}

class _ListViewTextndTextFormListState
    extends State<ListViewTextndTextFormList> {
  ListModelSibling _listModelSibling = ListModelSibling([]);

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Divider(),
        Text(widget.index.toString()),
        D10HCustomClSizedBoxWidget(
          height: 80,
        ),
        Text("Name"),
        const SizedBox(
          height: 5,
        ),
        Container(
          // height: DeviceSize.screenHeight - 150,
          decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8)),
          child: TextFormField(
            // initialValue: widget.nameList[widget.index],
            // initialValue: _listModelSibling.data[widget.index].sibling_namedit ?? null,
            // controller: widget.nameController,
            initialValue: widget.name,
            style: const TextStyle(
              fontSize: 15,
            ),
            onChanged: (value) {
              setState(() async {
                _listModelSibling.data[widget.index].sibling_namedit = value;
              });
            },
            decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(10),
                border: InputBorder.none,
                hintText: "Enter"),
          ),
        ),
        const D10HCustomClSizedBoxWidget(),
        Text("Relation"),
        const SizedBox(
          height: 5,
        ),
        Container(
          // height: DeviceSize.screenHeight - 150,
          decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8)),
          child: TextFormField(
            //  initialValue: widget.jobList[widget.index],
            // initialValue: _listModelSibling.data[widget.index].sibling_relation ?? null,
            // controller: widget.relationController,
            initialValue: widget.relation,
            style: const TextStyle(
              fontSize: 15,
            ),
            onChanged: (value) {
              setState(() async {
                _listModelSibling.data[widget.index].sibling_relation = value;
              });
            },
            decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(10),
                border: InputBorder.none,
                hintText: "Enter"),
          ),
        ),
        const D10HCustomClSizedBoxWidget(),
        Text("Job"),
        const SizedBox(
          height: 5,
        ),
        Container(
          // height: DeviceSize.screenHeight - 150,
          decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8)),
          child: TextFormField(
            //  initialValue: widget.relationList[widget.index],
            // initialValue: _listModelSibling.data[widget.index].sibling_occupation ?? null,
            // controller: widget.jobController,
            initialValue: widget.job,
            style: const TextStyle(
              fontSize: 15,
            ),
            onChanged: (value) {
              setState(() async {
                _listModelSibling.data[widget.index].sibling_occupation = value;
              });
            },
            decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(10),
                border: InputBorder.none,
                hintText: "Enter"),
          ),
        ),
        const D10HCustomClSizedBoxWidget(),
        // D10HCustomClSizedBoxWidget(),
        Divider(),
        // D10HCustomClSizedBoxWidget(),
      ],
    );
  }
}

class TwoTextLineAndUnderlineNoButtonClickedWidgetCl extends StatefulWidget {
  const TwoTextLineAndUnderlineNoButtonClickedWidgetCl(
      {super.key,
      required this.title,
      required this.cInivalue,
      required this.sharedPreffId,
      this.onChanged,
      required this.userM});

  final String title;
  final String cInivalue;
  final String sharedPreffId;
  final Users userM;
  final onChanged;

  //  OnChanged onChanged;

  @override
  State<TwoTextLineAndUnderlineNoButtonClickedWidgetCl> createState() =>
      _TwoTextLineAndUnderlineNoButtonClickedWidgetClState();
}

class _TwoTextLineAndUnderlineNoButtonClickedWidgetClState
    extends State<TwoTextLineAndUnderlineNoButtonClickedWidgetCl> {
  saveToSharedPrefferences(String nameOfID, String valueToSave) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setString(nameOfID, valueToSave);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(
            fontSize: 11,
          ),
        ),

        SizedBox(
          height: 3,
        ),

        Text(
          widget.cInivalue.toString(),
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
        ),

        D10HCustomClSizedBoxWidget(
          height: 50,
        ),
        Divider(),
        // widget.buttonclicked ? SizedBox() : Divider(),
        D10HCustomClSizedBoxWidget(
          height: 50,
        ),
      ],
    );
  }
}
