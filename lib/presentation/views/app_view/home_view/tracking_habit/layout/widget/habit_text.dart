import 'package:flutter/material.dart';
import 'package:habit_bilder_app/configuration/front_end_config.dart';
import 'package:habit_bilder_app/presentation/elements/custom_text/custom_text.dart';

class HabitText extends StatelessWidget {
  const HabitText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomText(
        title: 'HABITS', fontsize: 14, textColor: FrontEndCngig.kTextColor);
  }
}
