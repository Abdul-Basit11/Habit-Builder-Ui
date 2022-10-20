import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habit_bilder_app/backend/model/habit_model.dart';
import 'package:habit_bilder_app/backend/services/system_services.dart';
import 'package:habit_bilder_app/presentation/elements/custom_round_butto/round_button.dart';
import 'package:habit_bilder_app/presentation/elements/customtextfield/custom_text_field.dart';
import 'package:intl/intl.dart';

import '../../../../../../backend/model/reminder_model.dart';
import '../../../../../../configuration/front_end_config.dart';
import 'widget/book_mark_container.dart';
import 'widget/habit_frequency_container_top.dart';
import 'widget/notification_tile.dart';
import 'widget/reminder_button.dart';
import 'widget/reminder_tile.dart';
import 'widget/reminder_time_container.dart';
import 'widget/show_time_picker_sheet.dart';
import 'widget/start_this_habit.dart';

import 'package:fluttertoast/fluttertoast.dart';

class NewHabitViewBody extends StatefulWidget {
  @override
  State<NewHabitViewBody> createState() => _NewHabitViewBodyState();
}

class _NewHabitViewBodyState extends State<NewHabitViewBody> {
  final Color = FrontEndCngig.kScaffoldColor;
  DateTime reminder = DateTime.now();
  final List<ReminderModel> _reminderList = [];

  final TextEditingController _habitController = TextEditingController();
  SystemServices systemServices = SystemServices();

  bool isLoading = false;
  makeLoadingTrue() {
    isLoading = true;
    setState(() {});
  }

  makeLoadingFalse() {
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlurryModalProgressHUD(
      inAsyncCall: isLoading,
      blurEffectIntensity: 2,
      color: FrontEndCngig.kHabitColor.withOpacity(0.5),
      progressIndicator: CupertinoActivityIndicator(
        color: FrontEndCngig.kTextColor,
        radius: 15,
        animating: true,
      ),
      child: Scaffold(
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        extendBodyBehindAppBar: true,
        extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: buildFloatingActionButton(),
        backgroundColor: Color,
        appBar: buildAppBar(context),

        /// body section
        body: Container(
          height: MediaQuery.of(context).size.height,
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
                            isPasswordField: false,
                            controller: _habitController,
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
                                          child: _reminderList.isEmpty
                                              ? GridView.builder(
                                                  gridDelegate:
                                                      SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 3,
                                                    crossAxisSpacing: 10,
                                                    mainAxisSpacing: 10,
                                                    childAspectRatio: 7 / 6,
                                                  ),
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount: 1,
                                                  physics:
                                                      BouncingScrollPhysics(),
                                                  padding: EdgeInsets.all(12),
                                                  itemBuilder:
                                                      (context, index) {
                                                    return ReminderTimeContainer(
                                                      status:
                                                          _reminderList[index]
                                                              .status,
                                                      time: DateFormat().format(
                                                          _reminderList[index]
                                                              .time
                                                              .toDate()),
                                                      onchanged: (val) {
                                                        setState(() {
                                                          _reminderList[index]
                                                              .status = val;
                                                        });
                                                      },
                                                    );
                                                  })
                                              : Center(
                                                  child: Text('No Reminders'),
                                                )),
                                      ReminderButton(
                                        onTapp: () {
                                          DateTime time = DateTime.now();
                                          Navigator.pop(context);
                                          showModalBottomSheet(
                                              context: context,
                                              builder: (context) {
                                                return ShowTimeSheet(
                                                  onCancel: () {
                                                    Navigator.pop(context);
                                                  },
                                                  onST: () {
                                                    Navigator.pop(context);
                                                    _reminderList.add(
                                                        ReminderModel(
                                                            time: Timestamp
                                                                .fromDate(time),
                                                            status: true));
                                                    setState(() {});
                                                  },
                                                  onTimeChanged: (newTime) {
                                                    reminder = newTime;
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
                      reminderTIME: _reminderList.isEmpty
                          ? 'Create Reminder'
                          : DateFormat('KK:mm a')
                              .format(_reminderList.last.time.toDate()),
                    ),
                  ),
                  k12,
                  NptificationTile(),
                  k32,
                  StartThisHabit(),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
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
        onPressed: () async {
          makeLoadingTrue();
          systemServices
              .createHabit(
                  HabitModel(
                    uid: FirebaseAuth.instance.currentUser!.uid,
                    habitName: _habitController.text,
                  ),
                  _reminderList)
              .then((value) {
            _reminderList.clear();
            _habitController.clear();
            FocusManager.instance.primaryFocus!.unfocus();
            makeLoadingFalse();
            Fluttertoast.showToast(
              msg: 'Habit Created',
              toastLength: Toast.LENGTH_LONG,
              backgroundColor: FrontEndCngig.kTextColor,
              textColor: FrontEndCngig.kWhiteColor,
            );
          }).onError((error, stackTrace) {
            makeLoadingFalse();
            FrontEndCngig.showToast(
                toastMessage: 'Something went wrong!',
                textColor: FrontEndCngig.kTextColor,
                bgColor: FrontEndCngig.kHabitColor.withOpacity(0.5));
            debugPrint('Error ${error}');
          });
        });
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        'New Habit',
        style: Theme.of(context)
            .textTheme
            .headline6!
            .copyWith(color: FrontEndCngig.kTextColor),
      ),
      leading: RoundButton(
        onTap: () {
          Navigator.pop(context);
        },
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
