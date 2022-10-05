import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habit_bilder_app/configuration/front_end_config.dart';
import 'package:habit_bilder_app/navigation/navigation_routes_name.dart';
import 'package:habit_bilder_app/presentation/views/app_view/new_habit/new_habit_view.dart';
import 'package:habit_bilder_app/presentation/views/app_view/tracking_habit/tracking_habit_view.dart';

class BottomVanigationBarView extends StatefulWidget {
  const BottomVanigationBarView({Key? key}) : super(key: key);

  @override
  State<BottomVanigationBarView> createState() =>
      _BottomVanigationBarViewState();
}

class _BottomVanigationBarViewState extends State<BottomVanigationBarView> {
  final screens = [
    TrackingHabitView(),
    TrackingHabitView(),
    TrackingHabitView(),
    TrackingHabitView(),
    TrackingHabitView(),

  ];
  int _currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.small(
        backgroundColor: FrontEndCngig.kHabitColor,
        onPressed: () {
        //Navigator.pushNamed(context, RoutesName.newHabitRoute);
        },
        child: Text('+',style: TextStyle(fontSize: 20),),
      ),
      body: screens[_currentindex],
      bottomNavigationBar: BottomAppBar(
        clipBehavior: Clip.antiAlias,
        color: Colors.transparent,
        shape: CircularNotchedRectangle(),
        notchMargin: 6,
        child: BottomNavigationBar(
          showUnselectedLabels: false,
          showSelectedLabels: false,
          currentIndex: _currentindex,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.w400),
          selectedItemColor: FrontEndCngig.kHabitColor,
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w400),
          unselectedItemColor: Color(0xff9098B1),
          onTap: (index) {
            setState(() {
              _currentindex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/bottom_one_image.png',
                scale: 5,
                colorBlendMode: BlendMode.difference,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/bottom_two_imag.png',
                scale: 5,
              ),
              label: 'Home',
            ),

            /// middle one
            BottomNavigationBarItem(
            label: '',
                icon: Icon(
              Icons.no_accounts,
              color: Colors.transparent,
            )),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/bottom_three_image.png',
                scale: 5,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/bottom_four_image.png',
                scale: 5,
              ),
              label: 'Home',
            ),
          ],
        ),
      ),
    );
  }
}
