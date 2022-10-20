import 'package:flutter/material.dart';
import 'package:habit_bilder_app/configuration/front_end_config.dart';

class RoundButton extends StatelessWidget {
  final Widget widget;
  final VoidCallback onTap;

  const RoundButton({super.key, required this.widget, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(10),
        height: 45,
        width: 45,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: FrontEndCngig.kTextColor.withOpacity(0.2)),
        child: widget,
      ),
    );
  }
}
