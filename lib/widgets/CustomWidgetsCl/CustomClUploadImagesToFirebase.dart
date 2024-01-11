

// Widget Screen. This page not used as screen. Used to Upload Images to firebase


import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:profile_finder/core/utils/color_constant.dart';
import 'package:profile_finder/presentation/1ProfileFinder/Registeration/3ScreenSignin.dart';
import 'package:profile_finder/routes/app_routes.dart';

import '../../model_final/modelAllUser.dart';

class CustomClUploadImagesToFirebase extends StatefulWidget {
  final String? userId;

  final String foldername;

  const CustomClUploadImagesToFirebase({super.key, this.userId, required this.foldername});

  @override
  State<CustomClUploadImagesToFirebase> createState() => _CustomClUploadImagesToFirebaseState();
}

class _CustomClUploadImagesToFirebaseState extends State<CustomClUploadImagesToFirebase> {
  File? _image;
  final imagePicker = ImagePicker();
  String? downloadURL;

  // User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel(uid: ThreeSigninScreen.userUidAccess);

  // @override
  // void initState() {
  // FirebaseFirestore.instance.collection("users").doc(user!.uid).get().then((value) {
  //   this.loggedInUser = UserModel.fromMap(value.data());
  // });
  //   super.initState();
  // }

  // DocumentReference<Map<String, dynamic>> userUid = FirebaseFirestore.instance.collection("users").doc(user!.uid);

  //image picker
  Future imagePickerMethod() async {
    final pick = await imagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pick != null) {
        _image = File(pick.path);
      } else {
        // showing a snackbar with error
        Fluttertoast.showToast(
          msg: "No image selected",
          backgroundColor: ColorConstant.deepPurpleA200,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_SHORT,
        );
      }
    });
  }

//   Future uploadImage() async {
//     final postID = DateTime.now().millisecondsSinceEpoch.toString();
//     FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
//     Reference ref = FirebaseStorage.instance.ref().child("${user!.uid}/${widget.foldername}").child("post_$postID");
//     // Reference ref = FirebaseStorage.instance.ref().child("${user!.uid}/HappyCouplesImages").child("post_$postID");
    
//     // Reference ref = FirebaseStorage.instance
//     //     .ref()
//     //     // .child("${widget.userId}/images")
//     //     .child("images")
//     //     .child("post_$postID");
//     await ref.putFile(_image!);
//     downloadURL = await ref.getDownloadURL();
//     print(downloadURL);

//     await firebaseFirestore
//         .collection("ProfileInfo")
//         .doc(user!.uid)
//         .collection(widget.foldername)
//         .add({'downloadURL': downloadURL}).whenComplete(
//             () => Fluttertoast.showToast(
//                   msg: "Image Uploaded Succesfully",
//                   backgroundColor: ColorConstant.deepPurpleA200,
//                   textColor: Colors.white,
//                   toastLength: Toast.LENGTH_SHORT,
//                 ));
// /* Use below code to upload images to specific folders in firebase

//         //         await firebaseFirestore
//         // .collection("ProfileInfo")
//         // .doc(user!.uid)
//         // .collection("HappyCouplesImagesUrl")
//         // .add({'downloadURL': downloadURL}).whenComplete(
//         //     () => Fluttertoast.showToast(
//         //           msg: "HappyCouplesImages Uploaded Succesfully",
//         //           backgroundColor: ColorConstant.deepPurpleA200,
//         //           textColor: Colors.white,
//         //           toastLength: Toast.LENGTH_SHORT,
//         //         ));
//         */
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteA700,
      appBar: AppBar(
        backgroundColor: ColorConstant.whiteA700,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: ColorConstant.black900,
              size: 16,
            )),
        actions: [
          Row(
            children: [
              SvgPicture.asset('assets/images/img_heartline.svg'),
              SvgPicture.asset('assets/images/img_notification.svg'),
            ],
          )
        ],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10 + 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Center(
            child: Text(
              "Upload Images To Firebase",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ClipRRect(
            child: SizedBox(
              height: 500,
              width: double.infinity,
              child: Column(
                children: [
                  
                  Expanded(
                    flex: 4,
                    child: Container(
                      width: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.red)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: _image == null
                                ? const Center(
                                    child: Text("No image selected"),
                                  )
                                : Image.file(_image!),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                imagePickerMethod();
                              },
                              child: const Text("Select image")),
                          ElevatedButton(
                              onPressed: () {
                                if (_image != null) {
                                  // uploadImage();
                                } else {
                                  Fluttertoast.showToast(
                                    msg: "Select image first",
                                    backgroundColor:
                                        ColorConstant.deepPurpleA200,
                                    textColor: Colors.white,
                                    toastLength: Toast.LENGTH_SHORT,
                                  );
                                }
                              },
                              child: const Text("Upload image")),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
           
        ]),
      ),
      bottomSheet: Padding(
        padding:
            const EdgeInsets.only(top: 15, bottom: 30, left: 25, right: 25),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.SuccessStoryThirtyFiveScreenscr);

                
              },
              child: const Text(
                "Goto",
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: ColorConstant.deepPurpleA200,
                  minimumSize: const Size(380, 50),
                  elevation: 0,
                  side: const BorderSide(width: 1, color: Colors.blue),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
            ),
          ],
        ),
      ),
    );
  }
}

// static String img_full_size_photo = 'assets/images/img_full_size_photo.png';
