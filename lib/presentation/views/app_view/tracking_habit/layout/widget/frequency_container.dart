


import 'package:flutter/material.dart';

class FrequencyContainer extends StatelessWidget {

  final Color freColor;
  final Color samecolor;
  final double frequency;

  const FrequencyContainer({super.key, required this.freColor, required this.samecolor,required this.frequency});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
      EdgeInsets.only(right: 6, bottom: 2, top: 2),
      height: 48,
      width: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: [
            freColor,
            samecolor,
            samecolor,
          ],
          stops: [frequency, frequency, 1],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
      ),
    );
  }
}
