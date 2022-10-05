import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:habit_bilder_app/presentation/elements/custom_text/custom_text.dart';
import 'package:habit_bilder_app/presentation/elements/customtextfield/custom_text_field.dart';
import 'package:habit_bilder_app/presentation/views/app_view/new_habit/layout/widget/book_mark_container.dart';
import 'package:habit_bilder_app/presentation/views/app_view/new_habit/layout/widget/weak_frequency.dart';
import 'package:habit_bilder_app/presentation/views/app_view/tracking_habit/layout/widget/frequency_container.dart';

import '../../../../../configuration/front_end_config.dart';

class NewHabitViewBody extends StatefulWidget {
  @override
  State<NewHabitViewBody> createState() => _NewHabitViewBodyState();
}

class _NewHabitViewBodyState extends State<NewHabitViewBody> {
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FrontEndCngig.kScaffoldColor,
      appBar: buildAppBar(context),
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
              Container(
                height: 130,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(15)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// habit frequency
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20.0, right: 10, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                              title: 'Habit Frequency',
                              fontsize: 16,
                              textColor: FrontEndCngig.kTextColor),
                          Row(
                            children: [
                              CustomText(
                                  title: 'Custom',
                                  fontsize: 16,
                                  textColor: FrontEndCngig.kHabitColor),
                              Image.asset(
                                'assets/images/arrow_forward.png',
                                scale: 4,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    k20,
                    Divider(
                      thickness: 1,
                      height: 1,
                      color: FrontEndCngig.kHabitColor.withOpacity(0.3),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        WeakFrequency(),
                        WeakFrequency(),
                        WeakFrequency(),
                        WeakFrequency(),
                        WeakFrequency(),
                        WeakFrequency(),
                        WeakFrequency(),
                      ],
                    ),
                  ],
                ),
              ),
              k12,
              Container(
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
                        title: 'Reminder',
                        fontsize: 15,
                        textColor: FrontEndCngig.kTextColor),
                    Spacer(),
                    CustomText(
                        title: '10:00AM',
                        fontsize: 15,
                        textColor: FrontEndCngig.kHabitColor),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 18,
                      color: FrontEndCngig.kHabitColor,
                    )
                  ],
                ),
              ),
              k12,
              Container(
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
                    CupertinoSwitch(
                        trackColor: FrontEndCngig.kTextColor.withOpacity(0.3),
                        thumbColor: FrontEndCngig.kTextColor,
                        activeColor: FrontEndCngig.kTextColor.withOpacity(0.3),
                        value: isOn,
                        onChanged: (v) {
                          setState(() {
                            isOn = v;
                          });
                        }),
                  ],
                ),
              ),
                k32,
              Container(
                height: 220,
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      height: 170,
                      decoration: BoxDecoration(
                          color: Colors.white,

                          borderRadius: BorderRadius.circular(15)
                      ),
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          k32,
                          CustomText(
                            title: 'Start this habit',
                            fontsize: 22,
                            textColor: FrontEndCngig.kTextColor,
                            fontFamily: 'Klasik',
                          ),
                          k10,
                          CustomText(
                            align: TextAlign.center,
                              title:
                                  'ullamco laboris nisi ut aliquip ex eacommodo\nconsequat dolore. ',
                              fontsize: 12,
                              textColor: FrontEndCngig.kGreyColor),
                          k10,

                          Image.asset('assets/images/down_arrow.png',scale: 5,),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 20,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 38,
                        backgroundImage: AssetImage(
                            'assets/images/start_this_habit_image.png'),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
      leading: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: FloatingActionButton.small(
          elevation: 0,
          backgroundColor: FrontEndCngig.kTextColor.withOpacity(0.3),
          onPressed: () {},
          child: Icon(
            Icons.arrow_back,
            color: FrontEndCngig.kTextColor,
          ),
        ),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }
}
