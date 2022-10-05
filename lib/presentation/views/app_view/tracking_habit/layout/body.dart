import 'package:flutter/material.dart';
import 'package:habit_bilder_app/configuration/front_end_config.dart';
import 'package:habit_bilder_app/presentation/elements/custom_text/custom_text.dart';
import 'package:habit_bilder_app/presentation/views/app_view/tracking_habit/layout/widget/frequency_container.dart';
import 'package:habit_bilder_app/presentation/views/app_view/tracking_habit/layout/widget/habit_text.dart';
import 'package:habit_bilder_app/presentation/views/app_view/tracking_habit/layout/widget/home_page_banner.dart';
import 'package:habit_bilder_app/presentation/views/app_view/tracking_habit/layout/widget/read_a_book_text.dart';
import 'package:habit_bilder_app/presentation/views/app_view/tracking_habit/layout/widget/vertical_line_cont.dart';

import '../../../auth_view/login_page/layout/widget/help_button.dart';
import 'model/calender_model.dart';

class TrackingHabitViewBody extends StatelessWidget {
  const TrackingHabitViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var s = MediaQuery
        .of(context)
        .size;
    var height = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      extendBody: true,

      /// appbar
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'HomePage',
          style: Theme
              .of(context)
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
            child: Image.asset('assets/images/menu_image.png'),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(

            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/homepage_bg_image.png'))),
        child: Column(
          children: [
            k20,
            /// homepage poster
            HomePagebanner(),
            k20,

            /// habits
            SizedBox(
              height: 52,
              child: Row(
                children: [
                  kWidth20,
                  HabitText(),
                  kWidth50,
                  Expanded(
                    child: ListView.builder(
                        itemCount: 7,
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            margin:
                            EdgeInsets.only(right: 6, bottom: 2, top: 2),
                            height: 48,
                            width: 48,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomText(
                                    title: 'SUN',
                                    fontsize: 10,
                                    textColor: FrontEndCngig.kTextColor
                                        .withOpacity(0.6)),
                                CustomText(
                                    fontWeight: FontWeight.bold,
                                    title: '17',
                                    fontsize: 16,
                                    textColor: FrontEndCngig.kTextColor),
                              ],
                            ),
                          );
                        }),
                  )
                ],
              ),
            ),
            k10,

            /// Read a book
            Container(
              alignment: Alignment.center,
              height: 52,
              width: double.infinity,
              margin: EdgeInsets.only(left: 10),
              decoration: kTileContainer,
              child: Row(
                children: [
                  ReadABookText(
                    habitTitle: 'Read A Book',
                  ),
                  kWidth24,
                  verticalLineCont(),
                  kWidth4,
                  Expanded(
                    child: ListView.builder(
                        itemCount: 7,
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return FrequencyContainer(
                            frequency: 0.5,
                            freColor: FrontEndCngig.kHabitColor,
                            samecolor: FrontEndCngig.kHabitColor.withOpacity(
                                0.2),
                          );
                        }),
                  )
                ],
              ),
            ),
            k10,

            /// Exercise
            Container(
              alignment: Alignment.center,
              height: 52,
              width: double.infinity,
              margin: EdgeInsets.only(left: 10),
              decoration: kTileContainer,
              child: Row(
                children: [
                  ReadABookText(
                    habitTitle: 'Exercise',
                  ),





                  kWidth48,
                  verticalLineCont(),
                  kWidth4,
                  Expanded(
                    child: ListView.builder(
                        itemCount: 7,
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return FrequencyContainer(
                            frequency: 0.5,
                            freColor: FrontEndCngig.kRedColor,
                            samecolor: FrontEndCngig.kRedColor.withOpacity(0.2),
                          );
                        }),
                  )
                ],
              ),
            ),
            k10,

            /// Wake Up Early
            Container(
              alignment: Alignment.center,
              height: 52,
              width: double.infinity,
              margin: EdgeInsets.only(left: 10),
              decoration: kTileContainer,
              child: Row(
                children: [
                  ReadABookText(
                    habitTitle: 'Wake Up Early',
                  ),
                  kWidth12,
                  verticalLineCont(),
                  kWidth4,
                  Expanded(
                    child: ListView.builder(
                        itemCount: 7,
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return FrequencyContainer(
                              freColor: FrontEndCngig.kBlueColor,
                              samecolor: FrontEndCngig.kBlueColor.withOpacity(0.2),
                              frequency: 0.5);
                        }),
                  )
                ],
              ),
            ),
            k10,
            ///Walk Dog
            Container(
              alignment: Alignment.center,
              height: 52,
              width: double.infinity,
              margin: EdgeInsets.only(left: 10),
              decoration: kTileContainer,
              child: Row(
                children: [
                  ReadABookText(
                    habitTitle: 'Walk Dog',
                  ),
                kWidth43,
                  verticalLineCont(),
                  kWidth4,
                  Expanded(
                    child: ListView.builder(
                        itemCount: 4,
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return FrequencyContainer(
                              freColor: FrontEndCngig.kMehroonColor,
                              samecolor: FrontEndCngig.kMehroonColor.withOpacity(0.2),
                              frequency: 0.5);
                        }),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
