import 'package:flutter/material.dart';
import 'package:habit_bilder_app/configuration/front_end_config.dart';
import 'package:habit_bilder_app/navigation/navigation_routes_name.dart';
import 'package:habit_bilder_app/presentation/elements/custom_button/custom_button.dart';
import 'package:habit_bilder_app/presentation/elements/custom_text/custom_text.dart';
import 'package:habit_bilder_app/presentation/elements/customtextfield/custom_text_field.dart';
import 'package:habit_bilder_app/presentation/views/auth_view/login_page/layout/widget/account_platform.dart';

import '../../../../elements/custom_round_butto/round_button.dart';

class LoginPageViewBody extends StatelessWidget {
  const LoginPageViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          extendBodyBehindAppBar: true,
          extendBody: true,
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.transparent),
            elevation: 0,
            backgroundColor: Colors.transparent,
            actions: [
              RoundButton(
                onTap: (){},
                 widget: Icon(Icons.question_mark_rounded,color: FrontEndCngig.kTextColor,),
              ),
            ],
          ),

          /// image
          body: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    alignment: Alignment.topRight,
                    image: AssetImage(
                      'assets/images/log_in_background_image.png',
                    ))),
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    FrontEndCngig.kHabitColor.withOpacity(0.2),
                    FrontEndCngig.kHabitColor.withOpacity(0.2),
                  ])),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(
                      flex: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            align: TextAlign.center,
                            title: 'WELCOME TO\nMonumental habits',
                            fontsize: 29,
                            textColor: FrontEndCngig.kTextColor,
                            fontFamily: 'Klasik',
                          ),
                          SizedBox(
                            height: 41,
                          ),
                          AccountPlatform(
                            ImagePath: 'assets/images/google.png',
                            loginPlatform: 'Continue with  Google',
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          AccountPlatform(
                            loginPlatform: 'Continue with  Facebook',
                            ImagePath: 'assets/images/facebook.png',
                          ),
                        ],
                      ),
                    ),
                    k21,

                    /// bottom white COntainer
                    Expanded(
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(25),
                                topLeft: Radius.circular(25),
                              )),
                          child: SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            child: Column(
                              children: [
                                CustomText(
                                    fontWeight: FontWeight.bold,
                                    title: 'Log in with email',
                                    fontFamily: 'Manrope',
                                    fontsize: 16,
                                    textColor: FrontEndCngig.kTextColor),
                                k12,
                                Divider(
                                  thickness: 1,
                                  color: FrontEndCngig.kHabitColor.withOpacity(
                                      0.2),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                                  child: Column(
                                    children: [
                                      k10,
                                      CuctomTextField(
                                        filled: true,
                                        fillColor: FrontEndCngig
                                            .kTFBackGroundColor,
                                        prefixIcon: Icons.email_outlined,
                                        hintText: 'Jonathansmth@gmail.com',
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      CuctomTextField(
                                        filled: true,
                                        fillColor: FrontEndCngig
                                            .kTFBackGroundColor,
                                        prefixIcon: Icons.lock_outline,
                                        hintText: 'Password',
                                        obsecureText: true,
                                        isPasswordField: true,
                                      ),
                                      k10,
                                      Custombutton(
                                          fontWeight: FontWeight.bold,

                                          buttonbgColor: FrontEndCngig
                                              .kHabitColor,
                                          h: 50,
                                          textColor: FrontEndCngig.kTextColor,
                                          fontSize: 16,
                                          w: double.infinity,
                                          onTap: () {
                                            Navigator.pushNamed(context,
                                                RoutesName.bottomBarViewRoute);
                                          },
                                          borderRadius: 12,
                                          txt: 'Log in'),
                                      k10,
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pushNamed(context,
                                              RoutesName.resetPasswordRoute);
                                        },
                                        child: Text(
                                          'Forgot Password ?',
                                          style: TextStyle(
                                              decoration: TextDecoration
                                                  .underline),
                                        ),
                                      ),
                                      k10,
                                      Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            CustomText(
                                                title: "Don't have an account? ",
                                                fontsize: 14,
                                                textColor:
                                                FrontEndCngig.kTextColor),
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.pushNamed(context,
                                                    RoutesName.signupPageRoute);
                                              },
                                              child: CustomText(
                                                  fontWeight: FontWeight.bold,
                                                  title: " Sign up ",
                                                  fontsize: 14,
                                                  textColor:
                                                  FrontEndCngig.kTextColor),
                                            ),
                                          ]),
                                      k10,
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ))
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
