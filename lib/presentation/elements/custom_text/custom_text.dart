import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String title;
  final double fontsize;
  final FontWeight? fontWeight;
  final Color textColor;
  final TextAlign? align;
  final int? maxLines;
  final String fontFamily;
  final double? heigtht;
  final double? letterSpacing;

  const CustomText(
      {super.key,
      this.maxLines,
        this.letterSpacing,
      required this.title,
      required this.fontsize,
      this.fontWeight,
      required this.textColor,
      this.align,
        this.heigtht,
      this.fontFamily='Manrope',
      });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: align,
      maxLines: maxLines,
      style: TextStyle(
        letterSpacing: letterSpacing,
        fontFamily: fontFamily,
        fontSize: fontsize,
        fontWeight: fontWeight,
        color: textColor,
        height: heigtht,
      ),
    );
  }
}
