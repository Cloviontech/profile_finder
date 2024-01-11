import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:profile_finder/core/utils/color_constant.dart';
import 'package:profile_finder/core/utils/image_constant.dart';
import 'package:profile_finder/core/utils/size_utils.dart';
import 'package:profile_finder/routes/app_routes.dart';

class TwoWelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.indigo800,
      body: Container(
        height: size.height,
        width: double.maxFinite,
        child: Stack(
          // alignment: Alignment.topLeft,
          children: [
            Center(
              child: Container(
                  // decoration: BoxDecoration(
                  //   image: DecorationImage(
                  //       image:
                  //           AssetImage('assets/images/img_background_first.png'),
                  //       fit: BoxFit.cover),
                  // ),
                  ),
            ),
            Center(
              child: Container(
                height: 270,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        height: 80,
                        width: 80,
                        child:
                            Image.asset(ImageConstant.imgIsolationmodeWhiteA700)

                        // SvgPicture.asset(ImageConstant.imgIsolationmode)

                        ),
                    // SizedBox(
                    //   height: 120,
                    // ),
                    Container(
                      child: Column(
                        children: const [
                          Text(
                            "Welcome to Marriyo",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              // letterSpacing: 2.5,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "When it comes to safety, marriyo is As",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white54,
                            ),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            "Caring as Family.",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, AppRoutes.FourteenScreenscr);
                        },
                        child: Container(
                          child: const Text(
                            "Skip",
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white30,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          debugPrint('test nav');
                          Navigator.pushNamed(
                              context, AppRoutes.threeSigninScreen);
                          // Navigator.of(context).push(
                          //    CustomPageRoute(child: SigninScreenThree(), direction: AxisDirection.left, )),
                        },
                        child: Container(
                          child: const Text(
                            "Next",
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
