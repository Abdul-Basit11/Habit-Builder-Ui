import 'package:flutter/material.dart';

import '../../../../../../../configuration/front_end_config.dart';
import '../../../../../../../navigation/navigation_routes_name.dart';
import '../../../../../../elements/custom_button/custom_button.dart';
import '../../../../../../elements/custom_text/custom_text.dart';

class TopBanner extends StatelessWidget {
  const TopBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
            alignment: Alignment.centerRight,
            image: AssetImage('assets/images/home_poster_image.png')),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0, top: 20, left: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
                fontFamily: 'Klasik',
                title: 'Check Your Profile',
                fontsize: 18,
                textColor: FrontEndCngig.kTextColor),
            CustomText(
                fontFamily: 'Klasik',
                title: 'jonathan@gmail.com',
                fontsize: 11,
                textColor: FrontEndCngig.kGreyColor),
            Custombutton(
                fontWeight: FontWeight.bold,
                textColor: FrontEndCngig.kTextColor,
                buttonbgColor: FrontEndCngig.kHabitColor,
                h: 40,
                fontSize: 16,
                w: 100,
                onTap: () {
                  Navigator.pushNamed(
                      context, RoutesName.profiledashboardRoute);
                },
                borderRadius: 12,
                txt: 'View')
          ],
        ),
      ),
    );
  }
}
