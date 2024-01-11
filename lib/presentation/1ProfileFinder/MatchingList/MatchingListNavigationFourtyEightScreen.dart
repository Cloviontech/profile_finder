import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:profile_finder/core/utils/color_constant.dart';
import 'package:profile_finder/presentation/1ProfileFinder/MatchingList/every_male_fourty_nine_screen/EveryMaleFourtyNineScreen.dart';
import 'package:profile_finder/presentation/1ProfileFinder/Profile/12screenProfile_complete.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/CustomClAll.dart';

class MatchingListNavigationFourtyEightScreen extends StatefulWidget {
  @override
  State<MatchingListNavigationFourtyEightScreen> createState() =>
      _MatchingListNavigationFourtyEightScreenState();
}

class _MatchingListNavigationFourtyEightScreenState
    extends State<MatchingListNavigationFourtyEightScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[

     EveryMaleFourtyNineScreen(),
      EveryMaleFourtyNineScreen(),
       const FourteenProfileCompleteness(),
        const FourteenProfileCompleteness(),
    // EveryMaleFourtyNineScreen(),
    // CustomClGallery(
    //   folderName: 'HappyCouplesImagesUrl',
    //   chooseViewBuilder: 'list',
    // ),
    // const ChatFiftyThreeScreen(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ClAppbarLeadGridSuffHeart(testingNextPage:MatchingListNavigationFourtyEightScreen(),),
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        // fixedColor: Colors.red,

        selectedFontSize: 15,

        selectedIconTheme:
            IconThemeData(color: ColorConstant.black900, size: 40),
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
