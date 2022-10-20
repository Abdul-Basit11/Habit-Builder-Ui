import 'package:flutter/material.dart';
import 'package:habit_bilder_app/configuration/front_end_config.dart';
import 'package:habit_bilder_app/presentation/elements/custom_text/custom_text.dart';

class ReadABookText extends StatelessWidget {
  final String habitTitle;

  const ReadABookText({super.key, required this.habitTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: FittedBox(
        child: CustomText(
            title: habitTitle,
            fontsize: 14,
            textColor: FrontEndCngig.kTextColor),
      ),
    );
  }
}
