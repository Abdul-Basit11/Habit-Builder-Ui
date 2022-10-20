import 'package:flutter/material.dart';
import 'package:habit_bilder_app/navigation/navigation_routes_name.dart';
import 'package:habit_bilder_app/presentation/elements/divider/custom_diveider.dart';
import 'package:habit_bilder_app/presentation/views/app_view/profile_view/profile_dashboard/layout/widget/billing_methods.dart';
import 'package:habit_bilder_app/presentation/views/app_view/profile_view/profile_dashboard/layout/widget/total_work.dart';

import '../../../../../../configuration/front_end_config.dart';
import '../../../../../elements/custom_round_butto/round_button.dart';
import '../../../../../elements/custom_text/custom_text.dart';
import 'widget/profile_user_tile.dart';
import 'widget/progress_indicator.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FrontEndCngig.kScaffoldColor,
      body: SafeArea(
        child: Column(
          children: [
            buildRowAppBar(),

            /// large container....
            Container(
              margin: EdgeInsets.symmetric(horizontal: 18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  UserProfileTile(),
                  CustomDivider(),
                  Row(
                    children: [
                      TotalWork(
                        img: 'assets/images/clock.png',
                        hours: '18',
                        work: 'Total Work Hours',
                      ),
                      buildContainer(),
                      TotalWork(
                        img: 'assets/images/flag.png',
                        hours: '12',
                        work: 'Task Complete',
                      ),
                    ],
                  ),
                  CustomDivider(),
                  k20,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ProgressindicatorCustom(
                        isNull: true,
                        progressColor: FrontEndCngig.kTextColor,
                        insideIndicatorText: '7',
                        rate: '06/14',
                        percent: 0.7,
                      ),
                      ProgressindicatorCustom(
                        isNull: false,
                        percent: 0.05,
                        progressColor: FrontEndCngig.kHabitColor,
                        insideIndicatorText: '0',
                      ),
                      ProgressindicatorCustom(
                        percent: 0.05,
                        isNull: true,
                        progressColor: FrontEndCngig.kHabitColor,
                        insideIndicatorText: '0',
                        rate: '06/15',
                      ),
                      ProgressindicatorCustom(
                        percent: 0.5,
                        isNull: false,
                        progressColor: FrontEndCngig.kTextColor,
                        insideIndicatorText: '0',
                        rate: '06/15',
                      ),
                      ProgressindicatorCustom(
                        percent: 0.4,
                        isNull: true,
                        progressColor: FrontEndCngig.kTextColor,
                        insideIndicatorText: '0',
                        rate: '06/15',
                      ),
                      ProgressindicatorCustom(
                        percent: 0.9,
                        isNull: false,
                        progressColor: FrontEndCngig.kTextColor,
                        insideIndicatorText: '0',
                        rate: '06/15',
                      ),
                    ],
                  ),
                  k20,
                ],
              ),
            ),
            k20,
            BillingMethods(
                billing: Icons.credit_card_sharp,
                ktext: 'Billing Methods',
                on: () {
                  Navigator.pushNamed(
                      context, RoutesName.subscriptionViewRoute);
                }),
            k10,
            BillingMethods(
              billing: Icons.star_purple500_outlined,
              ktext: 'Longest Streak',
              on: () {},
              arrow: Icons.arrow_drop_down_sharp,
            ),
          ],
        ),
      ),
    );
  }

  Container buildContainer() {
    return Container(
      height: 65,
      width: 0.4,
      color: FrontEndCngig.kHabitColor,
    );
  }
}

Row buildRowAppBar() {
  return Row(
    children: [
      RoundButton(
          widget: Image.asset('assets/images/menu_image.png'), onTap: () {}),
      Spacer(),
      CustomText(
          fontWeight: FontWeight.bold,
          title: 'Settings',
          fontsize: 15,
          textColor: FrontEndCngig.kTextColor),
      Spacer(),
      RoundButton(
          widget: Image.asset(
            'assets/images/edit_icon.png',
            scale: 4,
          ),
          onTap: () {}),
    ],
  );
}
