// this page is a widget

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ShowUploadsThirtyTwoScreen extends StatefulWidget {
  
  const ShowUploadsThirtyTwoScreen({super.key});


  @override
  State<ShowUploadsThirtyTwoScreen> createState() => _ShowUploadsThirtyTwoScreenState();
}

class _ShowUploadsThirtyTwoScreenState extends State<ShowUploadsThirtyTwoScreen> {



// String userUid = FirebaseAuth.instance.currentUser!.uid; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Images"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SizedBox()
        
        // StreamBuilder(
        //   stream: FirebaseFirestore.instance.
        //   collection("ProfileInfo").doc(userUid).collection("imagesUser").snapshots(),
        //   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        //     if (!snapshot.hasData){
        //       return (Center(
        //         child: Text("No image uploaded"),
        //       ));
        //     }else{
        //       return GridView.builder(
        //         itemCount: snapshot.data!.docs.length,
        //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        //         itemBuilder: (BuildContext context, int index){
        //           String url=snapshot.data!.docs[index]['downloadURL'];
        //           return Padding(
        //             padding: const EdgeInsets.all(3.0),
        //             child: ClipRRect(
        //               borderRadius: BorderRadius.circular(10),
        //               child: Image.network(url,
        //               height: 300,
        //               fit: BoxFit.cover,),
        //             ),
        //           );
        //         });
      
        //     }
            
        //   }),
      ),
    );
  }
}