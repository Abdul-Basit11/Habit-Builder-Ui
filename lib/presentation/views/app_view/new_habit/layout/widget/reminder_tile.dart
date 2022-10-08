

import 'package:flutter/material.dart';

import '../../../../../../configuration/front_end_config.dart';
import '../../../../../elements/custom_text/custom_text.dart';

class ReminderTile extends StatelessWidget {
  final String reminderTIME;

  const ReminderTile({super.key, required this.reminderTIME});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18),
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          buildReminderText(),
          Spacer(),
          CustomText(
              title: reminderTIME,
              fontsize: 15,
              textColor: FrontEndCngig.kHabitColor),
          Icon(
            Icons.arrow_forward_ios_rounded,
            size: 18,
            color: FrontEndCngig.kHabitColor,
          )
        ],
      ),
    );
  }
}
CustomText buildReminderText() {
  return CustomText(
      title: 'Reminder', fontsize: 15, textColor: FrontEndCngig.kTextColor);
}