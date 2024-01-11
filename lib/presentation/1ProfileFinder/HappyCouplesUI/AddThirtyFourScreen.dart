
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:profile_finder/core/utils/color_constant.dart';
import 'package:profile_finder/presentation/1ProfileFinder/HappyCouplesUI/SuccessStoryThirtyFiveScreen.dart';
import 'package:profile_finder/presentation/1ProfileFinder/MatchingList/every_male_fourty_nine_screen/EveryMaleFourtyNineScreen.dart';
import 'package:profile_finder/presentation/1ProfileFinder/Profile/12screenProfile_complete.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/CustomClGallery.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/CustomWidgets.dart';

class AddThirtyFourScreen extends StatefulWidget {
  @override
  State<AddThirtyFourScreen> createState() => _AddThirtyFourScreenState();
}

class _AddThirtyFourScreenState extends State<AddThirtyFourScreen> {

  int _selectedIndex = 0;
  static List<Widget> _pages = <Widget>[
   const FourteenProfileCompleteness(),
    EveryMaleFourtyNineScreen(),
    CustomClGallery(
      folderName: 'HappyCouplesImagesUrl',
      chooseViewBuilder: 'list',
    ),
    // const ChatFiftyThreeScreen(),
  ];

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
          icon: SvgPicture.asset('assets/images/img_grid.svg'),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
            child: MyElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return SuccessStoryThirtyFiveScreen(index: 0,);
                  }),
                );
              },
              child: Text('+Add'),
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(colors: [
                ColorConstant.deepPurpleA200,
                ColorConstant.deepPurpleA20063
              ]),
              //  LinearGradient(colors: [ColorConstant.clLightBlue, Colors.pink, Colors.white]),
              // height: 20,
              width: 80,
            ),
          ),
        ],
        elevation: 0,
      ),
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        // fixedColor: Colors.red,

        selectedFontSize: 15,

        selectedIconTheme:
            IconThemeData(color: ColorConstant.deepPurpleA200, size: 40),
        selectedItemColor: ColorConstant.deepPurpleA200,
        selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.bold, color: ColorConstant.deepPurpleA200),
        unselectedIconTheme: IconThemeData(
          color: Colors.grey.shade300,
        ),
        unselectedItemColor: Colors.grey.shade300,

        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/img_user_blue_gray_100.svg',
                color: _selectedIndex == 0
                    ? ColorConstant.deepPurpleA200
                    : Colors.grey.shade300),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
                'assets/images/img_user_deep_purple_a200_24x23.svg',
                color: _selectedIndex == 1
                    ? ColorConstant.deepPurpleA200
                    : Colors.grey.shade300),
            label: 'Matching List',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/img_refresh.svg',
                color: _selectedIndex == 2
                    ? ColorConstant.deepPurpleA200
                    : Colors.grey.shade300),
            label: 'Happy Couples',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/img_clock_black_900.svg',
              color: _selectedIndex == 3
                  ? ColorConstant.deepPurpleA200
                  : Colors.grey.shade300,
            ),
            label: 'Chat',
          ),
        ],
        currentIndex: _selectedIndex, //New
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
