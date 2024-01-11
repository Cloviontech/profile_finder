import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:profile_finder/core/utils/color_constant.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/CustomClAll.dart';
import '../../../model_final/modelAllUser.dart';
import '../../../widgets/CustomWidgetsCl/CustomWidgets.dart';
import '../MatchingList/1screen_advertisement.dart';
import 'HappyCouplesPackagesThirtySixScreen.dart';

class SuccessStoryThirtyFiveScreen extends StatefulWidget {
  final int index;

  const SuccessStoryThirtyFiveScreen({super.key, required this.index});

  @override
  State<SuccessStoryThirtyFiveScreen> createState() =>
      _SuccessStoryThirtyFiveScreenState();
}

class _SuccessStoryThirtyFiveScreenState
    extends State<SuccessStoryThirtyFiveScreen> {
  bool _isLoading = true;
  late List<UserModel>? _userModel = [];

  void _getData() async {
    _userModel = (await ApiService().getUsers())!;
    // Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
    setState(() {
      _isLoading = false;
    });
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
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const HappyCouplesPackagesThirtySixScreen();
                }));
              },
              borderRadius: BorderRadius.circular(20),
              backgroundColor: Colors.transparent,
              // gradient: LinearGradient(colors: [
              //   ColorConstant.deepPurpleA200,
              //   ColorConstant.deepPurpleA20063
              // ]),
              //  LinearGradient(colors: [ColorConstant.clLightBlue, Colors.pink, Colors.white]),
              // height: 20,
              width: 80,
              child: const Text('+Add'),
            ),
          ),
        ],
        elevation: 0,
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // CustomClGallery(
                      //   folderName: 'Main',
                      //   chooseViewBuilder: 'list',
                      // ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          _userModel![widget.index].fullSizeImage.toString(),
                          fit: BoxFit.cover,
                          height: 170,
                          width: double.maxFinite,
                        ),
                      ),
                      const D10HCustomClSizedBoxWidget(),
                      const Text(
                        'Success Story of Ablne P Dejose & Aneesha Biju',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        children: [
                          Text(
                            'Groom: ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          Text(
                            'Albine P Dejose (CCLT457820)',
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 15),
                          ),
                        ],
                      ),
                      const D10HCustomClSizedBoxWidget(
                        height: 100,
                      ),
                      const Divider(),
                      const D10HCustomClSizedBoxWidget(
                        height: 100,
                      ),
                      const Row(
                        children: [
                          Text(
                            'Bride: ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          Text(
                            'Aneesha Biju (CTCR461235)',
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 15),
                          ),
                        ],
                      ),
                      const D10HCustomClSizedBoxWidget(
                        height: 100,
                      ),
                      const Divider(),
                      const D10HCustomClSizedBoxWidget(
                        height: 100,
                      ),
                      const Row(
                        children: [
                          Text(
                            'Wedding Date: ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          Text(
                            '31 Jan 2022',
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 15),
                          ),
                        ],
                      ),
                      const D10HCustomClSizedBoxWidget(),
                      const Text(
                        'Ablne P Dejose & Aneesha Biju Wrote:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Thankyou Marriyo Matrimony for uniting us together and helping us mutually find the best life partners within each other',
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 15),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 200,
                        width: double.maxFinite,
                        child: Expanded(
                          flex: 1,
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: 5,
                              controller: ScrollController(),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: ((context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                        _userModel![widget.index]
                                            .fullSizeImage
                                            .toString(),
                                        fit: BoxFit.cover,
                                        height: 170,
                                        width: 170
                                        // width: double.maxFinite,
                                        ),
                                  ),
                                );
                              })),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
