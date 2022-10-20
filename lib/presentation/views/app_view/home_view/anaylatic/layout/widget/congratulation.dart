import 'package:flutter/material.dart';

import '../../../../../../../configuration/front_end_config.dart';
import '../../../../../../elements/custom_button/custom_button.dart';
import '../../../../../../elements/custom_round_butto/round_button.dart';
import '../../../../../../elements/custom_text/custom_text.dart';

class Congratulation extends StatelessWidget {
  final VoidCallback createHabit;
  final VoidCallback continuebtn;

  const Congratulation(
      {super.key, required this.createHabit, required this.continuebtn});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Align(
          alignment: Alignment.topRight,
          child: RoundButton(
            widget: Icon(Icons.close),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        Image.asset(
          'assets/images/campimg_image.png',
          scale: 1.8,
        ),
        CustomText(
            fontWeight: FontWeight.bold,
            title: 'Congratulations!',
            fontsize: 20,
            textColor: FrontEndCngig.kTextColor),
        CustomText(
            align: TextAlign.center,
            title:
                'Ut enim ad minim veniam, quis nostrud\nexercitation ullamco laboris',
            fontsize: 14,
            textColor: FrontEndCngig.kGreyColor),
        Custombutton(
            buttonbgColor: FrontEndCngig.kHabitColor,
            textColor: FrontEndCngig.kTextColor,
            h: 55,
            fontSize: 14,
            fontWeight: FontWeight.bold,
            w: double.infinity,
            onTap: createHabit,
            borderRadius: 10,
            txt: 'Create New Habit'),
        Custombutton(
            borderColor: FrontEndCngig.kScaffoldColor,
            buttonbgColor: FrontEndCngig.kScaffoldColor,
            textColor: FrontEndCngig.kTextColor,
            h: 55,
            fontSize: 14,
            fontWeight: FontWeight.bold,
            w: double.infinity,
            onTap: continuebtn,
            borderRadius: 10,
            txt: 'Continue'),
      ],
    );
  }
}
