import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:profile_finder/core/utils/color_constant.dart';
import 'package:profile_finder/presentation/1ProfileFinder/Registeration/7screenChooseService.dart';

class SixOtpSuccessfulScreen extends StatefulWidget {

  final String emailid;
  // final String uid;

  const SixOtpSuccessfulScreen({super.key, required this.emailid,
  //  required this.uid
   
   });

  @override
  State<SixOtpSuccessfulScreen> createState() =>
      _SixOtpSuccessfulScreenState();
}

class _SixOtpSuccessfulScreenState extends State<SixOtpSuccessfulScreen> {
  // List<String> title = ['Surprise', 'Location', 'Done'];
  final String subTitle = 'Successfully Validated';

  @override
  void initState() {
    Timer(
      const Duration(seconds: 3),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (BuildContext context) => SevenChooseServiceScreen()),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteA700,
      body: Container(
        // width: double.maxFinite,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              // child: Lottie.network(
              //     'https://assets4.lottiefiles.com/packages/lf20_jbrw3hcz.json')
              child: Lottie.asset('assets/images/79952-successful.json'),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                subTitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
