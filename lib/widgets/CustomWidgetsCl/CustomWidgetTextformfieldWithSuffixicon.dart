import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomWidgetTextformfieldWithSuffixicon extends StatelessWidget {
  const CustomWidgetTextformfieldWithSuffixicon({
    super.key,
    required this.name,
    this.fontWeight,
    this.onChangedd,
    this.hintText,
  });

  final String name;
  final FontWeight? fontWeight;

  final Function(String)? onChangedd;
  final hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 30,
        ),
        Text(
          name,
          style: TextStyle(fontWeight: fontWeight),
        ),
        SizedBox(
          height: 20,
        ),
        TextFormField(
          // expands: true,
          maxLines: 5,
          minLines: 5,

          decoration: InputDecoration(
            hintText: hintText,
              
              suffixIcon: Padding(
                padding: EdgeInsets.only(top:110, bottom: 0),
                child: 
                
                SvgPicture.asset(
                  'assets/images/img_menu.svg',
                  alignment: Alignment.bottomLeft,
                ),
                
              ),
              suffixIconConstraints:
                  BoxConstraints(minWidth: 20, minHeight: 20),
              // contentPadding: EdgeInsets.only(left: 10,top: 30,right: 10, bottom: -10),
              border: OutlineInputBorder(
                  borderSide: BorderSide(),
                  // gapPadding: 10,

                  borderRadius: BorderRadius.circular(10))),
          onChanged: onChangedd,

          // onChanged: (value) async{

          //   SharedPreferences preferences =
          //     await SharedPreferences.getInstance();

          // preferences.setString("whyShouldMarry", value);

          // },
        ),
      ],
    );
  }
}



  // static const String Thirteen_Screen_Family_DetailsScreenScr = 'thirteenFamilyScreen';
  // static const String Thirteen_Screen_Contact_DetailsScreenScr = 'thirteenContactScreen';
  
  

  // Thirteen_Screen_Family_DetailsScreen