import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habit_bilder_app/navigation/navigation_routes_name.dart';
import 'package:habit_bilder_app/presentation/elements/custom_button/custom_button.dart';
import 'package:habit_bilder_app/presentation/elements/custom_text/custom_text.dart';

import '../../../../../../configuration/front_end_config.dart';
import 'widget/congratulation.dart';
import 'widget/custom_appbar.dart';
import 'widget/quad_container.dart';

class AnalyticViewBody extends StatelessWidget {
  const AnalyticViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FrontEndCngig.kScaffoldColor,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SafeArea(
          child: Column(
            children: [
              /// appBar
              CustomAppBar(),
              k10,

              /// Read a Book Container
              Container(
                padding: EdgeInsets.all(12),
                margin: EdgeInsets.symmetric(horizontal: 20),
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  children: [
                    Container(
                      height: 75,
                      width: 75,
                      decoration: BoxDecoration(
                        color: FrontEndCngig.kScaffoldColor,
                        image: DecorationImage(
                            alignment: Alignment.center,
                            image:
                                AssetImage('assets/images/campimg_image.png')),
                      ),
                    ),
                    kWidth10,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                            fontWeight: FontWeight.bold,
                            title: 'Read a Book',
                            fontsize: 16,
                            textColor: FrontEndCngig.kTextColor),
                        kWidth10,
                        Row(
                          children: [
                            Icon(
                              CupertinoIcons.bell,
                              size: 20,
                              color: FrontEndCngig.kHabitColor,
                            ),
                            kWidth4,
                            CustomText(
                                fontWeight: FontWeight.bold,
                                title: 'Repeat everyday',
                                fontsize: 12,
                                textColor: FrontEndCngig.kGreyColor),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              CupertinoIcons.repeat,
                              size: 20,
                              color: FrontEndCngig.kHabitColor,
                            ),
                            kWidth4,
                            CustomText(
                                fontWeight: FontWeight.bold,
                                title: 'Reminders: 5:00 am',
                                fontsize: 12,
                                textColor: FrontEndCngig.kGreyColor),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              k32,

              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: FrontEndCngig.kScaffoldColor,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 20,
                          offset: Offset(0, -10))
                    ]),
                child: Column(
                  children: [
                    buildCenter(),
                    k20,
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      height: 161,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                QuadContainer(
                                  title: '20 DAYS',
                                  subtitle: 'Longest Streak',
                                  pic: 'fire_flame',
                                  color: FrontEndCngig.kHabitColor,
                                ),
                                verticalLine(),
                                QuadContainer(
                                  title: '0 DAYS',
                                  subtitle: 'Current Streak',
                                  pic: 'thunder_icon',
                                  color: FrontEndCngig.kRedColor,
                                ),
                              ],
                            ),

                            /// horizantally line
                            horizantalLine(),
                            Row(
                              children: [
                                QuadContainer(
                                  title: '98 %',
                                  subtitle: 'Completion Rate',
                                  pic: 'rate',
                                  color: FrontEndCngig.kBlueColor,
                                ),
                                verticalLine(),
                                QuadContainer(
                                  title: '7 ',
                                  subtitle: 'Average Easiness\nScore',
                                  pic: 'leaf',
                                  color: FrontEndCngig.kTextColor,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    k10,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Custombutton(
                        fontWeight: FontWeight.bold,
                        textColor: FrontEndCngig.kTextColor,
                        buttonbgColor: FrontEndCngig.kHabitColor,
                        h: 60,
                        fontSize: 16,
                        w: double.infinity,
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 10),
                                    height: 450,
                                    width: MediaQuery.of(context).size.width,
                                    child: Congratulation(
                                      continuebtn: () {
                                        Navigator.pushNamed(context,
                                            RoutesName.courseOverViewRoute);
                                      },
                                      createHabit: () {},
                                    ),
                                  ),
                                );
                              });
                        },
                        borderRadius: 10,
                        txt: 'Mark Habit as Complete',
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Center buildCenter() {
    return Center(
      child: CustomText(
          title: 'Analytics',
          fontsize: 16,
          textColor: FrontEndCngig.kGreyColor),
    );
  }

  Container horizantalLine() {
    return Container(
      height: 1,
      width: double.infinity,
      color: FrontEndCngig.kHabitColor.withOpacity(0.1),
    );
  }

  Container verticalLine() {
    return Container(
      height: 80,
      width: 1,
      color: FrontEndCngig.kHabitColor.withOpacity(0.2),
    );
  }
}
