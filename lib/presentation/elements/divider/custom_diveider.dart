import 'package:flutter/material.dart';
import 'package:habit_bilder_app/configuration/front_end_config.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1,
      height: 1,
      color: FrontEndCngig.kHabitColor.withOpacity(0.4),
    );
  }
}
