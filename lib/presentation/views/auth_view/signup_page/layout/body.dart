import 'package:flutter/material.dart';
import 'package:habit_bilder_app/configuration/front_end_config.dart';
import 'package:habit_bilder_app/presentation/elements/custom_button/custom_button.dart';
import 'package:habit_bilder_app/presentation/elements/custom_text/custom_text.dart';
import 'package:habit_bilder_app/presentation/elements/customtextfield/custom_text_field.dart';
import 'package:habit_bilder_app/presentation/views/auth_view/signup_page/layout/widget/google_facebook_btn.dart';
import 'package:habit_bilder_app/presentation/views/auth_view/signup_page/layout/widget/or_signin_with.dart';
import 'package:habit_bilder_app/presentation/views/auth_view/signup_page/layout/widget/top_image.dart';

class SignUpPageViewBody extends StatefulWidget {
  @override
  State<SignUpPageViewBody> createState() => _SignUpPageViewBodyState();
}

class _SignUpPageViewBodyState extends State<SignUpPageViewBody> {
  bool isChecked1 = false;
  bool isChecked2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FrontEndCngig.kScaffoldColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 40),
          child: SingleChildScrollView(

            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                TopImage(
                  ImagePath: 'assets/images/signup_page_image.png',
                ),
                k21,
                CustomText(
                  title: 'Create Your Account',
                  fontsize: 24,
                  textColor: FrontEndCngig.kTextColor,
                  fontFamily: 'Klasik',
                ),
                k32,

                /// name field
                Stack(
                  children: [
                    CuctomTextField(
                      prefixIcon: Icons.person_outline,
                      filled: true,
                      fillColor: FrontEndCngig.kWhiteColor,
                      hintText: 'Name',
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 40),
                      width: 2,
                      height: 50,
                      color: FrontEndCngig.kScaffoldColor,
                    )
                  ],
                ),
                k10,

                /// email field
                Stack(
                  children: [
                    CuctomTextField(
                      prefixIcon: Icons.mail_outline,
                      filled: true,
                      fillColor: FrontEndCngig.kWhiteColor,
                      hintText: 'Email',
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 40),
                      width: 2,
                      height: 50,
                      color: FrontEndCngig.kScaffoldColor,
                    )
                  ],
                ),
                k10,

                /// password field
                Stack(
                  children: [
                    CuctomTextField(
                      isPasswordField: true,
                      obsecureText: true,
                      prefixIcon: Icons.lock_outline,
                      filled: true,
                      fillColor: FrontEndCngig.kWhiteColor,
                      hintText: 'Password',
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 40),
                      width: 2,
                      height: 50,
                      color: FrontEndCngig.kScaffoldColor,
                    )
                  ],
                ),
                CheckboxListTile(
                    activeColor: FrontEndCngig.kHabitColor,
                    checkColor: FrontEndCngig.kTextColor,
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text(
                      'Keep me signed in',
                      style: TextStyle(
                          fontFamily: 'Manrope',
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: FrontEndCngig.kTextColor),
                    ),
                    value: isChecked1,
                    onChanged: (bool) {
                      setState(() {
                        isChecked1 = bool!;
                      });
                    }),
                CheckboxListTile(
                    activeColor: FrontEndCngig.kHabitColor,
                    checkColor: FrontEndCngig.kTextColor,
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text(
                      'Email me about special pricing and more',
                      style: TextStyle(
                          fontFamily: 'Manrope',
                          letterSpacing: 0,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: FrontEndCngig.kTextColor),
                    ),
                    value: isChecked2,
                    onChanged: (bool) {
                      setState(() {
                        isChecked2 = bool!;
                      });
                    }),
                k10,
                Custombutton(
                  fontWeight: FontWeight.w700,
                  h: 50,
                  fontSize: 15,
                  w: double.infinity,
                  onTap: () {},
                  borderRadius: 12,
                  txt: 'Create Account',
                  textColor: FrontEndCngig.kTextColor,
                  buttonbgColor: FrontEndCngig.kHabitColor,
                ),
                k12,
                OrSigninWith(),
                k12,
                GoogleFacebookBtn(),
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
                          Navigator.pop(context);
                        },
                        child: CustomText(
                            fontWeight: FontWeight.bold,
                            title: " Sign In ",
                            fontsize: 14,
                            textColor:
                            FrontEndCngig.kTextColor),
                      ),
                    ]),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
