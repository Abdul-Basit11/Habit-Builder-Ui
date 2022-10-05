import 'package:flutter/material.dart';
import 'package:habit_bilder_app/configuration/front_end_config.dart';
import 'package:habit_bilder_app/presentation/elements/custom_text/custom_text.dart';
import 'package:habit_bilder_app/presentation/elements/customtextfield/custom_text_field.dart';

import '../../../../elements/custom_button/custom_button.dart';
import '../../login_page/layout/widget/help_button.dart';

class ResetPaddwordViewBody extends StatelessWidget {
  const ResetPaddwordViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: FrontEndCngig.kScaffoldColor,
        extendBodyBehindAppBar: true,
        extendBody: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: Padding(
            padding: const EdgeInsets.only(left: 17.0),
            child: HelpButton(
              iconPath: 'assets/images/back_arrow.png',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    k32,
                    CustomText(
                      title: 'Forgot Your Password',
                      fontsize: 24,
                      textColor: FrontEndCngig.kTextColor,
                      fontFamily: 'Klasik',
                    ),
                    k12,
                    Image.asset('assets/images/reset_pasword_image.png'),
                    k32,
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(14)),
                      child: Column(
                        children: [
                          CustomText(
                              align: TextAlign.center,
                              title:
                                  'Enter your registered email below to receive\npassword reset instruction',
                              fontsize: 14,
                              textColor: FrontEndCngig.kTextColor),
                          k12,
                          CuctomTextField(
                              filled: true,
                              fillColor: FrontEndCngig.kTFBackGroundColor.withOpacity(0.9),
                              hintText: 'Name'),
                          k12,
                          Custombutton(
                              fontWeight: FontWeight.bold,
                              buttonbgColor: FrontEndCngig.kHabitColor,
                              h: 50,
                              textColor: FrontEndCngig.kTextColor,
                              fontSize: 16,
                              w: double.infinity,
                              onTap: () {},
                              borderRadius: 12,
                              txt: 'Send Reset Link'),
                        ],
                      ),
                    ),
                   k32,
                    Row(
                        mainAxisAlignment:
                        MainAxisAlignment.center,
                        children: [
                          CustomText(
                              title: "Remember Password? ",
                              fontsize: 14,
                              textColor:
                              FrontEndCngig.kTextColor),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: CustomText(
                                fontWeight: FontWeight.bold,
                                title: " Login ",
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
        ),
      ),
    );
  }
}
