import 'package:flutter/material.dart';

import '../../../../../../../configuration/front_end_config.dart';
import '../../../../../../elements/custom_text/custom_text.dart';

class BillingMethods extends StatelessWidget {
  final IconData billing;
  final String ktext;
  final IconData? arrow;
  final VoidCallback on;

  const BillingMethods(
      {super.key,
      required this.billing,
      required this.ktext,
      this.arrow,
      required this.on});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: on,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Container(
              height: 38,
              width: 38,
              decoration: BoxDecoration(
                  color: FrontEndCngig.kHabitColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8)),
              child: Center(
                child: Icon(
                  billing,
                  color: FrontEndCngig.kHabitColor,
                ),
              ),
            ),
            kWidth10,
            CustomText(
                title: ktext,
                fontsize: 16,
                textColor: FrontEndCngig.kTextColor),
            Spacer(),
            Icon(
              arrow,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
