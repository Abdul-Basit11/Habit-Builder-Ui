import 'package:flutter/material.dart';

import '../../../../../../configuration/front_end_config.dart';
import '../../../../../elements/custom_text/custom_text.dart';

class OrSigninWith extends StatelessWidget {
  const OrSigninWith({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.only(right: 10),
            height: 1,
            color: FrontEndCngig.kTextColor.withOpacity(0.1),
          ),
        ),
        CustomText(
            title: 'Or Sigin with',
            fontsize: 14,
            textColor: FrontEndCngig.kTextColor.withOpacity(0.5)),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 10),
            height: 1,
            color: FrontEndCngig.kTextColor.withOpacity(0.1),
          ),
        ),
      ],
    );
  }
}
