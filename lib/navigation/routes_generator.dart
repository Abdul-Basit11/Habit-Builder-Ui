import 'package:flutter/material.dart';
import 'package:habit_bilder_app/presentation/views/app_view/course_and_community_view/community_page/community_page_view.dart';
import 'package:habit_bilder_app/presentation/views/app_view/course_and_community_view/course_overview/course_overview_view.dart';
import 'package:habit_bilder_app/presentation/views/app_view/course_and_community_view/what_inside/whats_inside_view.dart';
import 'package:habit_bilder_app/presentation/views/app_view/home_view/anaylatic/analytic_view.dart';
import 'package:habit_bilder_app/presentation/views/app_view/home_view/bottom_navigation_bar/bottom_navigation_view.dart';
import 'package:habit_bilder_app/presentation/views/app_view/home_view/new_habit/new_habit_view.dart';
import 'package:habit_bilder_app/presentation/views/app_view/home_view/tracking_habit/tracking_habit_view.dart';
import 'package:habit_bilder_app/presentation/views/app_view/profile_view/profile_dashboard/profile_view.dart';
import 'package:habit_bilder_app/presentation/views/app_view/profile_view/subscription_page/subscription_page_view.dart';
import 'package:habit_bilder_app/presentation/views/auth_view/login_page/login_page_view.dart';
import 'package:habit_bilder_app/presentation/views/auth_view/reset_password/reset_password_view.dart';
import 'package:habit_bilder_app/presentation/views/auth_view/signup_page/signup_page_view.dart';
import 'package:habit_bilder_app/presentation/views/on_boarding_view/get_started/get_started_view.dart';
import 'package:habit_bilder_app/presentation/views/on_boarding_view/on_boarding_screen/on_boarding_view.dart';
import 'package:habit_bilder_app/presentation/views/on_boarding_view/splash/splash.dart';

import 'navigation_routes_name.dart';

class RoutesGenerater {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {

      /// splash screen
      case RoutesName.splashViewRoute:
        return MaterialPageRoute(builder: (context) => SplashView());

      /// onBoarding screen
      case RoutesName.onBoardViewRouts:
        return MaterialPageRoute(builder: (context) => OnBoardingView());

      /// get started
      case RoutesName.getStartedViewRoutes:
        return MaterialPageRoute(builder: (context) => GetStartedView());

      /// login page
      case RoutesName.loginPageRout:
        return MaterialPageRoute(builder: (context) => LoginPageView());

      /// signUp Page
      case RoutesName.signupPageRoute:
        return MaterialPageRoute(builder: (context) => SignUpPageView());

      /// resetPassword
      case RoutesName.resetPasswordRoute:
        return MaterialPageRoute(builder: (context) => ResetPaddwordView());

      ///homepage
      case RoutesName.trackingHabitRoute:
        return MaterialPageRoute(builder: (context) => TrackingHabitView());

      /// new habit
      case RoutesName.newHabitRoute:
        return MaterialPageRoute(builder: (context) => NewHabitView());

      ///Bottom Bar
      case RoutesName.bottomBarViewRoute:
        return MaterialPageRoute(
            builder: (context) => BottomVanigationBarView());

      ///analytic view
      case RoutesName.anaylaticViewRoute:
        return MaterialPageRoute(builder: (context) => AnalyticView());

      /// courseoverview
      case RoutesName.courseOverViewRoute:
        return MaterialPageRoute(builder: (context) => CourseOverviewView());

      /// whatsInside
      case RoutesName.whatsInside:
        return MaterialPageRoute(builder: (context) => WhatsInsideView());

      /// communitypage
      case RoutesName.communityPageViewRoute:
        return MaterialPageRoute(builder: (context) => CommunityPageView());

      /// profile
      case RoutesName.profiledashboardRoute:
        return MaterialPageRoute(builder: (context) => ProfileView());

      /// subscription view
      case RoutesName.subscriptionViewRoute:
        return MaterialPageRoute(builder: (context) => SubscriptionView());
      default:
        return MaterialPageRoute(
            builder: (context) => Scaffold(
                  body: Center(child: Text('No Result')),
                ));
    }
  }
}
