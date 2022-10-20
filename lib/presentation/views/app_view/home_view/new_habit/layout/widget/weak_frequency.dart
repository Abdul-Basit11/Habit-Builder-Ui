import 'package:flutter/material.dart';
import 'package:habit_bilder_app/configuration/front_end_config.dart';
import 'package:habit_bilder_app/presentation/elements/custom_text/custom_text.dart';

class WeakFrequency extends StatelessWidget {
  final double frequency;

  const WeakFrequency({super.key, required this.frequency});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 73,
        decoration: BoxDecoration(
            border: Border(
                right: BorderSide(
                    color: FrontEndCngig.kHabitColor.withOpacity(0.3)))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomText(
                title: '${frequency.round()}%',
                fontsize: 12,
                textColor: FrontEndCngig.kTextColor),
            Container(
              height: 34,
              width: 34,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        FrontEndCngig.kHabitColor,
                        FrontEndCngig.kHabitColor.withOpacity(0.2),
                        FrontEndCngig.kHabitColor.withOpacity(0.2),
                      ],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      stops: [frequency / 100, frequency / 100, 1]),
                  color: FrontEndCngig.kHabitColor,
                  borderRadius: BorderRadius.circular(10)),
            ),
          ],
        ),
      ),
    );
  }
}
