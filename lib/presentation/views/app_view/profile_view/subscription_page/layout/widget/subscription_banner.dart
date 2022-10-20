import 'package:flutter/material.dart';

import '../../../../../../../configuration/front_end_config.dart';
import '../../../../../../elements/custom_text/custom_text.dart';
import 'time_container.dart';

class SubscriptionBanner extends StatelessWidget {
  const SubscriptionBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
      margin: EdgeInsets.symmetric(horizontal: 16),
      height: 130,
      width: double.infinity,
      decoration: BoxDecoration(
          color: FrontEndCngig.kWhiteColor,
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            alignment: Alignment.centerRight,
            image: AssetImage('assets/images/subscription_banner.png'),
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
              title: '60% off your upgrade',
              fontsize: 19,
              textColor: FrontEndCngig.kHabitColor),
          CustomText(
              title: 'Expires in',
              fontsize: 12,
              textColor: FrontEndCngig.kGreyColor),
          Container(
            height: 40,
            width: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TimeContainer(
                  time: '23',
                ),
                Text(
                  ':',
                  style: TextStyle(fontSize: 22),
                ),
                TimeContainer(
                  time: '56',
                ),
                Text(
                  ':',
                  style: TextStyle(fontSize: 22),
                ),
                TimeContainer(
                  time: '48',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
