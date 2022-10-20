import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../configuration/front_end_config.dart';
import '../../../../../elements/custom_round_butto/round_button.dart';
import '../../../../../elements/custom_text/custom_text.dart';
import 'widget/community_post_cards.dart';

class CommunityPageViewBody extends StatelessWidget {
  const CommunityPageViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FrontEndCngig.kScaffoldColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              buildRowAppBar(),
              k20,
              CommunityPostCards(
                des:
                    "Man, you're my new guru! Viewing the lessons for a second time. Thoroughly pleased. And impressed that you draw from scientific literature in telling memorable...",
                img: 'userimage',
                userName: 'Basit',
                time: "41m ago",
              ),
              k12,
              CommunityPostCards(
                des:
                    "Man, you're my new guru! Viewing the lessons for a second time. Thoroughly pleased. And impressed that you draw from scientific literature in telling memorable...",
                img: 'start_this_habit_image',
                userName: 'Abdul',
                time: "41m ago",
              ),
              k12,
              CommunityPostCards(
                des:
                    "Man, you're my new guru! Viewing the lessons for a second time. Thoroughly pleased. And impressed that you draw from scientific literature in telling memorable...",
                img: 'start_this_habit_image',
                userName: 'Abdul',
                time: "41m ago",
              ),
              k12,
            ],
          ),
        ),
      ),
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
          title: 'Community',
          fontsize: 15,
          textColor: FrontEndCngig.kTextColor),
      Spacer(),
    ],
  );
}
