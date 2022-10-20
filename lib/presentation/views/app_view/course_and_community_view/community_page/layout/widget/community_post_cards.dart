import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../../configuration/front_end_config.dart';
import '../../../../../../elements/custom_round_butto/round_button.dart';
import '../../../../../../elements/custom_text/custom_text.dart';

class CommunityPostCards extends StatelessWidget {
  final String userName;
  final String time;
  final String img;
  final String des;

  const CommunityPostCards(
      {super.key,
      required this.userName,
      required this.time,
      required this.img,
      required this.des});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      decoration: BoxDecoration(
          color: FrontEndCngig.kWhiteColor,
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.0),
            child: ListTile(
              title: Text(userName),
              subtitle: Text(time),
              trailing: RoundButton(
                onTap: () {},
                widget: Icon(Icons.share),
              ),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/images/$img.png'),
              ),
            ),
          ),
          Divider(
            thickness: 1,
            height: 1,
            color: FrontEndCngig.kHabitColor.withOpacity(0.3),
          ),
          k10,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: CustomText(
                maxLines: 2,
                title:
                    'Man, youre my new guru! Viewing the lessons for a second time. Thoroughly pleased. And impressed that you draw from scientific literature in telling memorable...',
                fontsize: 13,
                textColor: FrontEndCngig.kTextColor),
          ),
          k10,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.favorite,
                  color: FrontEndCngig.kHabitColor,
                  size: 18,
                ),
                CustomText(
                    title: '3.1k',
                    fontsize: 10,
                    textColor: FrontEndCngig.kTextColor),
                kWidth10,
                Icon(
                  CupertinoIcons.chat_bubble,
                  color: FrontEndCngig.kHabitColor.withOpacity(0.3),
                  size: 18,
                ),
                CustomText(
                    title: '22',
                    fontsize: 10,
                    textColor: FrontEndCngig.kTextColor),
              ],
            ),
          )
        ],
      ),
    );
  }
}
