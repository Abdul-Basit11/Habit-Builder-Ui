import 'package:flutter/material.dart';

import '../../../../../../../configuration/front_end_config.dart';
import '../../../../../../elements/custom_text/custom_text.dart';

class GeneralSettingTile extends StatelessWidget {
  final String settingName;
  final String settinsubTitle;
  final IconData icon;

  const GeneralSettingTile(
      {super.key,
      required this.settingName,
      required this.settinsubTitle,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(14)),
      child: Row(
        children: [
          Container(
            height: 38,
            width: 38,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: FrontEndCngig.kHabitColor.withOpacity(0.2),
            ),
            child: Center(
              child: Icon(
                icon,
                color: FrontEndCngig.kHabitColor,
              ),
            ),
          ),
          kWidth10,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                  title: settingName,
                  fontsize: 15,
                  textColor: FrontEndCngig.kTextColor),
              CustomText(
                  title: settinsubTitle,
                  fontsize: 13,
                  textColor: FrontEndCngig.kGreyColor),
            ],
          ),
          Spacer(),
          Icon(
            Icons.arrow_right,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
