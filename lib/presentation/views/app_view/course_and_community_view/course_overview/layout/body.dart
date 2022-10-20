import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habit_bilder_app/configuration/front_end_config.dart';
import 'package:habit_bilder_app/navigation/navigation_routes_name.dart';
import 'package:habit_bilder_app/presentation/elements/custom_round_butto/round_button.dart';
import 'package:habit_bilder_app/presentation/elements/custom_text/custom_text.dart';

import 'widget/habit_course.dart';
import 'widget/sort_by.dart';

class CousreOverviewViewBody extends StatelessWidget {
  const CousreOverviewViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        //   floatingActionButton: FloatingActionButton(
        //     elevation: 10,
        //     backgroundColor: FrontEndCngig.kHabitColor,
        //     onPressed: () {
        //       Navigator.pushNamed(context, RoutesName.whatsInside);
        //     },
        //     child: Text('+',style: TextStyle(fontSize: 18),),
        //   ),
        backgroundColor: FrontEndCngig.kScaffoldColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                buildRowAppBar(),
                k20,
                HabitCourse(),
                k21,
                SortBy(),
                k20,
                Expanded(
                  child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: 2,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, RoutesName.whatsInside);
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 20),
                            height: 275,
                            width: double.infinity,
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(20)),
                                        child: Image.asset(
                                          'assets/images/course_banner.png',
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    width: double.infinity,
                                    color: Colors.white,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                            fontWeight: FontWeight.bold,
                                            title:
                                                '30 Day Journal Challenge - Establish a\nHabit of Daily Journaling',
                                            fontsize: 15,
                                            textColor:
                                                FrontEndCngig.kTextColor),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                CustomText(
                                                    title: '2h 41m',
                                                    fontsize: 11,
                                                    textColor: FrontEndCngig
                                                        .kTextColor),
                                                CustomText(
                                                    title: '37 Lessons',
                                                    fontsize: 11,
                                                    textColor: FrontEndCngig
                                                        .kTextColor),
                                              ],
                                            ),
                                            Container(
                                              height: 30,
                                              width: 30,
                                              decoration: BoxDecoration(
                                                  color: FrontEndCngig
                                                      .kTextColor
                                                      .withOpacity(0.2),
                                                  shape: BoxShape.circle),
                                              child: Center(
                                                child: Icon(
                                                  CupertinoIcons.bookmark,
                                                  size: 18,
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                k20,
              ],
            ),
          ),
        ));
  }

  /// build method
  Row buildRowAppBar() {
    return Row(
      children: [
        RoundButton(
            widget: Image.asset('assets/images/menu_image.png'), onTap: () {}),
        Spacer(),
        CustomText(
            fontWeight: FontWeight.bold,
            title: 'Courses',
            fontsize: 15,
            textColor: FrontEndCngig.kTextColor),
        Spacer(),
        RoundButton(
            widget: Icon(
              Icons.search,
              color: FrontEndCngig.kTextColor,
            ),
            onTap: () {}),
      ],
    );
  }
}
