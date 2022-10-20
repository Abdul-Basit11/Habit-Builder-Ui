import 'package:flutter/material.dart';
import 'package:habit_bilder_app/configuration/front_end_config.dart';
import 'package:habit_bilder_app/navigation/navigation_routes_name.dart';
import 'package:habit_bilder_app/presentation/views/on_boarding_view/on_boarding_screen/layout/widgets/page_one.dart';
import 'package:habit_bilder_app/presentation/views/on_boarding_view/on_boarding_screen/layout/widgets/page_three.dart';
import 'package:habit_bilder_app/presentation/views/on_boarding_view/on_boarding_screen/layout/widgets/page_two.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingViewBody extends StatefulWidget {
  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  PageController _controller = PageController();

  bool isIndex = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            physics: RangeMaintainingScrollPhysics(),
            onPageChanged: (index) {
              setState(() {
                isIndex = (index == 2);
              });
            },
            controller: _controller,
            children: [
              PageOne(),
              PageTwo(),
              PageThree(),
            ],
          ),
          Align(
              alignment: Alignment(0, 0.85),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      _controller.jumpToPage(2);
                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(
                          color: FrontEndCngig.kTextColor,
                          fontSize: 15,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  SmoothPageIndicator(
                      controller: _controller,
                      count: 3,
                      effect: WormEffect(
                        type: WormType.thin,
                        dotColor: FrontEndCngig.kPrimaryColor,
                        dotHeight: 13,
                        dotWidth: 13,
                        strokeWidth: 2,
                        activeDotColor: FrontEndCngig.kTextColor,
                      )),
                  isIndex
                      ? GestureDetector(
                          onTap: () {
                            _controller.nextPage(
                                duration: Duration(seconds: 1),
                                curve: Curves.easeIn);
                            Navigator.pushNamed(
                                context, RoutesName.getStartedViewRoutes);
                          },
                          child: Text(
                            'Done',
                            style: TextStyle(
                                color: FrontEndCngig.kTextColor,
                                fontSize: 15,
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w700),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            _controller.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeInSine);
                          },
                          child: Text(
                            'Next',
                            style: TextStyle(
                                color: FrontEndCngig.kTextColor,
                                fontSize: 15,
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                ],
              ))
        ],
      ),
    );
  }
}
