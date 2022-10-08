import 'package:flutter/material.dart';
import 'package:habit_bilder_app/presentation/views/app_view/anaylatic/analytic_view.dart';
import 'package:habit_bilder_app/presentation/views/app_view/new_habit/new_habit_view.dart';
import 'package:habit_bilder_app/presentation/views/app_view/tracking_habit/tracking_habit_view.dart';
import 'package:habit_bilder_app/presentation/views/auth_view/login_page/login_page_view.dart';
import 'package:habit_bilder_app/presentation/views/auth_view/reset_password/reset_password_view.dart';
import 'package:habit_bilder_app/presentation/views/auth_view/signup_page/signup_page_view.dart';
import 'package:habit_bilder_app/presentation/views/on_boarding_view/get_started/get_started_view.dart';
import 'package:habit_bilder_app/presentation/views/on_boarding_view/on_boarding_screen/on_boarding_view.dart';
import 'package:habit_bilder_app/presentation/views/on_boarding_view/splash/splash.dart';

import '../presentation/views/app_view/bottom_navigation_bar/bottom_navigation_view.dart';
import 'navigation_routes_name.dart';

class RoutesGenerater {
  static Route<dynamic> generateRoutes(RouteSettings settings) {

    switch (settings.name) {
    /// splash screen
      case RoutesName.splashViewRoute:
        return MaterialPageRoute(builder: (context) => SplashView());
        /// onBoarding screen
      case RoutesName.onBoardViewRouts:
        return MaterialPageRoute(builder: (context)=>OnBoardingView());
        /// get started
      case RoutesName.getStartedViewRoutes:
        return MaterialPageRoute(builder: (context)=>GetStartedView());
        /// login page
      case RoutesName.loginPageRout:
        return MaterialPageRoute(builder: (context)=>LoginPageView());
        /// signUp Page
      case RoutesName.signupPageRoute:
        return MaterialPageRoute(builder: (context)=>SignUpPageView());
        /// resetPassword
      case RoutesName.resetPasswordRoute:
        return MaterialPageRoute(builder: (context)=>ResetPaddwordView());
        ///homepage
      case RoutesName.trackingHabitRoute:
        return MaterialPageRoute(builder: (context)=>TrackingHabitView());
        /// new habit
      case RoutesName.newHabitRoute:
        return MaterialPageRoute(builder: (context)=>NewHabitView());
        ///Bottom Bar
      case RoutesName.bottomBarViewRoute:
        return MaterialPageRoute(builder: (context)=>BottomVanigationBarView());
        ///analytic view
      case RoutesName.anaylaticViewRoute:
        return MaterialPageRoute(builder: (context)=>AnalyticView());
      default:
        return MaterialPageRoute(
            builder: (context) => Scaffold(
                  body: Center(child: Text('No Result')),
                ));
    }
  }
}
