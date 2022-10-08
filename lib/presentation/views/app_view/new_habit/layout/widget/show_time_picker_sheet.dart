


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habit_bilder_app/presentation/views/app_view/new_habit/layout/widget/time_picker_pop_and_void.dart';

import '../../../../../../configuration/front_end_config.dart';

class ShowTimeSheet extends StatelessWidget {

  final Function(DateTime) onTimeChanged;
  final VoidCallback onST;

  const ShowTimeSheet({super.key, required this.onTimeChanged,required this.onST});


  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius:
          BorderRadius.only(
            topLeft:
            Radius.circular(20),
            topRight:
            Radius.circular(20),
          )),
      height: 380,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: TimePickerCancelAndSave(
              onCancelTap: ()
              {
                Navigator.pop(context);
              },
              onSaveTap: onST,
            ),
          ),
          k5,
          Divider(
            height: 1,
            thickness: 1,
            color: FrontEndCngig.kHabitColor.withOpacity(0.3),
          ),

          Expanded(
            child: CupertinoTheme(
              data: CupertinoThemeData(
                textTheme: CupertinoTextThemeData(
                  dateTimePickerTextStyle: TextStyle(
                    fontFamily: 'Klasik',
                    fontWeight: FontWeight.normal,
                    color: FrontEndCngig.kTextColor
                  )
                ),
              ),
              child: CupertinoDatePicker(
                initialDateTime: DateTime.now(),
                mode: CupertinoDatePickerMode.time,
                onDateTimeChanged: (DateTime newTime)=>onTimeChanged(newTime),
              ),
            ),
          ),

        ],
      ),

    );
  }
}
