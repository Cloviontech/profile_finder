import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:profile_finder/core/utils/color_constant.dart';
import 'package:profile_finder/core/utils/image_constant.dart';
import 'package:profile_finder/presentation/1ProfileFinder/Registeration/8screenUploadTheID.dart';
import 'package:profile_finder/routes/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import 'package:marriyo_17_may/presentation/NotUsingCodeIphone_13_13_pro_twelve_screen/NotUsingCodeIphone_13_13_pro_twelve_screen.dart';

class SevenChooseServiceScreen extends StatefulWidget {
  const SevenChooseServiceScreen({super.key});

  @override
  State<SevenChooseServiceScreen> createState() =>
      _SevenChooseServiceScreenState();
}

class _SevenChooseServiceScreenState extends State<SevenChooseServiceScreen> {
  List<String> ServiceItems = [
    "Profile Finder",
    // "Hiring Manager",
    // "Sales Person",
    // "Advertisement",
    // "Affiliate Program",
    // "Private Investigator"
  ];

  List<Widget> Navigation = [
    EightUploadTheIDScreen(),
    // BottomNavigationThirteenHiringMgrMainScreen(),
    // BottomNavigationSalesScreen(),
    // "Advertisement",
    // "Affiliate Program",
    // ContactDetailsPrivateInvestScreen(),
  ];

  final List<String> _IconItems = [
    ImageConstant.imgUserWhiteA700,
    // ImageConstant.imgFilelist3line,
    // ImageConstant.imgUser2line,
    // ImageConstant.imgLayoutgridfill,
    // ImageConstant.imgCheckmark,
    ImageConstant.imgPriInv,
  ];

  final List<bool> _selected = List.generate(20, (Index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteA700,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Choose Service",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                itemCount: ServiceItems.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      minVerticalPadding: 10,
                      // tileColor: _selected[index]?  ColorConstant.deepPurpleA200: Colors.yellow,
                      tileColor: _selected[index]
                          ? ColorConstant.deepPurpleA200
                          : ColorConstant.clPurple05,

                      contentPadding: const EdgeInsets.only(
                          top: 10, left: 10, right: 30, bottom: 10),
                      // leading: SvgPicture.asset(_IconItems[index]),
                      leading: Container(
                          decoration: BoxDecoration(
                              color: ColorConstant.deepPurpleA200,
                              borderRadius: BorderRadius.circular(8)),
                          height: MediaQuery.of(context).size.height * 0.5,
                          width: MediaQuery.of(context).size.width * 0.13,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: SvgPicture.asset(_IconItems[index]),
                          )),

                      title: Text(ServiceItems[index]),
                      trailing: SvgPicture.asset(
                        ImageConstant.imgArrowright,
                      ),
                      // onTap: () => setState(() => _selected[index] = !_selected[index]),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Navigation[index]));
                      },
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "If don't want to continue now?",
                    style:
                        TextStyle(color: ColorConstant.gray600, fontSize: 14),
                  ),
                  GestureDetector(
                    onTap: () async {
                      Navigator.pushNamed(context, AppRoutes.threeSigninScreen);
                      SharedPreferences preferences =
                          await SharedPreferences.getInstance();
                      await preferences.clear();
                    },
                    child: Text(
                      "  Logout Now",
                      style: TextStyle(
                        color: ColorConstant.deepPurpleA200,
                        fontSize: 14,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
