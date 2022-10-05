
import 'package:flutter/material.dart';

import '../../../../../../configuration/front_end_config.dart';
import '../../../../../elements/custom_text/custom_text.dart';


class AccountPlatform extends StatelessWidget {
final String loginPlatform;
final String ImagePath;

  const AccountPlatform({super.key, required this.loginPlatform, required this.ImagePath});

  @override
  Widget build(BuildContext context) {
    return   Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            ImagePath,
            height: 23,
            width: 23,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 20,),
          CustomText(
            fontWeight: FontWeight.bold,
            fontFamily: 'Manrope',
              title: loginPlatform,
              fontsize: 16,
              textColor: FrontEndCngig.kTextColor)
        ],
      ),
    );
  }
}
