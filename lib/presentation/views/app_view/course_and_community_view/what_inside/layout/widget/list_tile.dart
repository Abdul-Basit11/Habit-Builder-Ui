import 'package:flutter/material.dart';

import '../../../../../../../configuration/front_end_config.dart';

class Listtile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String time;

  Listtile(
      {super.key, required this.icon, required this.title, required this.time});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: [
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
                color: FrontEndCngig.kHabitColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: Icon(
                icon,
                color: FrontEndCngig.kHabitColor,
                size: 30,
              ),
            ),
          ),
          kWidth10,
          Text(
            title,
            style: TextStyle(
              fontSize: 17,
            ),
          ),
          Spacer(),
          Text(
            time,
            style: TextStyle(
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }
}
