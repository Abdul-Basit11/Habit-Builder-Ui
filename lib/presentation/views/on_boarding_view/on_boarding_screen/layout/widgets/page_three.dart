import 'package:flutter/material.dart';
import 'package:habit_bilder_app/configuration/front_end_config.dart';

import '../../../../../elements/custom_text/custom_text.dart';

class PageThree extends StatelessWidget {
  const PageThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              align: TextAlign.center,
              title: 'KEEP TRACK OF YOUR\nROGRESS',
              fontsize: 32,
              textColor: FrontEndCngig.kTextColor,
              fontFamily: 'Klasik',
              heigtht: 1.2,
            ),
            Image.asset(
              'assets/images/onboard_image_three.png',
              height: 399,
              fit: BoxFit.cover,
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
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Manrope',
                          color: FrontEndCngig.kHabitColor,
                          fontSize: 17)),
                ])),
          ],
        ),
      ),
    );
  }
}
