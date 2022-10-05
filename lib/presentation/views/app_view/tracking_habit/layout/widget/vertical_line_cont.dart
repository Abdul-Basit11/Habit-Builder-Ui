import 'package:flutter/material.dart';

import '../../../../../../configuration/front_end_config.dart';



class verticalLineCont extends StatelessWidget {
  const verticalLineCont({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      width: 1,
      color: FrontEndCngig.kHabitColor.withOpacity(0.3),
    );
  }
}
