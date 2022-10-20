import 'package:flutter/material.dart';

import '../../../../../../../configuration/front_end_config.dart';
import '../../../../../../elements/custom_text/custom_text.dart';
import '../../../../../../elements/divider/custom_diveider.dart';

class PlansCards extends StatelessWidget {
  final String percent;
  final String plans;
  bool isPopular;

  PlansCards(
      {super.key,
      required this.percent,
      required this.plans,
      this.isPopular = false});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          margin: EdgeInsets.only(right: 5, left: 5),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(12)),
          child: Column(
            children: [
              Column(
                children: [
                  isPopular
                      ? Column(
                        children: [
                          Container(
                    height: 40,
                    width: double.infinity,
                    decoration: BoxDecoration(
                            color: FrontEndCngig.kHabitColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                            )),
                    child: Center(
                          child: CustomText(
                            fontWeight: FontWeight.bold,
                            title: 'Most Popular',
                            textColor: FrontEndCngig.kTextColor,
                            fontsize: 12,
                          ),
                    ),
                  ),
                          k15,
                        ],
                      ):
                    k20,
                  CustomText(
                      fontWeight: FontWeight.bold,
                      title: percent,
                      fontsize: 20,
                      textColor: FrontEndCngig.kHabitColor),
                  k10,
                  CustomText(
                      align: TextAlign.center,
                      fontWeight: FontWeight.bold,
                      title: '6-month plan for\n39.99 usd',
                      fontsize: 12,
                      textColor: FrontEndCngig.kGreyColor),
                ],
              ),
              k10,
              CustomDivider(),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12, vertical: 12),
                child: CustomText(
                    align: TextAlign.center,
                    fontWeight: FontWeight.bold,
                    title: plans,
                    fontsize: 14,
                    textColor: FrontEndCngig.kTextColor),
              )
                   // Column(
                   //    children: [
                   //      Column(
                   //        children: [
                   //          k20,
                   //          CustomText(
                   //              fontWeight: FontWeight.bold,
                   //              title: percent,
                   //              fontsize: 20,
                   //              textColor: FrontEndCngig.kHabitColor),
                   //          k10,
                   //          CustomText(
                   //              align: TextAlign.center,
                   //              fontWeight: FontWeight.bold,
                   //              title: '6-month plan for\n39.99 usd',
                   //              fontsize: 12,
                   //              textColor: FrontEndCngig.kGreyColor),
                   //        ],
                   //      ),
                   //      k10,
                   //      CustomDivider(),
                   //      Padding(
                   //        padding: const EdgeInsets.symmetric(
                   //            horizontal: 12, vertical: 12),
                   //        child: CustomText(
                   //            align: TextAlign.center,
                   //            fontWeight: FontWeight.bold,
                   //            title: plans,
                   //            fontsize: 14,
                   //            textColor: FrontEndCngig.kTextColor),
                   //      ),
                   //    ],
                   //  ),
            ],
          )),
    );
  }
}
