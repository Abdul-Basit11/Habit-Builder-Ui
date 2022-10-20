import 'package:flutter/material.dart';

import '../../../../../../../configuration/front_end_config.dart';
import '../../../../../../elements/custom_text/custom_text.dart';

class TotalWork extends StatelessWidget {
  final String img;
  final String work;
  final String hours;

  const TotalWork(
      {super.key, required this.img, required this.work, required this.hours});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  title: work,
                  fontsize: 11.3,
                  fontWeight: FontWeight.bold,
                  textColor: FrontEndCngig.kGreyColor,
                ),
                CustomText(
                  title: hours,
                  fontsize: 22,
                  fontWeight: FontWeight.bold,
                  textColor: FrontEndCngig.kTextColor,
                ),
              ],
            ),
            Image.asset(
              img,
              scale: 4,
            )
          ],
        ),
        height: 65,
      ),
    );
  }
}
