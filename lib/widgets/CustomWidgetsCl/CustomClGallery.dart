import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomClGallery extends StatelessWidget {

  // String userUid = FirebaseAuth.instance.currentUser!.uid;
  final String folderName;
  final String chooseViewBuilder;
  

   CustomClGallery({super.key, required this.folderName, required this.chooseViewBuilder});


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         
          // StreamBuilder(
          //     stream: FirebaseFirestore.instance
          //         .collection("ProfileInfo")
          //         .doc(userUid)
          //         .collection(folderName)
          //         .snapshots(),
          //     builder: (BuildContext context,
          //         AsyncSnapshot<QuerySnapshot> snapshot) {
          //       if (!snapshot.hasData) {
          //         return (Center(
          //           child: Text("No image uploaded"),
          //         ));
          //       } else {

                  
          //         //  if you want to display images in list view , pass value in chooseViewBuilder = list.

          //         if (chooseViewBuilder=='list'){

          //             return ListView.builder(
          //             // padding: EdgeInsets.all(10),
          //             physics: BouncingScrollPhysics(),
          //             shrinkWrap: true,
          //             itemCount: snapshot.data!.docs.length,
                      
          //             itemBuilder: (BuildContext context, int index) {
          //               String url =
          //                   snapshot.data!.docs[index]['downloadURL'];
          //               return Padding(
          //                 padding: const EdgeInsets.only(bottom: 15,left: 20, right: 20),
          //                 child:
          //                     Container(
          //                   width: 100.0,
          //                   height: 150.0,
          //                   decoration: BoxDecoration(
          //                     image: DecorationImage(
          //                         fit: BoxFit.cover,
          //                         image: NetworkImage(url)),
          //                     borderRadius:
          //                         BorderRadius.all(Radius.circular(8.0)),
          //                     color: Colors.redAccent,
          //                   ),
          //                 ),
          //               );
          //             });
          //         }

          //         //  if you want to display images in grid view , pass value in chooseViewBuilder = grid.
          //         else 
          //               {
          //               return GridView.builder(
                      
          //             shrinkWrap: true,
          //             itemCount: snapshot.data!.docs.length,
          //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, 
          //             mainAxisSpacing: 15, 
          //             crossAxisSpacing: 10,
          //             // childAspectRatio: (itemWidth / itemHeight),
          //             childAspectRatio: 1
          //             ),
          //             itemBuilder: (BuildContext context, int index){
          //               String url=snapshot.data!.docs[index]['downloadURL'];
          //               return Padding(
          //                 padding: const EdgeInsets.only(bottom: 15),
          //                 child:
          //                     Container(
          //                   width: 100.0,
          //                   height: 150.0,
          //                   decoration: BoxDecoration(
          //                     image: DecorationImage(
          //                         fit: BoxFit.cover,
          //                         image: NetworkImage(url)),
          //                     borderRadius:
          //                         BorderRadius.all(Radius.circular(8.0)),
          //                     color: Colors.redAccent,
          //                   ),
          //                 ),
          //               );
                        
                        
          //               // ClipRRect(
          //               //   borderRadius: BorderRadius.circular(10),
          //               //   child: Image.network(url,
          //               //   // height: 100,
          //               //   // fit: BoxFit.cover,
          //               //   ),
          //               // );




          //             });}
                  

                  
          //       }
          //     }),
          
        ],
      ),
    );
  }
}