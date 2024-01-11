import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:profile_finder/core/utils/color_constant.dart';
import 'package:profile_finder/core/utils/size_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WidgetTitleAndDropdown extends StatefulWidget {
  final String DdbTitle;

  final String DdbHint;
  final List<String> DbdItems;

  final dynamic onChanged;

  const WidgetTitleAndDropdown({
    super.key,
    required this.DdbTitle,
    required this.DdbHint,
    required this.DbdItems,
    required this.onChanged,
  });

  @override
  State<WidgetTitleAndDropdown> createState() => _WidgetTitleAndDropdownState();
}

class _WidgetTitleAndDropdownState extends State<WidgetTitleAndDropdown> {
  String dropdownValue = 'Yes';

  TextEditingController _textFieldController = TextEditingController();

// List<String> _locations = ['A', 'B', 'C', 'D'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.DdbTitle),
        const SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.shade100,
          ),
          child: DropdownButtonFormField(
            decoration: InputDecoration(
                border: InputBorder.none, contentPadding: EdgeInsets.all(10)
                // labelText: "Select"
                ),
            // underline: SizedBox(),
            isExpanded: true,
            // autofocus: true,

            dropdownColor: Colors.white,
            // focusColor: Colors.white,
            hint:  Text(widget.DdbHint),
            // value: dropdownValue,
            icon: Icon(
              Icons.arrow_drop_down,
              color: ColorConstant.red400,
            ),
            iconSize: 24,
            // elevation: 16,

            // onChanged: (String? newValue) {
            //   setState(() {
            //     dropdownValue = newValue!;
            //   });
            // },

            onChanged: widget.onChanged,

            items:
                widget.DbdItems.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: TextStyle(color: Colors.pink),
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}

class WidgetTitleAndDropdownTextfieldFillBgColorChangeble
    extends StatefulWidget {
  final String DdbTitle;

  final String DdbHint;
  final List<String> DbdItems;

  final dynamic onChanged;
  final Color textfieldfillColorDropdown;
  final Color? titleFontColor;

  const WidgetTitleAndDropdownTextfieldFillBgColorChangeble({
    super.key,
    required this.DdbTitle,
    required this.DdbHint,
    required this.DbdItems,
    required this.onChanged,
    this.textfieldfillColorDropdown = Colors.white,
    this.titleFontColor,
  });

  @override
  State<WidgetTitleAndDropdownTextfieldFillBgColorChangeble> createState() =>
      _WidgetTitleAndDropdownTextfieldFillBgColorChangebleState();
}

class _WidgetTitleAndDropdownTextfieldFillBgColorChangebleState
    extends State<WidgetTitleAndDropdownTextfieldFillBgColorChangeble> {
  String dropdownValue = 'Yes';

  TextEditingController _textFieldController = TextEditingController();

// List<String> _locations = ['A', 'B', 'C', 'D'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.DdbTitle,
          style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
              color: widget.titleFontColor ?? ColorConstant.gray800,
              fontSize: DeviceSize.itemWidth / 14),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            // color: Colors.grey.shade100,
            color: widget.textfieldfillColorDropdown,
          ),
          child: DropdownButtonFormField(
            decoration: InputDecoration(
                border: InputBorder.none, contentPadding: EdgeInsets.all(10)
                // labelText: "Select"
                ),
            // underline: SizedBox(),
            isExpanded: true,
            // autofocus: true,

            dropdownColor: Colors.white,
            // focusColor: Colors.white,
            hint: Text(
              widget.DdbHint,
              style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  color: widget.titleFontColor ?? ColorConstant.gray800,
                  fontSize: DeviceSize.itemWidth / 14),
            ),

            // value: dropdownValue,
            icon: Icon(
              Icons.arrow_drop_down,
              color: ColorConstant.black900,
            ),
            iconSize: 24,
            // elevation: 16,

            // onChanged: (String? newValue) {
            //   setState(() {
            //     dropdownValue = newValue!;
            //   });
            // },

            onChanged: widget.onChanged,

            items:
                widget.DbdItems.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}

class WidgetHindFromListAndDropdown extends StatefulWidget {
  final String DdbTitle;

  final String DdbHint;
  final List<String> DbdItems;

  final dynamic onChanged;

  const WidgetHindFromListAndDropdown({
    super.key,
    required this.DdbTitle,
    required this.DdbHint,
    required this.DbdItems,
    required this.onChanged,
  });

  @override
  State<WidgetHindFromListAndDropdown> createState() =>
      _WidgetHindFromListAndDropdownState();
}

class _WidgetHindFromListAndDropdownState
    extends State<WidgetHindFromListAndDropdown> {
  String dropdownValue = 'Yes';

  TextEditingController _textFieldController = TextEditingController();

// List<String> _locations = ['A', 'B', 'C', 'D'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.DdbTitle),
        const SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: DropdownButtonFormField(
            decoration: const InputDecoration(
                border: InputBorder.none, contentPadding: EdgeInsets.all(10)
                // labelText: "Select"
                ),

            isExpanded: true,

            dropdownColor: Colors.white,

            hint: Center(child: Text(widget.DdbHint)),
            // value: dropdownValue,
            icon: const Icon(Icons.arrow_drop_down),
            iconSize: 24,

            onChanged: widget.onChanged,

            items:
                widget.DbdItems.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Center(child: Text(value)),
              );
            }).toList(),
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}

// title and textformfield with dropdown icon and
//backround color changeble
class WidgetHindFromListAndDropdownWhiteBackground extends StatefulWidget {
  final String DdbTitle;

  final String DdbHint;
  final List<String> DbdItems;

  final dynamic onChanged;

  const WidgetHindFromListAndDropdownWhiteBackground({
    super.key,
    required this.DdbTitle,
    required this.DdbHint,
    required this.DbdItems,
    required this.onChanged,
  });

  @override
  State<WidgetHindFromListAndDropdownWhiteBackground> createState() =>
      _WidgetHindFromListAndDropdownWhiteBackgroundState();
}

class _WidgetHindFromListAndDropdownWhiteBackgroundState
    extends State<WidgetHindFromListAndDropdownWhiteBackground> {
  String dropdownValue = 'Yes';

  TextEditingController _textFieldController = TextEditingController();

// List<String> _locations = ['A', 'B', 'C', 'D'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.DdbTitle,
          style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
              // color: ColorConstant.clGreyFontColor3,
              fontSize: DeviceSize.itemWidth / 11.413),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: DropdownButtonFormField(
            decoration: const InputDecoration(
                border: InputBorder.none, contentPadding: EdgeInsets.all(10)
                // labelText: "Select"
                ),

            isExpanded: true,

            dropdownColor: Colors.white,

            hint: Text(
              widget.DdbHint,
              style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  // color: ColorConstant.clGreyFontColor3,
                  fontSize: DeviceSize.itemWidth / 11.413),
            ),
            // value: dropdownValue,
            icon: const Icon(Icons.arrow_drop_down),
            iconSize: 24,

            onChanged: widget.onChanged,

            items:
                widget.DbdItems.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Center(child: Text(value)),
              );
            }).toList(),
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}

// title and textformfield with custom action icon and
//backround color changeble

class WidgetTitleAndCustomActionIconTextfieldFillBgColorChangeble
    extends StatefulWidget {
  final String DdbTitle;

  final String DdbHint;
  final List<String> DbdItems;

  final dynamic onChanged;
  final Color textfieldfillColorDropdown;
  final Color? titleFontColor;

  final String? imageAction;

  const WidgetTitleAndCustomActionIconTextfieldFillBgColorChangeble({
    super.key,
    required this.DdbTitle,
    required this.DdbHint,
    required this.DbdItems,
    required this.onChanged,
    this.textfieldfillColorDropdown = Colors.white,
    this.imageAction,
    this.titleFontColor,
  });

  @override
  State<WidgetTitleAndCustomActionIconTextfieldFillBgColorChangeble>
      createState() =>
          _WidgetTitleAndCustomActionIconTextfieldFillBgColorChangebleState();
}

class _WidgetTitleAndCustomActionIconTextfieldFillBgColorChangebleState
    extends State<WidgetTitleAndCustomActionIconTextfieldFillBgColorChangeble> {
  String dropdownValue = 'Yes';

  TextEditingController _textFieldController = TextEditingController();

// List<String> _locations = ['A', 'B', 'C', 'D'];

  @override
  Widget build(BuildContext context) {
    // var icon2 = Icon(
    //           Icons.arrow_drop_down,
    //           color: ColorConstant.black900,
    //         );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.DdbTitle,
          style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
              color: widget.titleFontColor,
              fontSize: DeviceSize.itemWidth / 11.413),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            // color: Colors.grey.shade100,
            color: widget.textfieldfillColorDropdown,
          ),
          child: DropdownButtonFormField(
            decoration: InputDecoration(
                border: InputBorder.none, contentPadding: EdgeInsets.all(10)
                // labelText: "Select"
                ),
            // underline: SizedBox(),
            isExpanded: true,
            // autofocus: true,

            dropdownColor: Colors.white,
            // focusColor: Colors.white,
            hint: Text(widget.DdbHint),
            // value: dropdownValue,
            // icon: widget.iconAction,
            icon: SvgPicture.asset(widget.imageAction.toString()),
            iconSize: 24,
            // elevation: 16,

            // onChanged: (String? newValue) {
            //   setState(() {
            //     dropdownValue = newValue!;
            //   });
            // },

            onChanged: widget.onChanged,

            items:
                widget.DbdItems.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}

// Passing Value to Shared Prefferences by constructor

class WidgetTitleAndDropdownSharedPref extends StatefulWidget {
  final String DdbTitle;

  final String DdbHint;
  final List<String> DbdItems;
  final String sharePrefId;

  const WidgetTitleAndDropdownSharedPref({
    super.key,
    required this.DdbTitle,
    required this.DdbHint,
    required this.DbdItems,
    required this.sharePrefId,
  });

  @override
  State<WidgetTitleAndDropdownSharedPref> createState() =>
      _WidgetTitleAndDropdownSharedPrefState();
}

class _WidgetTitleAndDropdownSharedPrefState
    extends State<WidgetTitleAndDropdownSharedPref> {
  String dropdownValue = 'Yes';

  TextEditingController _textFieldController = TextEditingController();

// List<String> _locations = ['A', 'B', 'C', 'D'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.DdbTitle),
        const SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.shade100,
          ),
          child: DropdownButtonFormField(
            decoration: InputDecoration(
                border: InputBorder.none, contentPadding: EdgeInsets.all(10)),
            isExpanded: true,
            dropdownColor: Colors.white,
            // hint: const Text('Select'),
            hint:  Text(widget.DdbHint.toString()),

            icon: Icon(
              Icons.arrow_drop_down,
              color: ColorConstant.red400,
            ),
            iconSize: 24,
            onChanged: (newValue) async {
              SharedPreferences preferences =
                  await SharedPreferences.getInstance();

              preferences.setString(widget.sharePrefId, newValue!);

               ScaffoldMessenger.of(context).showSnackBar(
   SnackBar(content: Center(child: Text("${preferences.getString(widget.sharePrefId).toString()} Saved"))));
      
            },
            items:
                widget.DbdItems.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: TextStyle(color: Colors.pink),
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
