import 'package:flutter/material.dart';

import '../../../../../../../configuration/front_end_config.dart';
import '../../../../../../elements/custom_text/custom_text.dart';

class TimeContainer extends StatelessWidget {
  final String time;

  const TimeContainer({super.key, required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34,
      width: 34,
      decoration: BoxDecoration(
          color: Colors.grey.shade300, borderRadius: BorderRadius.circular(8)),
      child: Center(
        child: CustomText(
          fontWeight: FontWeight.bold,
          title: time,
          fontsize: 12,
          textColor: FrontEndCngig.kTextColor,
        ),
      ),
    );
  }
}
