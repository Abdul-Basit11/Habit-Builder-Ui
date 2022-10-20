import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habit_bilder_app/backend/model/user_model.dart';
import 'package:habit_bilder_app/backend/services/auth_services.dart';
import 'package:habit_bilder_app/backend/services/system_services.dart';
import 'package:habit_bilder_app/configuration/front_end_config.dart';
import 'package:habit_bilder_app/presentation/elements/custom_button/custom_button.dart';
import 'package:habit_bilder_app/presentation/elements/custom_text/custom_text.dart';
import 'package:habit_bilder_app/presentation/elements/customtextfield/custom_text_field.dart';
import 'package:habit_bilder_app/presentation/views/auth_view/signup_page/layout/widget/google_facebook_btn.dart';
import 'package:habit_bilder_app/presentation/views/auth_view/signup_page/layout/widget/or_signin_with.dart';
import 'package:habit_bilder_app/presentation/views/auth_view/signup_page/layout/widget/top_image.dart';

import '../../../../../navigation/navigation_routes_name.dart';
import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';

class SignUpPageViewBody extends StatefulWidget {
  @override
  State<SignUpPageViewBody> createState() => _SignUpPageViewBodyState();
}

class _SignUpPageViewBodyState extends State<SignUpPageViewBody> {
  bool isChecked1 = false;
  bool isChecked2 = false;
  final TextEditingController _namecontroller = TextEditingController();

  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final _form = GlobalKey<FormState>();

  /// loading function
  bool isLoading = false;

  /// loading true
  void makeLoadingTrue() {
    setState(() {
      isLoading = true;
    });
  }

  /// isloading false
  void makeLoadingFalse() {
    setState(() {
      isLoading = false;
    });
  }

  /// function class
  SystemServices systemServices = SystemServices();
  AuthServices authServices = AuthServices();

  @override
  Widget build(BuildContext context) {
    return BlurryModalProgressHUD(
      inAsyncCall: isLoading,
      color: FrontEndCngig.kHabitColor.withOpacity(0.5),
      blurEffectIntensity: 2,
      progressIndicator: CupertinoActivityIndicator(
        color: FrontEndCngig.kTextColor,
        radius: 15,
        animating: true,
      ),
      child: Scaffold(
        backgroundColor: FrontEndCngig.kScaffoldColor,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Form(
                key: _form,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TopImage(
                      ImagePath: 'assets/images/signup_page_image.png',
                    ),
                    k21,
                    buildCustomText(),
                    k32,

                    /// name field
                    Stack(
                      children: [
                        CuctomTextField(
                          controller: _namecontroller,
                          validator: (val) {
                            if (val.isEmpty) {
                              return 'Plz enter the your name';
                            } else
                              null;
                          },
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
                          controller: _emailcontroller,
                          validator: (val) {
                            if (val.isEmpty) {
                              return 'Plz enter email';
                            } else
                              null;
                          },
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
                          controller: _passwordcontroller,
                          validator: (val) {
                            if (val.isEmpty) {
                              return 'Plz enter the password';
                            } else if (val.length < 6) {
                              return 'Plz enter strong password';
                            }
                          },
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
                        selectedTileColor: FrontEndCngig.kTextColor,
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

                    /// create button..
                    Custombutton(
                      fontWeight: FontWeight.w700,
                      h: 50,
                      fontSize: 15,
                      w: double.infinity,
                      onTap: () {
                        if (_form.currentState!.validate()) {
                          makeLoadingTrue();
                          authServices
                              .signUpUser(
                                  email: _emailcontroller.text,
                                  password: _passwordcontroller.text)
                              .then((value) {
                            systemServices
                                .createUser(HabitUserModel(
                                    uid: FirebaseAuth.instance.currentUser!.uid,
                                    email: _emailcontroller.text,
                                    password: _passwordcontroller.text))
                                .then((value) {
                              makeLoadingFalse();
                              Navigator.pushNamed(
                                  context, RoutesName.bottomBarViewRoute);
                            }).onError((error, stackTrace) {
                              makeLoadingFalse();
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: CustomText(
                                  title: 'Error Occured',
                                  textColor: FrontEndCngig.kTextColor,
                                  fontsize: 14,
                                ),
                                backgroundColor: FrontEndCngig.kRedColor,
                              ));
                            });
                          }).onError((error, stackTrace) {
                            makeLoadingFalse();
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              duration: Duration(milliseconds: 1000),
                              content: CustomText(
                                fontsize: 15,
                                textColor: FrontEndCngig.kWhiteColor,
                                title: '${error.toString()}',
                              ),
                              backgroundColor: FrontEndCngig.kRedColor,
                            ));
                          });
                        }
                      },
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
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      CustomText(
                          title: "Don't have an account? ",
                          fontsize: 14,
                          textColor: FrontEndCngig.kTextColor),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: CustomText(
                            fontWeight: FontWeight.bold,
                            title: " Sign In ",
                            fontsize: 14,
                            textColor: FrontEndCngig.kTextColor),
                      ),
                    ]),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  CustomText buildCustomText() {
    return CustomText(
      title: 'Create Your Account',
      fontsize: 24,
      textColor: FrontEndCngig.kTextColor,
      fontFamily: 'Klasik',
    );
  }
}
