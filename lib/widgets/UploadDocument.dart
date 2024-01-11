
import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';

class UploadDocuments {

  // User? user = FirebaseAuth.instance.currentUser;
  final postID = DateTime.now().millisecondsSinceEpoch.toString();

  Future<void> UploadDoc() async {
        FilePickerResult? result = await FilePicker.platform.pickFiles();

if (result != null) {
  Uint8List? fileBytes = result.files.first.bytes;
  String fileName = result.files.first.name;
  
  // Upload file
  // await FirebaseStorage.instance.ref('uploads/$fileName').putData(fileBytes!);
  // await FirebaseStorage.instance.ref().child("${user!.uid}/images").child("postt_$postID").putData(fileBytes!);
}
  }


}