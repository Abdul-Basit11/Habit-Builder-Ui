

import 'package:flutter/material.dart';

import '../../../../../../configuration/front_end_config.dart';
import '../../../../../elements/custom_button/custom_button.dart';


class ReminderButton extends StatelessWidget {

  final VoidCallback onTapp;

  const ReminderButton({super.key, required this.onTapp});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Custombutton(
          buttonbgColor: FrontEndCngig.kHabitColor,
          h: 50,
          textColor: FrontEndCngig.kWhiteColor,
          fontSize: 18,
          w: double.infinity,
          onTap: onTapp,
          borderRadius: 8,
          txt: 'Add Reminder'),
    );
  }
}
