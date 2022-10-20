import 'package:flutter/material.dart';
import 'package:habit_bilder_app/presentation/elements/custom_text/custom_text.dart';

import '../../../../../../../configuration/front_end_config.dart';
import 'weak_frequency.dart';

class HabitFrequencyContainerTop extends StatelessWidget {
  const HabitFrequencyContainerTop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// habit frequency
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 10, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                    title: 'Habit Frequency',
                    fontsize: 16,
                    textColor: FrontEndCngig.kTextColor),
                Row(
                  children: [
                    CustomText(
                        title: 'Custom',
                        fontsize: 16,
                        textColor: FrontEndCngig.kHabitColor),
                    Image.asset(
                      'assets/images/arrow_forward.png',
                      scale: 4,
                    ),
                  ],
                )
              ],
            ),
          ),
          k20,
          Divider(
            thickness: 1,
            height: 1,
            color: FrontEndCngig.kHabitColor.withOpacity(0.3),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              WeakFrequency(
                frequency: 5,
              ),
              WeakFrequency(
                frequency: 10,
              ),
              WeakFrequency(
                frequency: 20,
              ),
              WeakFrequency(
                frequency: 40,
              ),
              WeakFrequency(
                frequency: 60,
              ),
              WeakFrequency(
                frequency: 80,
              ),
              WeakFrequency(
                frequency: 100,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
