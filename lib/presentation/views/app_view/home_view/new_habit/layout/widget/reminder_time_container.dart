import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:habit_bilder_app/configuration/front_end_config.dart';

class ReminderTimeContainer extends StatelessWidget {
  final String time;
  final Function(bool) onchanged;
  final bool status;

  ReminderTimeContainer(
      {super.key,
      required this.time,
      required this.onchanged,
      required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: status
              ? FrontEndCngig.kHabitColor.withOpacity(0.3)
              : FrontEndCngig.kTextColor.withOpacity(0.4),
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: time,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: status
                        ? FrontEndCngig.kHabitColor
                        : FrontEndCngig.kTextColor)),
            TextSpan(
                text: 'Am',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: status
                        ? FrontEndCngig.kHabitColor
                        : FrontEndCngig.kTextColor)),
          ])),
          FlutterSwitch(
            inactiveToggleColor: Colors.black,
            activeToggleColor: FrontEndCngig.kHabitColor,
            showOnOff: true,
            activeText: 'On',
            inactiveText: 'Off',
            inactiveColor:
                FrontEndCngig.kTextColor.withOpacity(0.2).withOpacity(0.4),
            inactiveTextColor: FrontEndCngig.kTextColor,
            activeTextColor: FrontEndCngig.kHabitColor,
            activeColor: FrontEndCngig.kHabitColor.withOpacity(0.3),
            height: 30,
            width: 62,
            value: status,
            onToggle: (val) => onchanged(val),
          ),
        ],
      ),
    );
  }
}
