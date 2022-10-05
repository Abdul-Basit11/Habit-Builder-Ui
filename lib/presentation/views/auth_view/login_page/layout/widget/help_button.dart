
import 'package:flutter/material.dart';

import '../../../../../../configuration/front_end_config.dart';

class HelpButton extends StatelessWidget {


  final VoidCallback onPressed;
  final String iconPath;

  const HelpButton({super.key, required this.onPressed, required this.iconPath});


  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.small(
      elevation: 0,
      backgroundColor: FrontEndCngig.kTextColor.withOpacity(0.2),
      onPressed: onPressed,
      child: Image.asset(
        iconPath,

        scale: 3,
      ),
    );
  }
}
