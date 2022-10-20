import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:habit_bilder_app/backend/model/habit_model.dart';
import 'package:habit_bilder_app/backend/services/system_services.dart';
import 'package:habit_bilder_app/configuration/front_end_config.dart';
import 'package:habit_bilder_app/navigation/navigation_routes_name.dart';
import 'package:habit_bilder_app/presentation/elements/custom_round_butto/round_button.dart';
import 'package:habit_bilder_app/presentation/elements/custom_text/custom_text.dart';
import 'package:habit_bilder_app/presentation/views/app_view/home_view/tracking_habit/layout/widget/frequency_container.dart';
import 'package:habit_bilder_app/presentation/views/app_view/home_view/tracking_habit/layout/widget/habit_text.dart';
import 'package:habit_bilder_app/presentation/views/app_view/home_view/tracking_habit/layout/widget/home_page_banner.dart';
import 'package:habit_bilder_app/presentation/views/app_view/home_view/tracking_habit/layout/widget/read_a_book_text.dart';
import 'package:habit_bilder_app/presentation/views/app_view/home_view/tracking_habit/layout/widget/vertical_line_cont.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class TrackingHabitViewBody extends StatefulWidget {
  @override
  State<TrackingHabitViewBody> createState() => _TrackingHabitViewBodyState();
}

class _TrackingHabitViewBodyState extends State<TrackingHabitViewBody> {
  String? mtoken = "";
  final _lastWeekDates = List.generate(
    7,
    (index) => DateTime.now().subtract(Duration(days: index + 1)),
  );

  final SystemServices systemServices = SystemServices();
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  late NotificationDetails platformChannelSpecific = NotificationDetails();

  @override
  void initState() {
    super.initState();
    requestPermission();
    getToken();
    initInfo();
  }

  /// push notofication function
  void requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User decliend and has not accepted permission');
    }
  }

  void saveToken(String token) async {
    await FirebaseFirestore.instance
        .collection('userToken')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({'token': token});
  }

  void getToken() async {
    await FirebaseMessaging.instance.getToken().then((token) {
      setState(() {
        mtoken = token;
        print('My token is$mtoken');
      });
      saveToken(token!);
    });
  }

  initInfo() {
    var androidInitialize =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings();
    var initializesSetting = InitializationSettings(
        android: androidInitialize, iOS: initializationSettingsDarwin);
    flutterLocalNotificationsPlugin.initialize(initializesSetting,
        onDidReceiveNotificationResponse: (response) async {
      try {
        if (response != null && response.payload!.isNotEmpty) {
        } else {}
      } catch (e) {}
      return;
    });
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      print('--------------------onMessage-----------------');
      print(
          'onMessage:${message.notification?.title}/${message.notification?.body}');

      BigTextStyleInformation bigTextStyleInformation = BigTextStyleInformation(
        message.notification!.body.toString(),
        htmlFormatBigText: true,
        contentTitle: message.notification!.title.toString(),
        htmlFormatContentTitle: true,
      );
      AndroidNotificationDetails _androidNotificationDetails =
          AndroidNotificationDetails(
        'dbfood',
        'dbfood',
        importance: Importance.max,
        styleInformation: bigTextStyleInformation,
        priority: Priority.max,
        playSound: false,
      );

      NotificationDetails platformChannelSpecific =
          NotificationDetails(android: _androidNotificationDetails);
      await flutterLocalNotificationsPlugin.show(0, message.notification?.title,
          message.notification?.body, platformChannelSpecific,
          payload: message.data['title']);
    });
  }

  void sendPushMessage(String token, String body, String title) async {
    try {
      await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization':
              'key=AAAAzRWNBFU:APA91bFuqgbEwoul45yGRDlA-2K2wT6DmjyByc_qxxlJ0AneNOCVAwyfGy6I4y11F97s2lhEPQrW-mj4VKp_L8z7upwnkhKwE5pyVb3LCeWJp4tC4fA0oSYfU81HKNz-1R2E_2YXiP2V'
        },
        body: jsonEncode(<String, dynamic>{
          'priority': 'high',
          'data': <String, dynamic>{
            'click_action': 'FLUTTER_NOTIFICATION_CLICK',
            'status': 'done',
            'body': body,
            'title': title,
          },
          'notification': <String, dynamic>{
            'title': title,
            'body': body,
            'android_channel_id': 'dbfood'
          },
          'to': token,
        }),
      );
    } catch (e) {
      if (kDebugMode) {
        print('error push notification');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var s = MediaQuery.of(context).size;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBody: true,

      /// appbar
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              minWidth: 20,
              height: 20,
              color: FrontEndCngig.kHabitColor,
              onPressed: () async {
                DocumentSnapshot snap = await FirebaseFirestore.instance
                    .collection("userTokencollection")
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .get();
                String token = snap['token'];
                print(token);

                sendPushMessage(token, "titleText", "bodyText");
              },
              child: Text(
                'Messgae',
                style:
                    TextStyle(fontSize: 14, color: FrontEndCngig.kWhiteColor),
              ),
            ),
          ),
        ],
        leading: RoundButton(
          onTap: () {},
          widget: Icon(
            Icons.arrow_back,
            color: FrontEndCngig.kTextColor,
          ),
        ),
        centerTitle: true,
        title: Text(
          'HomePage',
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: FrontEndCngig.kTextColor),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/homepage_bg_image.png'))),
        child: Column(
          children: [
            k20,

            /// homepage poster
            HomePagebanner(),
            k20,

            /// habits
            SizedBox(
              height: 52,
              child: Row(
                children: [
                  kWidth20,
                  HabitText(),
                  kWidth50,
                  Expanded(
                    child: ListView.builder(
                        reverse: true,
                        itemCount: _lastWeekDates.length,
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            margin:
                                EdgeInsets.only(right: 6, bottom: 2, top: 2),
                            height: 48,
                            width: 48,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomText(

                                    /// week in EEE
                                    title: DateFormat('EEE')
                                        .format(_lastWeekDates[index])
                                        .toUpperCase(),
                                    fontsize: 10,
                                    textColor: FrontEndCngig.kTextColor
                                        .withOpacity(0.6)),
                                CustomText(
                                    fontWeight: FontWeight.bold,
                                    title: DateFormat('d')
                                        .format(_lastWeekDates[index])
                                        .toUpperCase(),
                                    fontsize: 16,
                                    textColor: FrontEndCngig.kTextColor),
                              ],
                            ),
                          );
                        }),
                  )
                ],
              ),
            ),
            k10,

            /// Exercise
            StreamProvider.value(
                value: systemServices.fetchCurrentHabit(),
                initialData: [HabitModel()],
                builder: (context, child) {
                  List<HabitModel> _habitList =
                      context.watch<List<HabitModel>>();

                  return Expanded(
                    child: ListView.builder(
                        itemCount: _habitList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            alignment: Alignment.center,
                            height: 52,
                            width: double.infinity,
                            margin: EdgeInsets.only(left: 10),
                            decoration: kTileContainer,
                            child: Row(
                              children: [
                                ReadABookText(
                                  habitTitle: _habitList[index].habitName ?? "",
                                ),
                                kWidth48,
                                verticalLineCont(),
                                kWidth4,
                                Expanded(
                                  child: ListView.builder(
                                      itemCount: 7,
                                      physics: BouncingScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return FrequencyContainer(
                                          frequency: 0.5,
                                          freColor: FrontEndCngig.kRedColor,
                                          samecolor: FrontEndCngig.kRedColor
                                              .withOpacity(0.2),
                                        );
                                      }),
                                )
                              ],
                            ),
                          );
                        }),
                  );
                }),

            // k10,
            //
            // /// Wake Up Early
            // Container(
            //   alignment: Alignment.center,
            //   height: 52,
            //   width: double.infinity,
            //   margin: EdgeInsets.only(left: 10),
            //   decoration: kTileContainer,
            //   child: Row(
            //     children: [
            //       ReadABookText(
            //         habitTitle: 'Wake Up Early',
            //       ),
            //       kWidth12,
            //       verticalLineCont(),
            //       kWidth4,
            //       Expanded(
            //         child: ListView.builder(
            //             itemCount: 7,
            //             physics: BouncingScrollPhysics(),
            //             scrollDirection: Axis.horizontal,
            //             itemBuilder: (context, index) {
            //               return FrequencyContainer(
            //                   freColor: FrontEndCngig.kBlueColor,
            //                   samecolor:
            //                       FrontEndCngig.kBlueColor.withOpacity(0.2),
            //                   frequency: 0.5);
            //             }),
            //       )
            //     ],
            //   ),
            // ),
            // k10,
            //
            // ///Walk Dog
            // Container(
            //   alignment: Alignment.center,
            //   height: 52,
            //   width: double.infinity,
            //   margin: EdgeInsets.only(left: 10),
            //   decoration: kTileContainer,
            //   child: Row(
            //     children: [
            //       ReadABookText(
            //         habitTitle: 'Walk Dog',
            //       ),
            //       kWidth43,
            //       verticalLineCont(),
            //       kWidth4,
            //       Expanded(
            //         child: ListView.builder(
            //             itemCount: 4,
            //             physics: BouncingScrollPhysics(),
            //             scrollDirection: Axis.horizontal,
            //             itemBuilder: (context, index) {
            //               return FrequencyContainer(
            //                   freColor: FrontEndCngig.kMehroonColor,
            //                   samecolor:
            //                       FrontEndCngig.kMehroonColor.withOpacity(0.2),
            //                   frequency: 0.5);
            //             }),
            //       )
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
