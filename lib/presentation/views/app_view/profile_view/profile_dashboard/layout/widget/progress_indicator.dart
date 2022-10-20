import 'package:flutter/cupertino.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../../../../../configuration/front_end_config.dart';
import '../../../../../../elements/custom_text/custom_text.dart';

class ProgressindicatorCustom extends StatelessWidget {
  final String insideIndicatorText;
  final Color progressColor;
  final String? rate;
  final double percent;
  bool isNull = false;

  ProgressindicatorCustom(
      {super.key,
      required this.isNull,
      required this.percent,
      required this.insideIndicatorText,
      required this.progressColor,
      this.rate});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircularPercentIndicator(
          animationDuration: 3000,
          animation: true,
          curve: Curves.easeInQuart,
          lineWidth: 3.5,
          circularStrokeCap: CircularStrokeCap.round,
          radius: 23,
          progressColor: progressColor,
          percent: percent,
          center: Text(insideIndicatorText),
        ),
        CustomText(
            title: isNull ? '$rate' : "",
            fontsize: 14,
            textColor: FrontEndCngig.kGreyColor)
      ],
    );
  }
}
