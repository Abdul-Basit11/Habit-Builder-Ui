import 'package:flutter/material.dart';

import '../../../../../../configuration/front_end_config.dart';
import '../../../../../elements/custom_round_butto/round_button.dart';
import '../../../../../elements/custom_text/custom_text.dart';
import 'widget/list_tile.dart';

class WhatsInsideViewBody extends StatelessWidget {
  const WhatsInsideViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FrontEndCngig.kScaffoldColor,
      appBar: buildAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              k20,
              ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                      child: Image.asset('assets/images/course_banner.png'))),
              k20,
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    CustomText(
                        fontWeight: FontWeight.bold,
                        title:
                            '30 Day Journal Challenge - Establish a Habit of Daily Journaling',
                        fontsize: 15,
                        textColor: FrontEndCngig.kTextColor),
                    buildDivider(),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          CustomText(
                              fontWeight: FontWeight.bold,
                              title: '37 Lessons (2h 41m)',
                              fontsize: 14,
                              textColor: FrontEndCngig.kTextColor)
                        ],
                      ),
                    ),
                    k10,
                    Listtile(
                      title: '1. Introduction',
                      icon: Icons.play_arrow,
                      time: '2:16',
                    ),
                    k10,
                    buildDivider(),
                    k10,
                    Listtile(
                      title: '1. Introduction',
                      icon: Icons.play_arrow,
                      time: '2:16',
                    ),
                    k10,
                    buildDivider(),
                    k10,
                    Listtile(
                      title: '1. Introduction',
                      icon: Icons.play_arrow,
                      time: '2:16',
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Divider buildDivider() {
    return Divider(
      height: 1,
      thickness: 1,
      color: FrontEndCngig.kHabitColor.withOpacity(0.3),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: CustomText(
        title: '30 Day Journal Challenge...',
        textColor: FrontEndCngig.kTextColor,
        fontsize: 15,
        fontWeight: FontWeight.bold,
      ),
      leading: RoundButton(
        onTap: () {},
        widget: Image.asset(
          'assets/images/back_arrow.png',
          scale: 4,
        ),
      ),
    );
  }
}
