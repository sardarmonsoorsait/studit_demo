


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:studit/modules/sign_in/sign_in_controller.dart';



import '../../core/app_color.dart';




class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);
  bool isLoading = false;
  final controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (logic) {
      if (logic.status.isError) {
         isLoading = false;
      } 
      return Container(
        height: MediaQuery.of(context).size.height * .9,
        width: MediaQuery.of(context).size.width,
      decoration:BoxDecoration(image: DecorationImage(fit: BoxFit.cover,image:  AssetImage('assets/wall.jpg'))) ,
        child: Scaffold(
         backgroundColor: Colors.transparent,
          body: SafeArea(
              child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 70),
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * .8,
                height: MediaQuery.of(context).size.height * .8,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color:Colors.white.withOpacity(0.2),
                          blurRadius: 10,
                          spreadRadius: 2,
                          offset: const Offset(0, 0))
                    ],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.transparent),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 50,),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width * .6,
                     child: Image.asset(
  "assets/studit.png", 
),
                    ),
                    //  Container(
                    //   height: MediaQuery.of(context).size.height * 0.1,
                    //   width: MediaQuery.of(context).size.width * .6,
                    //  child: RiveAnimation.asset('assets/3608-7545-doodle-walk.riv')),
                    Text(
                      'Welcome',
                      style: TextStyle(color: kBoxBordercolor, fontSize: 30),
                    ),
                    const Text(
                      'Sign in to continue',
                      style: TextStyle(
                          color: kBoxBordercolor,
                          fontSize: 12,
                          fontFamily: 'Montserrat'),
                    ),
                    Container(
                      height: 50,
                      width: 230,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: kBoxBordercolor),
                          color: kBackgroundColor,
                          // boxShadow: [
                          //   BoxShadow(
                          //       color: kBoxShadowColor,
                          //       blurRadius: 10,
                          //       spreadRadius: 2,
                          //       offset: const Offset(0, 0))
                          // ]
                          ),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: logic.emailEditingController,
                              style: TextStyle(color: kBoxBordercolor),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  hintText: 'Email',
                                  hintStyle: TextStyle(color: kBoxBordercolor),
                                  icon: Icon(
                                    Icons.person,
                                    color: kBoxBordercolor,
                                  ),
                                  fillColor: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 230,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: kBoxBordercolor),
                          color: kBackgroundColor,
                          // boxShadow: [
                          //   BoxShadow(
                          //       color: kBoxShadowColor,
                          //       blurRadius: 5,
                          //       spreadRadius: 1,
                          //       offset: const Offset(0, 0))
                          // ]
                          ),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: logic.passwordEditingController,
                              style: TextStyle(color: kBoxBordercolor),
                              obscureText: true,
                             
                              validator: (s) => s!.isEmpty
                                  ? 'Confirm Password Required'
                                  : s == logic.passwordEditingController.text
                                      ? null
                                      : 'Password does not match',
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  hintText: 'Password',
                                  hintStyle: TextStyle(color: kBoxBordercolor),
                                  icon: Icon(
                                    Icons.lock_open,
                                    color: kBoxBordercolor,
                                  ),
                                  fillColor: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: (() {
                        isLoading = true;
                        logic.getLogin();
                      }),
                      child: Container(
                        height: 50,
                        width: 230,
                        decoration: BoxDecoration(
                            color: kBoxBordercolor,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: kBoxShadowColor,
                                  blurRadius: 2,
                                  spreadRadius: 1,
                                  offset: const Offset(0, 0))
                            ]),
                        child: Center(
                            child:isLoading?CircularProgressIndicator(): Text(
                          'Sign In',
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        )),
                      ),
                    ),
                    SizedBox(height: 100,)
                    // Row(
                    //   children: const [
                    //     Expanded(
                    //         child: Divider(
                    //       color: kBoxShadowColor,
                    //       thickness: 2,
                    //     )),
                    //     SizedBox(
                    //       width: 10,
                    //     ),
                    //     Text(
                    //       'OR',
                    //       style: TextStyle(color: Colors.white),
                    //     ),
                    //     SizedBox(
                    //       width: 10,
                    //     ),
                    //     Expanded(
                    //         child: Divider(
                    //       color: kBoxShadowColor,
                    //       thickness: 2,
                    //     ))
                    //   ],
                    // ),
                    // Container(
                    //   height: 50,
                    //   width: 230,
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(10),
                    //       border: Border.all(color: kBoxBordercolor),
                    //       color: kBackgroundColor,
                    //       boxShadow: [
                    //         BoxShadow(
                    //             color: kBoxShadowColor,
                    //             blurRadius: 5,
                    //             spreadRadius: 1,
                    //             offset: const Offset(0, 0))
                    //       ]),
                    //   child: Row(
                    //     children: [
                    //       SizedBox(
                    //         width: 20,
                    //       ),
                    //       Image.asset(
                    //         'assets/images/outlook.png',
                    //         height: 35,
                    //         width: 25,
                    //       ),
                    //       Text(
                    //         'Login with Outlook 360',
                    //         style: TextStyle(color: kTextColor, fontSize: 14),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // InkWell(
                    //   splashColor: Colors.orange,
                    //   onTap: () {
                    //    // Get.off(ForgetPasswordSendOtpPage());
                    //   },
                    //   child: Text(
                    //     'Forgot Password',
                    //     style: TextStyle(color: Colors.blue),
                    //   ),
                    // ),
                    // RichText(
                    //     text: TextSpan(
                    //         text: 'Don\'t have an account?',
                    //         style: TextStyle(color: Colors.grey),
                    //         children: [
                    //       TextSpan(
                    //           text: ' Register',
                    //           style: TextStyle(color: Colors.blue),
                    //           recognizer: TapGestureRecognizer()
                    //             ..onTap = () => Navigator.of(context).push(
                    //                 MaterialPageRoute(
                    //                     builder: (ctx) =>
                    //                         VisitorRegisterForm())))
                    //     ]))
                  ],
                ),
              ),
            ),
          )),
        ),
      );
    });
  }
}
