import 'package:flutter/material.dart';

import '../../../core/utils/color_constant.dart';
import '../../../model_final/modelAllUser.dart';
import '../MatchingList/1screen_advertisement.dart';
import 'SuccessStoryThirtyFiveScreen.dart';

class ImagesHappyCouples extends StatefulWidget {
  const ImagesHappyCouples({super.key});

  @override
  State<ImagesHappyCouples> createState() => _ImagesHappyCouplesState();
}

class _ImagesHappyCouplesState extends State<ImagesHappyCouples> {
  late List<UserModel>? _userModel = [];

  void _getData() async {
    _userModel = (await ApiService().getUsers())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  void initState() {
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteA700,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.builder(
                  controller: ScrollController(),
                  itemCount: _userModel!.length,
                  shrinkWrap: true,
                  itemBuilder: ((context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SuccessStoryThirtyFiveScreen(
                            index: index,
                          );
                        }));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            _userModel![index].fullSizeImage.toString(),
                            fit: BoxFit.cover,
                            height: 200,
                            width: double.maxFinite,
                          ),
                        ),
                      ),
                    );
                  })),
              const SizedBox(
                height: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}
