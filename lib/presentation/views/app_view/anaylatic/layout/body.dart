import 'package:flutter/material.dart';
import 'package:habit_bilder_app/configuration/front_end_config.dart';
import 'package:habit_bilder_app/presentation/elements/custom_round_butto/round_button.dart';
import 'package:habit_bilder_app/presentation/elements/custom_text/custom_text.dart';

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
              Row(
                children: [
                  RoundButton(
                      widget: Image.asset(
                        'assets/images/back_arrow.png',
                        scale: 4,
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      }),
                  Spacer(),
                  CustomText(
                      fontWeight: FontWeight.bold,
                      title: 'Read A Book',
                      fontsize: 18,
                      textColor: FrontEndCngig.kTextColor),
                  Spacer(),
                  RoundButton(
                      widget: Image.asset(
                        'assets/images/edit_icon.png',
                        scale: 4,
                      ),
                      onTap: () {}),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
