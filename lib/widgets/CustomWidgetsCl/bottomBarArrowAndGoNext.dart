


import 'package:flutter/material.dart';
import 'package:profile_finder/core/utils/color_constant.dart';
import 'package:profile_finder/routes/app_routes.dart';

class bottomBarArrowAndGoNext extends StatelessWidget {
  const bottomBarArrowAndGoNext({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: ColorConstant.deepPurpleA200),
                    borderRadius: BorderRadius.circular(10)),
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_back,
                      color: ColorConstant.deepPurpleA200,
                    ))),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 6,
            child: Container(
                // width: double.maxFinite,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 4),
                        blurRadius: 5.0)
                  ],
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    // stops: [0.1, 0.9],
                    transform: const GradientRotation(-1),
                    colors: [
                      
                      ColorConstant.indigo500,
                      ColorConstant.indigo500,
                      ColorConstant.clElevatedButtonGradientColor2,
                      ColorConstant.clElevatedButtonGradientColor2
                    ],
                  ),
                  color: Colors.deepPurple.shade300,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.ThirteenScreenscr);
                    },
                    child: const Text(
                      "Next",
                      style: TextStyle(color: Colors.white),
                    ))),
          ),
        ],
      ),
    );
  }
}
