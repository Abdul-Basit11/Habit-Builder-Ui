
import 'package:flutter/material.dart';

import '../../../../../../configuration/front_end_config.dart';
import '../../../../../elements/custom_text/custom_text.dart';


class GoogleFacebookBtn extends StatelessWidget {
  const GoogleFacebookBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12)),
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/google.png',
                  height: 23,
                  width: 23,
                  fit: BoxFit.cover,
                ),
                kWidth10,
                CustomText(
                    fontWeight: FontWeight.w700,

                    title: 'Google',
                    fontsize: 16,
                    textColor: FrontEndCngig.kTextColor)
              ],
            ),
          ),
        ),
        kWidth10,
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12)),
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/facebook.png',
                  height: 23,
                  width: 23,
                  fit: BoxFit.cover,
                ),
                kWidth10,
                CustomText(
                    fontWeight: FontWeight.w700,
                    title: 'Facebook',
                    fontsize: 16,
                    textColor: FrontEndCngig.kTextColor)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
