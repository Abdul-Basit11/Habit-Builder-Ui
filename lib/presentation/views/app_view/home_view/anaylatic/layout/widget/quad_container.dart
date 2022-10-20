import 'package:flutter/material.dart';

import '../../../../../../../configuration/front_end_config.dart';
import '../../../../../../elements/custom_text/custom_text.dart';

class QuadContainer extends StatelessWidget {
  final String title;
  final String subtitle;
  final String pic;
  final Color color;

  const QuadContainer(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.pic,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 80,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                        fontFamily: 'Klasik',
                        fontWeight: FontWeight.bold,
                        title: title,
                        fontsize: 20,
                        textColor: FrontEndCngig.kTextColor),
                    CustomText(
                        fontWeight: FontWeight.bold,
                        title: subtitle,
                        fontsize: 12,
                        textColor: FrontEndCngig.kGreyColor),
                  ],
                ),
                Container(
                  height: 38,
                  width: 38,
                  decoration: BoxDecoration(
                      color: color.withOpacity(0.2),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          scale: 4,
                          alignment: Alignment.center,
                          image: AssetImage('assets/images/$pic.png'))),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
