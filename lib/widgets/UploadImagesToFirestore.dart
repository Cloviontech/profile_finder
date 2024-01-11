import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class UploadImagesToFirestore extends StatefulWidget {
  const UploadImagesToFirestore({super.key});

  @override
  State<UploadImagesToFirestore> createState() => _UploadImagesToFirestoreState();
}

class _UploadImagesToFirestoreState extends State<UploadImagesToFirestore> {
  String? imageUrl;

  
// uploadImage() async {
//     // final _firebaseStorage = FirebaseStorage.instance;
//     final _imagePicker = ImagePicker();
//     PickedFile? image;
//     //Check Permissions
//     await Permission.photos.request();
//     await Permission.storage.request();

//     // var permissionStatus = await Permission.photos.status;
//     var permissionStatus = await Permission.storage.status;

//     // if (permissionStatus.isGranted){
//       //Select Image
//       // image = await _imagePicker.getImage(source: ImageSource.gallery);
//       var file = File(image!.path);

//       if (image != null){
//         //Upload to Firebase
//         var snapshot = await _firebaseStorage.ref()
//         .child('images')
//         .putFile(file).whenComplete(() => null);
//         var downloadUrl = await snapshot.ref.getDownloadURL();
//         setState(() {
//           imageUrl = downloadUrl;
//         });
//       } else {
//         print('No Image Path Received');
//       }
//     // }
//     //  else {
//     //   print('Permission not granted. Try Again with permission access');
//     // }
//   }

    
  // User? user = FirebaseAuth.instance.currentUser;
  // UserModel loggedUser = UserModel();


  // @override
  // void initState() {
  // FirebaseFirestore.instance.collection("profileInfo").doc(user!.uid).get().then((value) {
  //   this.loggedUser = UserModel.fromMap(value.data());
  // });
  //   super.initState();
  // }


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      appBar: AppBar(
        title: Text('Upload Image', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
//       body: Container(
//         color: Colors.white,
//         child: Column(  
//           children: <Widget>[
//             Container(
//               margin: EdgeInsets.all(15),
//               padding: EdgeInsets.all(15),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.all(
//                   Radius.circular(15),
//                 ),
//                 border: Border.all(color: Colors.white),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black12,
//                     offset: Offset(2, 2),
//                     spreadRadius: 2,
//                     blurRadius: 1,
//                   ),
//                 ],
//               ),
//               child: (imageUrl != null)
//                 ? Image.network(imageUrl.toString())
//                 : Image.network('https://i.imgur.com/sUFH1Aq.png')
//             ),
//             SizedBox(height: 20.0,),
// MaterialButton(
//   child: Text("Upload Image", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
//   onPressed: (){
//     uploadImage();
//   },
//   shape: RoundedRectangleBorder(
//     borderRadius: BorderRadius.circular(18.0),
//     side: BorderSide(color: Colors.blue)
//   ),
//   elevation: 5.0,
//   color: Colors.blue,
//   textColor: Colors.white,
//   padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
//   splashColor: Colors.grey,
// ),
//           ],
//         ),
//       ),
      
   );
  }
}
