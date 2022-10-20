import 'package:flutter/material.dart';

import '../../../../../../../configuration/front_end_config.dart';
import '../../../../../../elements/custom_round_butto/round_button.dart';
import '../../../../../../elements/custom_text/custom_text.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RoundButton(
            widget: Image.asset(
              'assets/images/back_arrow.png',
              scale: 4,
            ),
            onTap: () {
              Navigator.pop(context);
            }),
        Spacer(),
        CustomText(
            fontWeight: FontWeight.bold,
            title: 'Read A Book',
            fontsize: 18,
            textColor: FrontEndCngig.kTextColor),
        Spacer(),
        RoundButton(
            widget: Image.asset(
              'assets/images/edit_icon.png',
              scale: 4,
            ),
            onTap: () {}),
      ],
    );
  }
}
