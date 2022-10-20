import 'package:flutter/material.dart';

import '../../../../../../../configuration/front_end_config.dart';
import '../../../../../../elements/custom_text/custom_text.dart';

class GeneralSupportTile extends StatelessWidget {
  final String name;
  final IconData iCON;
  final VoidCallback onTapped;

  const GeneralSupportTile(
      {super.key,
      required this.name,
      required this.iCON,
      required this.onTapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapped,
      child: Container(
        margin: EdgeInsets.only(top: 10, bottom: 10),
        padding: EdgeInsets.all(8),
        color: Colors.white,
        child: Row(
          children: [
            Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: FrontEndCngig.kHabitColor.withOpacity(0.2),
              ),
              child: Center(
                child: Icon(
                  iCON,
                  color: FrontEndCngig.kHabitColor,
                ),
              ),
            ),
            kWidth4,
            CustomText(
              title: name,
              fontsize: 14,
              textColor: FrontEndCngig.kTextColor,
              fontWeight: FontWeight.bold,
            ),
            Spacer(),
            Icon(
              Icons.arrow_right,
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
