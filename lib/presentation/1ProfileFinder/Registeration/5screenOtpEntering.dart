import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:otp_fields/otp_fields.dart';
import 'package:http/http.dart' as http;
import 'package:profile_finder/core/utils/color_constant.dart';
import 'package:profile_finder/core/utils/size_utils.dart';
import 'package:profile_finder/presentation/1ProfileFinder/Registeration/6screenOtpSuccessful.dart';
import 'package:profile_finder/widgets/CustomWidgetsCl/CustomWidgets.dart';

import '../MatchingList/1screen_advertisement.dart';

class FiveOtpEnteringScreen extends StatefulWidget {
  final int timerr;
  final String emailid;
  final String userUidafterOtp;

  const FiveOtpEnteringScreen({
    super.key,
    required this.timerr,
    required this.emailid,
    required this.userUidafterOtp,
  });

  @override
  State<FiveOtpEnteringScreen> createState() => _FiveOtpEnteringScreenState();
}

class _FiveOtpEnteringScreenState extends State<FiveOtpEnteringScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final bool _passwordVisible = true;

  bool isOtpEmpty = true;

  late String userUid;

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      isOtpEmpty = true;
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    setState(() {
      isOtpEmpty = false;
    });
    super.dispose();
  }

  // void signIn(String email, password) async {
  //   // var url = "https://reqres.in/api/register";
  //   // var data = {'email': email, 'password': password};
  //   // var bodyy = jsonEncode(data);
  //   // var urlParse = Uri.parse(url);
  //   try {
  //     // Response response = await post(urlParse, body: bodyy);
  //     // Response response = await post(urlParse,);
  //     Response response = await post(Uri.parse("https://reqres.in/api/login"),
  //         // Uri.parse("http://restapi.adequateshop.com/api/authaccount/registration"),

  //         body: {'email': email, 'password': password});

  //     if (response.statusCode == 200) {
  //       var data = jsonDecode(response.body.toString());
  //       print(data['token']);
  //       print("Login successfully");
  //       Navigator.pushNamed(context, AppRoutes.iphone1313ProSixScreen);
  //     } else {
  //       print('Failed');
  //       _showToast(context, "Please Check");
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  void _showToast(BuildContext context, String msg) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Center(child: Text(msg)),
        // action: SnackBarAction(
        // label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar

        // ),
      ),
    );
  }

  TextEditingController otpController = TextEditingController();

  void otp(String url, String mail) async {
    var headers = {
      'Context-Type': 'application/json',
    };
    // print("$url$mail");

    var requestBody = {'user_otp': otpController.text};

    var response = await http.post(
      // Uri.parse("$url$mail"),
      Uri.parse(url),

      headers: headers,
      // body: jsonEncode(requestBody),
      body: requestBody,
    );

    if (response.statusCode == 200) {
      print('Otp Is Correct');
      print(response.body);

      //  Navigator.pushNamed(context, AppRoutes.iphone1313ProEightScreen);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return SixOtpSuccessfulScreen(
            emailid: mail,
          );
        }),
      );
    } else {
      print("errorCode: ${response.statusCode}");
      print(response.body);
      print(url);
      print(requestBody);

      Fluttertoast.showToast(
        backgroundColor: Colors.orange,
        textColor: Colors.white,
        msg: 'Invalid OTP',
        toastLength: Toast.LENGTH_SHORT,
      );
    }
  }

  // Widget otpField() {
  //   return OTPTextField(
  //     length: 4,
  //     width: MediaQuery.of(context).size.width,
  //     fieldWidth: 50,
  //     style: const TextStyle(fontSize: 17),
  //     textFieldAlignment: MainAxisAlignment.center,
  //     spaceBetween: 8,
  //     fieldStyle: FieldStyle.box,
  //     otpFieldStyle: OtpFieldStyle(
  //       backgroundColor: Colors.grey.shade300,
  //       enabledBorderColor: Colors.transparent,
  //     ),
  //     onChanged: (value) {
  //       if (value.length >= 4) {
  //         isOtpEmpty = false;
  //       } else {
  //         isOtpEmpty = true;
  //       }
  //     },
  //     onCompleted: (pin) {
  //       // print("Completed: " + pin);
  //       setState(() {
  //         otpController.text = pin;
  //       });

  //       // otp('http://34.235.126.169:8000/otp/', widget.emailid.toString());
  //     },
  //   );
  // }

  Widget otpField() {
    return OtpFieldsCustom(
      context: context,

      numberOfFields: 4,
      // width: MediaQuery.of(context).size.width,
      // fieldWidth: 50,
      style: const TextStyle(fontSize: 17),
      // textFieldAlignment: MainAxisAlignment.center,
      // spaceBetween: 8,
      // fieldStyle: FieldStyle.box,
      // otpFieldStyle: OtpFieldStyle(
      //   backgroundColor: Colors.grey.shade300,
      //   enabledBorderColor: Colors.transparent,
      // ),
      onCodeChanged: (value) {
        if (value.length >= 4) {
          isOtpEmpty = false;
          setState(() {
            otpController.text = value;
          });
        } else {
          isOtpEmpty = true;
        }
      },
      // onCompleted: (pin) {
      //   // print("Completed: " + pin);
      //   setState(() {
      //     otpController.text = pin;
      //   });

      //   // otp('http://34.235.126.169:8000/otp/', widget.emailid.toString());
      // },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteA700,
      // resizeToAvoidBottomInset: false,
      body:
          // OrientationBuilder(builder: (context, orientation) {
          //   if (orientation == Orientation.portrait) {
          //     return

          SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(children: [
          Image.asset('assets/images/img_background_first.png'),
          SingleChildScrollView(
              child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 25, right: 25, top: 10, bottom: 0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                            'assets/images/img_arrowleft_black_900.svg')),
                    const Padding(
                      padding: EdgeInsets.only(top: 50),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "OTP",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Text(
                                "Please enter the One-time Password to",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 17),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Text(
                                "verify your account",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 17),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    otpField(),
                    // Text("00:$timerr sec"),
                    // Container(
                    //     color: Colors.red,
                    //     height: 50,
                    //     child: Text(widget.timerr.toString())),
                    MyElevatedButtonDisableColor(
                        onPressed: () {
                          // otp('http://34.235.126.169:8000/otp/', widget.emailid.toString());
                          otp('http://${ApiService.ipAddress}/otp/${widget.userUidafterOtp}',
                              widget.emailid);

                          //  otp('http://54.211.84.169:8000/otp/L5VO6EMM8F9', widget.id.toString());

                          // Navigator.pushNamed(
                          //     context, AppRoutes.iphone1313ProEightScreen);
                        },
                        borderRadius: BorderRadius.circular(10),
                        width: double.maxFinite,
                        height: DeviceSize.itemHeight / 4,
                        backgroundColor: Colors.transparent,
                        isOtpEmpty: isOtpEmpty,
                        child: const Text(
                          'Validate',
                        )),

                    const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text("Resend one-Time OTP"),
                    ),
                  ]),
            ),
          ))
        ]),
      ),
      // }

      // if (orientation == Orientation.landscape) {
      //   return SingleChildScrollView(
      //     child: SizedBox(
      //       height: MediaQuery.of(context).size.height,
      //       width: MediaQuery.of(context).size.width,
      //       child: Stack(children: [
      //         Image.asset('assets/images/img_vector.png'),
      //         SingleChildScrollView(
      //           child: SizedBox(
      //             height: MediaQuery.of(context).size.height,
      //             width: MediaQuery.of(context).size.width,
      //             child: Padding(
      //               padding: const EdgeInsets.only(
      //                   left: 25, right: 25, top: 10, bottom: 0),
      //               child: Column(
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                   children: [
      //                     const Padding(
      //                       padding: EdgeInsets.only(top: 70),
      //                       child: Center(
      //                         child: Column(
      //                           // mainAxisAlignment: MainAxisAlignment.center,
      //                           // crossAxisAlignment: CrossAxisAlignment.end,
      //                           children: [
      //                             Text(
      //                               "Sign In",
      //                               style: TextStyle(
      //                                   fontWeight: FontWeight.bold,
      //                                   fontSize: 18),
      //                             ),
      //                             Padding(
      //                               padding: EdgeInsets.only(top: 10),
      //                               child: Text("You've been missed."),
      //                             ),
      //                           ],
      //                         ),
      //                       ),
      //                     ),
      //                     Column(
      //                       crossAxisAlignment: CrossAxisAlignment.start,
      //                       children: [
      //                         const Padding(
      //                           padding: EdgeInsets.only(top: 60),
      //                           child: Text(
      //                             "User Name/Email ID",
      //                             style: TextStyle(
      //                               color: Colors.grey,
      //                             ),
      //                           ),
      //                         ),
      //                         Padding(
      //                           padding: const EdgeInsets.only(top: 8),
      //                           child: Container(
      //                             height: 40,
      //                             decoration: BoxDecoration(
      //                                 color: Colors.grey.shade100,
      //                                 borderRadius: BorderRadius.circular(8)),
      //                             child: Padding(
      //                                 padding: const EdgeInsets.only(
      //                                   left: 10,
      //                                 ),
      //                                 child: TextFormField(
      //                                   autofillHints: const [
      //                                     AutofillHints.email
      //                                   ],
      //                                   controller: emailController,
      //                                   decoration: InputDecoration(
      //                                       border: InputBorder.none,
      //                                       hintText: "example@demo.com",
      //                                       hintStyle: const TextStyle(
      //                                           color: Colors.black),
      //                                       suffixIcon: Padding(
      //                                         padding:
      //                                             const EdgeInsets.all(13.0),
      //                                         child: SvgPicture.asset(
      //                                           'assets/images/img_user.svg',
      //                                         ),
      //                                       )),
      //                                 )),
      //                           ),
      //                         ),
      //                         const Padding(
      //                           padding: EdgeInsets.only(top: 20),
      //                           child: Text(
      //                             "Password",
      //                             style: TextStyle(color: Colors.grey),
      //                           ),
      //                         ),
      //                         Padding(
      //                           padding: const EdgeInsets.only(top: 8),
      //                           child: Container(
      //                             height: 40,
      //                             decoration: BoxDecoration(
      //                                 color: Colors.grey.shade100,
      //                                 borderRadius: BorderRadius.circular(8)),
      //                             child: Padding(
      //                               padding: const EdgeInsets.only(
      //                                 left: 10,
      //                               ),
      //                               child: TextFormField(
      //                                 autofillHints: const [
      //                                   AutofillHints.password
      //                                 ],
      //                                 obscureText: _passwordVisible,
      //                                 controller: passwordController,
      //                                 decoration: InputDecoration(
      //                                     suffixIcon: IconButton(
      //                                         icon: Icon(_passwordVisible
      //                                             ? Icons.visibility_off
      //                                             : Icons.visibility),
      //                                         onPressed: () {
      //                                           setState(() {
      //                                             _passwordVisible =
      //                                                 !_passwordVisible;
      //                                           });
      //                                         }),
      //                                     suffixIconColor: Colors.black,
      //                                     border: InputBorder.none,
      //                                     hintText: "********"),
      //                               ),
      //                             ),
      //                           ),
      //                         ),
      //                       ],
      //                     ),
      //                     const Center(
      //                       child: Text(
      //                         "Forgot Password",
      //                         style: TextStyle(
      //                             color: Colors.black,
      //                             decoration: TextDecoration.underline,
      //                             decorationThickness: 2
      //                             // decorationStyle: TextDecorationStyle.dashed,
      //                             ),
      //                       ),
      //                     ),
      //                     Padding(
      //                       padding: const EdgeInsets.only(top: 0),
      //                       child: GestureDetector(
      //                         onTap: () {
      //                           // if (passwordController.text != null) {
      //                           //   signIn(emailController.text.toString(),
      //                           //       passwordController.text.toString());
      //                           // } else {
      //                           //   _showToast(context, "Enter Password");
      //                           // }
      //                           // Navigator.pushNamed(
      //                           //     context, AppRoutes.FourteenScreenscr);
      //                         },
      //                         child: Container(
      //                           decoration: BoxDecoration(
      //                               gradient: const LinearGradient(colors: [
      //                                 Color.fromARGB(255, 25, 50, 192),
      //                                 Color.fromARGB(255, 25, 50, 192),
      //                                 // Colors.indigo,
      //                                 Colors.purple,
      //                                 Color.fromARGB(255, 219, 110, 238),
      //                               ]),
      //                               borderRadius: BorderRadius.circular(8)),
      //                           height: 50,
      //                           // width: 296,
      //                           child: const Center(
      //                               child: Text(
      //                             "Sign In",
      //                             style: TextStyle(
      //                                 color: Colors.white,
      //                                 fontWeight: FontWeight.bold),
      //                           )),
      //                         ),
      //                       ),
      //                     ),
      //                     const Padding(
      //                       padding: EdgeInsets.only(top: 20),
      //                       child: Center(
      //                         child: Text(
      //                           "Sign In with",
      //                           style: TextStyle(
      //                               // fontWeight: FontWeight.bold
      //                               ),
      //                           // textAlign: TextAlign.end,
      //                         ),
      //                       ),
      //                     ),
      //                     Padding(
      //                       padding: const EdgeInsets.only(top: 10),
      //                       child: Row(
      //                         mainAxisAlignment: MainAxisAlignment.center,
      //                         children: [
      //                           Padding(
      //                             padding: const EdgeInsets.all(8.0),
      //                             child: Container(
      //                               height: 40,
      //                               width: 40,
      //                               decoration: const BoxDecoration(
      //                                 color: Colors.white,
      //                                 shape: BoxShape.circle,
      //                               ),
      //                               child: Padding(
      //                                 padding: const EdgeInsets.all(12.0),
      //                                 child: SvgPicture.asset(
      //                                     'assets/images/img_icons8google1.svg'),
      //                               ),
      //                             ),
      //                           ),
      //                           Padding(
      //                             padding: const EdgeInsets.all(8.0),
      //                             child: SvgPicture.asset(
      //                               // 'assets/images/img_facebook_deep_purple_a200.svg'),

      //                               'assets/images/img_floatingicon.svg',
      //                               height: 40,
      //                             ),
      //                           ),
      //                           // git config --global user.email "you@example.com"
      //                           // git config --global user.name "Your Name"
      //                           Padding(
      //                             padding: const EdgeInsets.all(8.0),
      //                             child: Container(
      //                               height: 40,
      //                               width: 40,
      //                               decoration: const BoxDecoration(
      //                                 color: Colors.white,
      //                                 shape: BoxShape.circle,
      //                               ),
      //                               child: Padding(
      //                                 padding: const EdgeInsets.all(12.0),
      //                                 child: SvgPicture.asset(
      //                                     'assets/images/img_applefill.svg'),
      //                               ),
      //                             ),
      //                           )
      //                         ],
      //                       ),
      //                     ),
      //                     Padding(
      //                       padding: const EdgeInsets.only(top: 10),
      //                       child: Center(
      //                         child: Row(
      //                           mainAxisAlignment: MainAxisAlignment.center,
      //                           children: [
      //                             const Text(
      //                               "Don't Have Account Already?",
      //                               style: TextStyle(),
      //                               // textAlign: TextAlign.end,
      //                             ),
      //                             Padding(
      //                               padding: const EdgeInsets.only(left: 10),
      //                               child: InkWell(
      //                                 onTap: () {
      //                                   Navigator.pushNamed(context,
      //                                       AppRoutes.threeSigninScreen);
      //                                 },
      //                                 child: const SizedBox(
      //                                   // color: Colors.white,
      //                                   height: 30,
      //                                   child: Center(
      //                                     child: Text(
      //                                       "Sign In",
      //                                       style: TextStyle(
      //                                           fontWeight: FontWeight.bold,
      //                                           color: Color.fromARGB(
      //                                               255, 69, 49, 245)),
      //                                       // textAlign: TextAlign.end,
      //                                     ),
      //                                   ),
      //                                 ),
      //                               ),
      //                             ),
      //                           ],
      //                         ),
      //                       ),
      //                     ),
      //                   ]),
      //             ),
      //           ),
      //         )
      //       ]),
      //     ),
      //   );
      // }

      //   return Container();
      // }),
    );
  }
}
