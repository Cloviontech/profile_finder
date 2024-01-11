import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:profile_finder/core/utils/color_constant.dart';
import 'package:profile_finder/presentation/1ProfileFinder/Registeration/9screenThisProfileForWhom.dart';
import 'package:profile_finder/routes/app_routes.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/CustomClAll.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/CustomWidgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EightUploadTheIDScreen extends StatefulWidget {
  const EightUploadTheIDScreen({super.key});

  @override
  State<EightUploadTheIDScreen> createState() => _EightUploadTheIDScreenState();
}

class _EightUploadTheIDScreenState extends State<EightUploadTheIDScreen> {
  // String url = "http://3.86.99.140:8000/profileidcard/{YLEM2CJOOBT}";

  //     FormData data = FormData.fromMap({
  //       'key': '0896a2b9a2005ebf1c75c75bcf75742b',
  //       'image': await MultipartFile.fromFile(filepath, filename: filename),
  //       'name': 'id1.jpg',
  //     });

  //     // var response = await dio.post("https://api.imgbb.com/1/upload",
  //     //     data: data, onSendProgress: (int sent, int total) {
  //     //   print('$sent, $total');
  //     // });

  //     var headers = {
  //   'Context-Type': 'application/json',
  // };

  //      var requestBody = {
  //   // 'email': 'abhijithbrindav@gmail.com',
  //   // 'email': 'saran@gmail.com',

  //   // 'password': "12345",

  //   // 'email': emailController.text,

  //   'id_card_1':data,
  // };

  //      var response = await http.post(Uri.parse("http://3.86.99.140:8000/profileidcard/{YLEM2CJOOBT}"),
  //        headers: headers,
  //         body: requestBody,

  //    );
  //     print(response.body);

  //  uploadFile3(String fileNamee) async {
  //   var postUri = Uri.parse(url);
  //   var request = new http.MultipartRequest("POST", postUri);
  //   // request.fields['user'] = 'blah';
  //   request.files.add(

  //     await http.MultipartFile.fromPath(
  //     'id_card_1',
  //     fileNamee
  //   )

  // http.MultipartFile.fromBytes('id_card_1',
  // await File.fromUri(filename).readAsBytes(),
  // contentType:  MediaType('image', 'jpeg')

  //   );

  //   request.send().then((response) {
  //     if (response.statusCode == 200) print("Uploaded!");
  //   });
  //  }

  // int? currentTile;

  // PlatformFile? pickedFile;

  // late FToast fToast;

  // Future UploadDoc() async {
  //   final path = 'files/${pickedFile!.name}';
  //   final file = File(pickedFile!.path!);

  // final ref = FirebaseStorage.instance.ref().child(path);
  // ref.putFile(file).whenComplete(() => fToast.showToast(
  //       gravity: ToastGravity.BOTTOM,
  //       toastDuration: const Duration(milliseconds: 2000),
  //       child: const Row(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           Icon(Icons.face),
  //           Text(
  //             "Data Uploaded Succesfully!",
  //             style: TextStyle(
  //                 color: Colors.white,
  //                 fontSize: 20.0,
  //                 fontWeight: FontWeight.bold),
  //           )
  //     ],
  //   ),
  // ));

  // }

  // Future PickFile() async {
  //   final result = await FilePicker.platform.pickFiles();
  //   if (result == null) return;

  //   setState(() {
  //     pickedFile = result.files.first;
  //   });
  // }

  // Future<String?> uploadImage(filename, url) async {
  //   var request = http.MultipartRequest('POST', Uri.parse(url));
  //   request.files.add(await http.MultipartFile.fromPath('picture', filename));
  //   var res = await request.send();
  //   return res.reasonPhrase;
  // }

  // String state = "";

  String? filename;
  String filepath = "abc";
  File? filee;

  Future pickSingleFile() async {
    // var dio = Dio();

    FilePickerResult? result = await FilePicker.platform.pickFiles(
        //  type: FileType.custom,
        //   allowedExtensions: ['pdf'],
        );

    if (result != null) {
      File file = File(result.files.single.path ?? " ");
      setState(() {
        filee = File(result.files.single.path.toString());
        filepath = file.path;
      });

      filename = file.path.split('/').last;
    } else {
      print("Result is null");
    }
  }

  void uploadSingleFile() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    String uidUser = preferences.getString("uid2").toString();

    final url = Uri.parse("http://54.159.186.219:8000/profileidcard/$uidUser");
    // final file = File("/home/abijith/Pictures/cat.jpg");

    // final file2 = File("/home/abijith/Pictures/flower.jpeg");
    final request = http.MultipartRequest('POST', url);
    // request.files.add(await http.MultipartFile.fromPath('id_card_1', filepath.toString()));
    request.files
        .add(await http.MultipartFile.fromPath('id_card_1', filee!.path ?? ""));

    // request.files.add(await http.MultipartFile.fromPath('id_card_1', file2.path));
    request.fields['email'] = [
      'abhijithbrindav@gmail.com',
      'abijith@gmail.com',
      'abi@gmail.com'
    ].toString();
    request.fields['phone'] = '9876543210';

    try {
      final send = await request.send();
      final response = await http.Response.fromStream(send);
      print(response.statusCode);
      print(response.contentLength);
      print("CurrentUser $uidUser");
      print(response.body);

      print("Succesfully Uploaded");
    } catch (e) {
      print("Error While Uploading File $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        body: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, AppRoutes.sevenChooseServiceScreen);
                          },
                          child: SvgPicture.asset(
                              'assets/images/img_arrowleft_black_900.svg'),
                        ),
                        const D10HCustomClSizedBoxWidget(),
                        Text(
                          'Fill the details',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
                              color: ColorConstant.black900),
                        ),
                        const D10HCustomClSizedBoxWidget(),
                        Text(
                          'Upload the ID of who Handling the account.',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: ColorConstant.black900),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ID Card*',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              color: ColorConstant.indigo900),
                        ),
                        const D10HCustomClSizedBoxWidget(),
                        DottedBorder(
                          borderType: BorderType.RRect,
                          color: Colors.grey,
                          strokeWidth: 0.5,
                          dashPattern: const [4, 4],
                          radius: const Radius.circular(10),
                          child: SizedBox(
                            width: double.maxFinite,
                            height: 200,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                //  SizedBox(
                                //   height: 80,
                                // ),
                                GestureDetector(
                                  onTap: () async {
                                    pickSingleFile();

                                    // uploadFile3(filename);

                                    // await PickFile();
                                    // await UploadDoc();

                                    //  var file = await ImagePicker.pickImage(source: ImageSource.gallery);

                                    //  var file= pickedFile;

                                    //                     var res = await uploadImage(file!.path, url);
                                    //   setState(() {
                                    //     state = res!;
                                    //     print(res);
                                    //   });
                                  },
                                  child: Container(
                                    // height:
                                    //     MediaQuery.of(context).size.height / 15,
                                    // width:
                                    //     MediaQuery.of(context).size.height / 15,
                                    decoration: BoxDecoration(
                                        color: ColorConstant.clPurple1,
                                        borderRadius: BorderRadius.circular(8)),
                                    child: filepath == "abc"
                                        ? Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: SvgPicture.asset(
                                                "assets/images/img_group228.svg"
                                                // height: 50,
                                                ))
                                        : ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: Image.file(
                                              filee!,
                                              fit: BoxFit.cover,
                                              width: 80,
                                              height: 80,
                                            )),
                                  ),
                                ),
                                // filepath == "abc" ?

                                const D10HCustomClSizedBoxWidget(),
                                Text(
                                  "Drag or Click Here To Upload Your ID",
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: ColorConstant.gray600),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        MyElevatedButton(
                          onPressed: () {
                            uploadSingleFile();
//  Navigator.pushNamed(context, AppRoutes.nineThisProfileForWhomScreen);

                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return NineThisProfileForWhomScreen();
                              }),
                            );

                            //  Navigator.pushNamed(
                            //   context, AppRoutes.ThirteenScreenscr);
                          },
                          borderRadius: BorderRadius.circular(8),
                          width: double.maxFinite,
                          backgroundColor: Colors.transparent,
                          child: const Text('Go Next', style: TextStyle(color: Colors.white),),
                        ),
                        const D10HCustomClSizedBoxWidget(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "If don't want to continue now? ",
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: ColorConstant.gray600),
                            ),
                            Text(
                              "Logout Now",
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: ColorConstant.deepPurpleA200),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ]),
            )));
  }

  // onTapGonext(BuildContext context) {
  //   Navigator.pushNamed(context, AppRoutes.iphone1313ProElevenScreen);
  // }

  // onTapTxtIfdontwantto(BuildContext context) {
  //   Navigator.pushNamed(context, AppRoutes.threeSigninScreen);
  // }
}
