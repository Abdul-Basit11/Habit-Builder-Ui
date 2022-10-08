import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:habit_bilder_app/navigation/navigation_routes_name.dart';

import 'navigation/routes_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.white.withOpacity(0.2),
      statusBarBrightness: Brightness.light,


    ));
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeLeft,
    ]);
    return MaterialApp(
      theme: ThemeData(

        // focusColor: FrontEndCngig.kHabitColor,
        // primaryColor: FrontEndCngig.kHabitColor,
      ),
      //home: NewHabitViewBody(),

      //home: TrackingHabitViewBody(),
      //home: BottomVanigationBarView(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
       // routes: {
       //
       // },
       initialRoute:   RoutesName.splashViewRoute,
        onGenerateRoute: RoutesGenerater.generateRoutes,

    );
  }
}
