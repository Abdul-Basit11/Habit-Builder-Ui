import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habit_bilder_app/backend/services/auth_services.dart';
import 'package:habit_bilder_app/configuration/front_end_config.dart';
import 'package:habit_bilder_app/navigation/navigation_routes_name.dart';
import 'package:habit_bilder_app/presentation/elements/custom_button/custom_button.dart';
import 'package:habit_bilder_app/presentation/elements/custom_text/custom_text.dart';
import 'package:habit_bilder_app/presentation/elements/customtextfield/custom_text_field.dart';
import 'package:habit_bilder_app/presentation/elements/divider/custom_diveider.dart';
import 'package:habit_bilder_app/presentation/views/auth_view/login_page/layout/widget/account_platform.dart';

import '../../../../elements/custom_round_butto/round_button.dart';

class LoginPageViewBody extends StatefulWidget {
  @override
  State<LoginPageViewBody> createState() => _LoginPageViewBodyState();
}

class _LoginPageViewBodyState extends State<LoginPageViewBody> {
  final TextEditingController _emailcontroller = TextEditingController();

  final TextEditingController _passcontroller = TextEditingController();

  final _form = GlobalKey<FormState>();

  AuthServices authServices = AuthServices();
  bool isLoading = false;

  void makeLoadingTrue() {
    setState(() {
      isLoading = true;
    });
  }

  void makeLoadingFalse() {
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: BlurryModalProgressHUD(
        inAsyncCall: isLoading,
        color: FrontEndCngig.kHabitColor.withOpacity(0.5),
        blurEffectIntensity: 2,
        progressIndicator: CupertinoActivityIndicator(
          color: FrontEndCngig.kTextColor,
          radius: 15,
          animating: true,
        ),
        child: Scaffold(
            extendBodyBehindAppBar: true,
            extendBody: true,
            appBar: buildAppBar(),

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
                            buildLoginTitle(),
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
                          child: Form(
                            key: _form,
                            child: Column(
                              children: [
                                buildCustomText(),
                                k12,
                                CustomDivider(),
                                k12,
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Column(
                                    children: [
                                      k10,

                                      /// email field
                                      CuctomTextField(
                                        controller: _emailcontroller,
                                        validator: (val) {
                                          if (val.isEmpty) {
                                            return 'Plz Enter Your Email';
                                          }
                                        },
                                        filled: true,
                                        fillColor:
                                            FrontEndCngig.kTFBackGroundColor,
                                        prefixIcon: Icons.email_outlined,
                                        hintText: 'Jonathansmth@gmail.com',
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      CuctomTextField(
                                        controller: _passcontroller,
                                        validator: (val) {
                                          if (val.isEmpty) {
                                            return 'Plz enter the password';
                                          } else if (val.length < 6) {
                                            return 'Plz enter strong password';
                                          }
                                        },
                                        filled: true,
                                        fillColor:
                                            FrontEndCngig.kTFBackGroundColor,
                                        prefixIcon: Icons.lock_outline,
                                        hintText: 'Password',
                                        obsecureText: true,
                                        isPasswordField: true,
                                      ),
                                      k10,
                                      Custombutton(
                                          fontWeight: FontWeight.bold,
                                          buttonbgColor:
                                              FrontEndCngig.kHabitColor,
                                          h: 50,
                                          textColor: FrontEndCngig.kTextColor,
                                          fontSize: 16,
                                          w: double.infinity,
                                          onTap: () {
                                            if (_form.currentState!
                                                .validate()) {
                                              makeLoadingTrue();
                                              authServices
                                                  .loginUser(
                                                email: _emailcontroller.text,
                                                password: _passcontroller.text,
                                              )
                                                  .then((value) {
                                                makeLoadingFalse();
                                                Navigator.pushNamed(
                                                    context,
                                                    RoutesName
                                                        .bottomBarViewRoute);
                                              }).onError((error, stackTrace) {
                                                makeLoadingFalse();
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                  content:
                                                      Text('No User Found'),
                                                  backgroundColor:
                                                      FrontEndCngig.kRedColor,
                                                ));
                                              });
                                            }
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
                                              decoration:
                                                  TextDecoration.underline),
                                        ),
                                      ),
                                      k10,
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CustomText(
                                                title:
                                                    "Don't have an account? ",
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
                        ),
                      ))
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.transparent),
      elevation: 0,
      backgroundColor: Colors.transparent,
      actions: [
        RoundButton(
          onTap: () {},
          widget: Icon(
            Icons.question_mark_rounded,
            color: FrontEndCngig.kTextColor,
          ),
        ),
      ],
    );
  }

  CustomText buildLoginTitle() {
    return CustomText(
      align: TextAlign.center,
      title: 'WELCOME TO\nMonumental habits',
      fontsize: 29,
      textColor: FrontEndCngig.kTextColor,
      fontFamily: 'Klasik',
    );
  }

  CustomText buildCustomText() {
    return CustomText(
        fontWeight: FontWeight.bold,
        title: 'Log in with email',
        fontFamily: 'Manrope',
        fontsize: 16,
        textColor: FrontEndCngig.kTextColor);
  }
}
