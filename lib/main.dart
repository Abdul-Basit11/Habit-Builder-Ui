import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:habit_bilder_app/navigation/navigation_routes_name.dart';

import 'navigation/routes_generator.dart';

Future<void> _firebaseBackground(RemoteMessage message) async {
  print('Handling a message ${message.messageId}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseMessaging.instance.getInitialMessage();
  FirebaseMessaging.onBackgroundMessage(_firebaseBackground);
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
      title: 'Habit Builder App',
      // routes: {
      //
      // },
      initialRoute: RoutesName.splashViewRoute,
      onGenerateRoute: RoutesGenerater.generateRoutes,
    );
  }
}
