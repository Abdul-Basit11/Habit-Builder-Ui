import 'package:flutter/material.dart';
import 'package:habit_bilder_app/presentation/elements/custom_button/custom_button.dart';
import 'package:habit_bilder_app/presentation/elements/divider/custom_diveider.dart';

import '../../../../../../configuration/front_end_config.dart';
import '../../../../../elements/custom_round_butto/round_button.dart';
import '../../../../../elements/custom_text/custom_text.dart';
import 'widget/plans_cards.dart';
import 'widget/subscription_banner.dart';

class SubscriptionPageViewBdy extends StatefulWidget {
  @override
  State<SubscriptionPageViewBdy> createState() =>
      _SubscriptionPageViewBdyState();
}

class _SubscriptionPageViewBdyState extends State<SubscriptionPageViewBdy> {
  bool unlimitedHabit = false;
  bool accesstoallcourses = false;
  bool accesstoallavatarillustrations = false;

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
              SubscriptionBanner(),
              k20,
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    k10,
                    Center(
                      child: CustomText(
                        align: TextAlign.center,
                        title: 'Unlock Monumental Habits',
                        fontsize: 18,
                        textColor: FrontEndCngig.kTextColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    k10,
                    CustomDivider(),
                    Row(
                      children: [
                        Checkbox(
                            checkColor: FrontEndCngig.kTextColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            activeColor: FrontEndCngig.kHabitColor,
                            value: unlimitedHabit,
                            onChanged: (value) {
                              setState(() {
                                unlimitedHabit = value!;
                              });
                            }),
                        CustomText(
                            title: 'Unlimited habits',
                            fontsize: 16,
                            textColor: FrontEndCngig.kTextColor)
                      ],
                    ),
                    CustomDivider(),
                    Row(
                      children: [
                        Checkbox(
                            checkColor: FrontEndCngig.kTextColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            activeColor: FrontEndCngig.kHabitColor,
                            value: accesstoallcourses,
                            onChanged: (value) {
                              setState(() {
                                accesstoallcourses = value!;
                              });
                            }),
                        CustomText(
                            title: 'Access to all courses',
                            fontsize: 16,
                            textColor: FrontEndCngig.kTextColor)
                      ],
                    ),
                    CustomDivider(),
                    Row(
                      children: [
                        Checkbox(
                            checkColor: FrontEndCngig.kTextColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            activeColor: FrontEndCngig.kHabitColor,
                            value: accesstoallavatarillustrations,
                            onChanged: (value) {
                              setState(() {
                                accesstoallavatarillustrations = value!;
                              });
                            }),
                        CustomText(
                            title: 'Access to all avatar illustrations',
                            fontsize: 16,
                            textColor: FrontEndCngig.kTextColor)
                      ],
                    ),
                    k20,
                    Container()
                  ],
                ),
              ),
              k20,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PlansCards(
                    plans: 'Monthly',
                    percent: '\$19.00',
                    isPopular: false,
                  ),
                  PlansCards(
                    plans: 'Yearly',
                    percent: '\$19.00',
                    isPopular: true,
                  ),
                  PlansCards(
                    plans: 'Lifetime',
                    percent: '\$19.00',
                    isPopular: false,
                  ),
                ],
              ),
              k20,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Custombutton(
                    textColor: FrontEndCngig.kTextColor,
                    buttonbgColor: FrontEndCngig.kHabitColor,
                    h: 50,
                    fontSize: 18,
                    w: double.infinity,
                    onTap: () {},
                    borderRadius: 12,
                    txt: 'Subscribe Now'),
              ),
              k10,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.privacy_tip_rounded,
                    size: 18,
                  ),
                  CustomText(
                      title: 'Secured with Goggle Play. Cancel anytime',
                      fontsize: 12,
                      textColor: FrontEndCngig.kTextColor)
                ],
              ),
              k20,
              CustomText(
                  decoration: TextDecoration.underline,
                  title: "Restore Purchase",
                  fontsize: 14,
                  textColor: FrontEndCngig.kHabitColor),
              k12,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                      decoration: TextDecoration.underline,
                      title: 'Terms of Service',
                      fontsize: 14,
                      textColor: FrontEndCngig.kTextColor),
                  kWidth4,
                  CustomText(
                      title: 'and',
                      fontsize: 14,
                      textColor: FrontEndCngig.kGreyColor),
                  kWidth4,
                  CustomText(
                      decoration: TextDecoration.underline,
                      title: 'Privacy Policy',
                      fontsize: 14,
                      textColor: FrontEndCngig.kTextColor),
                ],
              ),
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
          title: 'Premium',
          fontsize: 15,
          textColor: FrontEndCngig.kTextColor),
      Spacer(
        flex: 2,
      ),
    ],
  );
}
