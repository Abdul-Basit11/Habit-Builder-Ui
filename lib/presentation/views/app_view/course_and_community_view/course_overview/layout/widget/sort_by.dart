import 'package:flutter/material.dart';

import '../../../../../../../configuration/front_end_config.dart';
import '../../../../../../elements/custom_text/custom_text.dart';

class SortBy extends StatelessWidget {
  const SortBy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomText(
            title: 'Sort By:',
            fontsize: 15,
            textColor: FrontEndCngig.kTextColor),
        kWidth4,
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          height: 30,
          width: 150,
          decoration: BoxDecoration(
              color: FrontEndCngig.kWhiteColor,
              borderRadius: BorderRadius.circular(13),
              border: Border.all(color: FrontEndCngig.kGreyColor)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                  title: 'Popular',
                  fontsize: 13,
                  textColor: FrontEndCngig.kTextColor),
              Spacer(),
              Icon(Icons.keyboard_arrow_down_sharp)
            ],
          ),
        ),
        kWidth4,
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            height: 30,
            decoration: BoxDecoration(
                color: FrontEndCngig.kWhiteColor,
                borderRadius: BorderRadius.circular(13),
                border: Border.all(color: FrontEndCngig.kGreyColor)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                    title: 'Filter',
                    fontsize: 13,
                    textColor: FrontEndCngig.kHabitColor),
                Spacer(),
                Icon(
                  Icons.keyboard_arrow_down_sharp,
                  color: FrontEndCngig.kHabitColor,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
