import 'package:flutter/material.dart';

class Custombutton extends StatelessWidget {
  final double h;
  final double w;
  final VoidCallback onTap;
  final Color? buttonbgColor;
  final Color? borderColor;
  final Color? textColor;
  final double borderRadius;
  final String txt;
  final double fontSize;
  final FontWeight? fontWeight;

  const Custombutton(
      {super.key,
        this.fontWeight,
      required this.h,
      required this.fontSize,
      required this.w,
      required this.onTap,
      this.buttonbgColor,
      this.borderColor,
      this.textColor,
      required this.borderRadius,
      required this.txt});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: h,
        width: w,
        decoration: BoxDecoration(
            color: buttonbgColor ?? Colors.white,
            border: Border.all(color: borderColor ?? Colors.grey.shade200),
            borderRadius: BorderRadius.circular(borderRadius)),
        child: Center(
          child: Text(
            txt,
            style: TextStyle(
              fontWeight: fontWeight,
                color: textColor ?? Colors.grey,
                fontSize: fontSize,
                fontFamily: 'Manrope'),
          ),
        ),
      ),
    );
  }
}
