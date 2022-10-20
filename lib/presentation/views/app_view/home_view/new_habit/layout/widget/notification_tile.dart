import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:habit_bilder_app/presentation/elements/custom_text/custom_text.dart';

import '../../../../../../../configuration/front_end_config.dart';

class NptificationTile extends StatefulWidget {
  @override
  State<NptificationTile> createState() => _NptificationTileState();
}

class _NptificationTileState extends State<NptificationTile> {
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18),
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CustomText(
              title: 'Notification',
              fontsize: 15,
              textColor: FrontEndCngig.kTextColor),
          Spacer(),
          FlutterSwitch(
              showOnOff: true,
              activeText: 'On',
              inactiveText: 'Off',
              inactiveColor: FrontEndCngig.kTextColor.withOpacity(0.4),
              inactiveTextColor: FrontEndCngig.kTextColor.withOpacity(0.3),
              activeTextColor: FrontEndCngig.kWhiteColor,
              activeColor: FrontEndCngig.kTextColor.withOpacity(0.9),
              height: 30,
              width: 62,
              activeToggleColor: FrontEndCngig.kHabitColor,
              value: isOn,
              onToggle: (val) {
                setState(() {
                  isOn = val;
                });
              }),

          //IosSwitch(),
        ],
      ),
    );
  }
}
