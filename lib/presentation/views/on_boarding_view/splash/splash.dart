import 'dart:async';

import 'package:flutter/material.dart';
import 'package:habit_bilder_app/configuration/front_end_config.dart';
import 'package:habit_bilder_app/navigation/navigation_routes_name.dart';
import 'package:habit_bilder_app/presentation/elements/custom_text/custom_text.dart';


class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {


  initState() {
    super.initState();
    Timer(Duration(seconds: 3),(){
     Navigator.pushNamed(context, RoutesName.onBoardViewRouts);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Container(
        padding: EdgeInsets.only(top: 90),
        width: MediaQuery
            .of(context)
            .size
            .height,
        height: MediaQuery
            .of(context)
            .size
            .height,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/bg_image.png')
            )
        ),
        child: CustomText(
          align: TextAlign.center,
          title: 'WELCOME TO\nMonumental\nhabits',
          textColor: FrontEndCngig.kTextColor,
          fontsize: 40,
          fontFamily: 'Klasik',
          heigtht: 1.2,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
