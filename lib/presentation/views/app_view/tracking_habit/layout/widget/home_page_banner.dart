import 'package:flutter/material.dart';

import '../../../../../../configuration/front_end_config.dart';
import '../../../../../elements/custom_text/custom_text.dart';

class HomePagebanner extends StatelessWidget {
  const HomePagebanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20, left: 5),
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
        padding: const EdgeInsets.only(bottom: 50.0, top: 20, left: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
                fontFamily: 'Klasik',
                title:
                    'We first make our habits,\nand then our habits\nmakes us.',
                fontsize: 18,
                textColor: FrontEndCngig.kTextColor),
            Spacer(),
            CustomText(
                fontFamily: 'Klasik',
                title: '-ANONY<OUS',
                fontsize: 14,
                textColor: FrontEndCngig.kGreyColor),
          ],
        ),
      ),
    );
  }
}
