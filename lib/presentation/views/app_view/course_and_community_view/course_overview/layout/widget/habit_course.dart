import 'package:flutter/material.dart';

import '../../../../../../../configuration/front_end_config.dart';
import '../../../../../../elements/custom_text/custom_text.dart';

class HabitCourse extends StatelessWidget {
  const HabitCourse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: FrontEndCngig.kHabitColor.withOpacity(0.13),
          image: DecorationImage(
              alignment: Alignment.topRight,
              image: AssetImage('assets/images/home_page_banner_image.png'))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            title: 'Habit\ncourses',
            fontsize: 25,
            textColor: FrontEndCngig.kTextColor,
            fontFamily: 'Klasik',
          ),
          CustomText(
              title:
                  'Find what fascinates you as you explore\nthese habit courses.',
              fontsize: 13,
              textColor: FrontEndCngig.kTextColor)
        ],
      ),
    );
  }
}
