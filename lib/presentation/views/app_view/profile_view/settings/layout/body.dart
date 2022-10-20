import 'package:flutter/material.dart';
import 'package:habit_bilder_app/presentation/views/app_view/profile_view/settings/layout/widget/general_support_tile.dart';
import 'package:habit_bilder_app/presentation/views/app_view/profile_view/settings/layout/widget/top_banner.dart';

import '../../../../../../configuration/front_end_config.dart';
import '../../../../../elements/custom_round_butto/round_button.dart';
import '../../../../../elements/custom_text/custom_text.dart';
import 'widget/general_setting_tile.dart';

class SettingViewBody extends StatelessWidget {
  const SettingViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FrontEndCngig.kScaffoldColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildRowAppBar(),
                k20,
                TopBanner(),
                k20,
                CustomText(
                  title: 'General',
                  fontsize: 15,
                  textColor: FrontEndCngig.kTextColor,
                  fontWeight: FontWeight.bold,
                ),
                GeneralSettingTile(
                  icon: Icons.notifications,
                  settingName: 'Notifications',
                  settinsubTitle: 'Customize notifications',
                ),
                k10,
                GeneralSettingTile(
                  icon: Icons.more_horiz,
                  settingName: 'More customization',
                  settinsubTitle: 'Customize it more to fit your usage',
                ),
                k20,
                CustomText(
                  title: 'General',
                  fontsize: 15,
                  textColor: FrontEndCngig.kTextColor,
                  fontWeight: FontWeight.bold,
                ),
                GeneralSupportTile(
                  onTapped: () {},
                  iCON: Icons.whatsapp,
                  name: 'Contact',
                ),
                GeneralSupportTile(
                  onTapped: () {},
                  iCON: Icons.chat,
                  name: 'FeedBack',
                ),
                GeneralSupportTile(
                  onTapped: () {},
                  iCON: Icons.privacy_tip,
                  name: 'Privacy Policy',
                ),
                GeneralSupportTile(
                  onTapped: () {},
                  iCON: Icons.error_outline,
                  name: 'About',
                ),
              ],
            ),
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
          title: 'Settings',
          fontsize: 15,
          textColor: FrontEndCngig.kTextColor),
      Spacer(
        flex: 2,
      ),
    ],
  );
}
