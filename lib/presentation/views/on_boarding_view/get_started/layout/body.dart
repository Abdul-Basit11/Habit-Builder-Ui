import 'package:flutter/material.dart';
import 'package:habit_bilder_app/navigation/navigation_routes_name.dart';
import 'package:habit_bilder_app/presentation/elements/custom_button/custom_button.dart';

import '../../../../../configuration/front_end_config.dart';
import '../../../../elements/custom_text/custom_text.dart';

class GetStartedViewBody extends StatelessWidget {
  const GetStartedViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              align: TextAlign.center,
              title: 'JOIN A SUPPORTIVE\nCOMMUNITY',
              fontsize: 32,
              textColor: FrontEndCngig.kTextColor,
              fontFamily: 'Klasik',
              heigtht: 1.2,
            ),
            FittedBox(
                child: Image.asset(
              'assets/images/get_started_image.png',
              height: 399,
              fit: BoxFit.cover,
            )),
            SizedBox(
              height: 90,
            ),
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  TextSpan(
                      text: 'We Can',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Manrope',
                          color: FrontEndCngig.kTextColor,
                          fontSize: 17)),

                  /// help you text
                  TextSpan(
                      text: ' Help You',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Manrope',
                          color: FrontEndCngig.kHabitColor,
                          fontSize: 17)),
                  TextSpan(
                      text: ' To Be Beter\n',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Manrope',
                          color: FrontEndCngig.kTextColor,
                          fontSize: 17)),
                  TextSpan(
                      text: ' Version Of',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Manrope',
                        color: FrontEndCngig.kTextColor,
                        fontSize: 17,
                      )),
                  TextSpan(
                      text: ' Yourself\n',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Manrope',
                          color: FrontEndCngig.kHabitColor,
                          fontSize: 17)),
                ])),
            SizedBox(
              height: 23,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Custombutton(
                fontWeight: FontWeight.bold ,
                fontSize: 16,
                textColor: FrontEndCngig.kTextColor,
                buttonbgColor: FrontEndCngig.kPrimaryColor,
                h: 60,
                w: double.infinity,
                onTap: () {
              Navigator.pushNamed(context, RoutesName.loginPageRout);
                },
                borderRadius: 8,
                txt: 'Get Started',
              ),
            )
          ],
        ),
      ),
    );
  }
}
