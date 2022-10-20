import 'package:flutter/material.dart';

import '../../../../../../../configuration/front_end_config.dart';
import '../../../../../../elements/custom_text/custom_text.dart';

class StartThisHabit extends StatelessWidget {
  const StartThisHabit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 170,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                k32,
                CustomText(
                  title: 'Start this habit',
                  fontsize: 22,
                  textColor: FrontEndCngig.kTextColor,
                  fontFamily: 'Klasik',
                ),
                k10,
                CustomText(
                    align: TextAlign.center,
                    title:
                        'ullamco laboris nisi ut aliquip ex eacommodo\nconsequat dolore. ',
                    fontsize: 12,
                    textColor: FrontEndCngig.kGreyColor),
                k10,
                Image.asset(
                  'assets/images/down_arrow.png',
                  scale: 5,
                ),
              ],
            ),
          ),
          Positioned(
            top: 20,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 38,
              backgroundImage:
                  AssetImage('assets/images/start_this_habit_image.png'),
            ),
          )
        ],
      ),
    );
  }
}
