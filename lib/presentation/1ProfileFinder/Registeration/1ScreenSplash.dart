import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:profile_finder/core/utils/color_constant.dart';
import 'package:profile_finder/core/utils/image_constant.dart';
import 'package:profile_finder/core/utils/size_utils.dart';
import 'package:profile_finder/presentation/1ProfileFinder/Registeration/2ScreenWelcome.dart';


class OneSplashScreen extends StatefulWidget {
  @override
  State<OneSplashScreen> createState() => _OneSplashScreenState();
}

class _OneSplashScreenState extends State<OneSplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(milliseconds: 3000), () {});

    Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.rightToLeft,
                    duration: Duration(milliseconds: 750),
                    child: TwoWelcomeScreen(),
                  ),
                );

//  "C:\Python312"
    // Navigator.push(
    //     context,
    //     CustomPageRoute(
    //         child: TwoWelcomeScreen(), direction: AxisDirection.left));

    // Navigator.pushNamed(context, AppRoutes.twoWelcomeScreen);

    // Navigator.push(
    //                                 context,
    //                                 MaterialPageRoute(builder: (context) {
    //                                   return MatchingDetailsFiftyOneScreen();
    //                                 }),
    //                               );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteA700,
      body: SizedBox(
        height: size.height,
        width: double.maxFinite,
        child: Stack(
          // alignment: Alignment.topLeft,
          children: [
            Center(
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image:
                          AssetImage('assets/images/img_background_first.png'),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 125,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            height: 80,
                            width: 80,
                            child: Image.asset(ImageConstant.imgIsolationmode)
                            // child: Image.asset(ImageConstant.imgIsolationmodeWhiteA700)
                            // SvgPicture.asset(ImageConstant.imgIsolationmode)

                            ),
                        const Text(
                          "MARRIYO",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            letterSpacing: 2.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Copyright © Marriyo 2023",
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(
                    height: 65,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
