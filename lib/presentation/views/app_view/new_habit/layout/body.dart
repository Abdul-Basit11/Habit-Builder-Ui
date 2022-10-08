import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habit_bilder_app/presentation/elements/custom_round_butto/round_button.dart';
import 'package:habit_bilder_app/presentation/elements/custom_text/custom_text.dart';
import 'package:habit_bilder_app/presentation/elements/customtextfield/custom_text_field.dart';
import 'package:habit_bilder_app/presentation/views/app_view/new_habit/layout/widget/book_mark_container.dart';
import 'package:habit_bilder_app/presentation/views/app_view/new_habit/layout/widget/habit_frequency_container_top.dart';
import 'package:habit_bilder_app/presentation/views/app_view/new_habit/layout/widget/notification_tile.dart';
import 'package:habit_bilder_app/presentation/views/app_view/new_habit/layout/widget/reminder_button.dart';
import 'package:habit_bilder_app/presentation/views/app_view/new_habit/layout/widget/reminder_tile.dart';
import 'package:habit_bilder_app/presentation/views/app_view/new_habit/layout/widget/reminder_time_container.dart';
import 'package:habit_bilder_app/presentation/views/app_view/new_habit/layout/widget/show_time_picker_sheet.dart';
import 'package:habit_bilder_app/presentation/views/app_view/new_habit/layout/widget/start_this_habit.dart';
import 'package:habit_bilder_app/presentation/views/app_view/new_habit/layout/widget/time_picker_pop_and_void.dart';

import '../../../../../configuration/front_end_config.dart';

class NewHabitViewBody extends StatefulWidget {
  @override
  State<NewHabitViewBody> createState() => _NewHabitViewBodyState();
}

class _NewHabitViewBodyState extends State<NewHabitViewBody> {
  final Color = FrontEndCngig.kScaffoldColor;
  DateTime reminder=DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      extendBodyBehindAppBar: true,
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: buildFloatingActionButton(),
      backgroundColor: Color,
      appBar: buildAppBar(context),

      /// body section
      body: Container(
        height: MediaQuery
            .of(context)
            .size
            .height,
        padding: EdgeInsets.only(top: 20, right: 20, left: 20, bottom: 35),
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/homepage_bg_image.png'))),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: SafeArea(
            child: Column(
              children: [

                /// search bar
                Row(
                  children: [
                    Expanded(
                      child: CuctomTextField(
                          fillColor: FrontEndCngig.kWhiteColor,
                          filled: true,
                          hintText: 'Enter habit name '),
                    ),
                    kWidth10,
                    BookMarkContainer(),
                  ],
                ),
                k12,

                /// custom container
                HabitFrequencyContainerTop(),
                k12,
                /// reminder tile
                GestureDetector(

                  /// model bottom sheet.
                  onTap: () {
                    showModalBottomSheet(
                      elevation: 10,
                      barrierColor: Colors.black.withOpacity(0.7),
                        backgroundColor: Colors.white,
                        context: context,
                        builder: (context) {
                          bool status = false;

                          /// insied bottom sheet container...
                          return StatefulBuilder(
                            builder: (context, setState) {
                              return Container(
                                padding: EdgeInsets.only(bottom: 20),
                                height: 500,
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20))),
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: GridView.builder(
                                          gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                            crossAxisSpacing: 10,
                                            mainAxisSpacing: 10,
                                            childAspectRatio: 7 / 6,
                                          ),
                                          scrollDirection: Axis.vertical,
                                          itemCount: 1,
                                          physics: BouncingScrollPhysics(),
                                          padding: EdgeInsets.all(12),
                                          itemBuilder: (context, index) {
                                            return ReminderTimeContainer(
                                              status: status,
                                              time: '6:00',
                                              onchanged: (val) {
                                                setState(() {
                                                  status = val;
                                                });
                                              },
                                            );
                                          }),
                                    ),
                                    ReminderButton(
                                      onTapp: () {
                                        Navigator.pop(context);
                                        showModalBottomSheet(
                                            context: context,
                                            builder: (context) {
                                              return ShowTimeSheet(
                                                onST: (){},
                                                onTimeChanged: (newTime){
                                                  reminder=newTime;
                                                },
                                              );
                                            });
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        });
                  },

                  /// Reminder Tile
                  child: ReminderTile(
                    reminderTIME: '10:00AM',
                  ),
                ),
                k12,
                NptificationTile(),
                k32,
                StartThisHabit(),
                SizedBox(height: 30,),



              ],
            ),
          ),
        ),
      ),
    );
  }


  FloatingActionButton buildFloatingActionButton() {
    return FloatingActionButton(
        child: Icon(
          Icons.done_outlined,
          color: FrontEndCngig.kTextColor,
        ),
        backgroundColor: FrontEndCngig.kHabitColor,
        onPressed: () {});
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        'New Habit',
        style: Theme
            .of(context)
            .textTheme
            .headline6!
            .copyWith(color: FrontEndCngig.kTextColor),
      ),
      leading: RoundButton(
        onTap: () {},
        widget: Image.asset(
          'assets/images/back_arrow.png',
          scale: 4,
        ),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }
}
