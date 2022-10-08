
import 'package:flutter/material.dart';

import '../../../../../../configuration/front_end_config.dart';
import '../../../../../elements/custom_text/custom_text.dart';


class TimePickerCancelAndSave extends StatelessWidget {

  final VoidCallback onCancelTap;
  final VoidCallback onSaveTap;

  const TimePickerCancelAndSave({super.key, required this.onCancelTap, required this.onSaveTap});

  @override
  Widget build(BuildContext context) {
    return      Row(
      children: [
        CustomText(
          onTap: onCancelTap,
            title: 'Cancel',
            fontsize: 17,
            textColor:
            FrontEndCngig.kHabitColor),
        Spacer(),
        CustomText(
            fontWeight: FontWeight.bold,
            title: 'Add Reminders',
            fontsize: 17,
            textColor:
            FrontEndCngig.kTextColor),
        Spacer(),
        CustomText(
            onTap: onSaveTap,
            title: 'Save',
            fontsize: 17,
            textColor:
            FrontEndCngig.kHabitColor),

      ],
    );
  }
}
