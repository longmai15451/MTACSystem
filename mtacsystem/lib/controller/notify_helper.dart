import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:mtacsystem/models/schedule.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;


class NotifyHelper{
	FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =  FlutterLocalNotificationsPlugin();


	initializeNotification() async{
		await _configureLocalTimeZone();
		final AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('app_icon');

		final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
		);
		await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );
	}

	Future onReceiveLocalNotification(int id, String? title, String? body, String? payload)async{
		Get.dialog(Text("Welcom to Fuck"));
	}

	
   selectNotification(String payload)async{
		if(payload!=null){
			print('notification payload: $payload');
		}
		else{
			print("Notification Done");
		}
		Get.to(()=>Container(color: Colors.white));//Go to new page
	}

  Future<void> _showNotification() async {
      const AndroidNotificationDetails androidPlatformChannelSpecifics =
          AndroidNotificationDetails('your channel id', 'your channel name',
              channelDescription: 'your channel description',
              importance: Importance.max,
              priority: Priority.high,
              ticker: 'ticker');
      const NotificationDetails platformChannelSpecifics =
          NotificationDetails(android: androidPlatformChannelSpecifics);
      await flutterLocalNotificationsPlugin.show(
          0, 'plain title', 'plain body', platformChannelSpecifics,
          payload: 'item x');
    }

  Future<void> _zonedScheduleNotification() async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        'scheduled title',
        'scheduled body',
        tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
        const NotificationDetails(
            android: AndroidNotificationDetails(
                'your channel id', 'your channel name',
                channelDescription: 'your channel description')),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

	scheduledNotification()async{
		await flutterLocalNotificationsPlugin.zonedSchedule(
    0,
    'scheduled title',
    'scheduled body',
      tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
    const NotificationDetails(
        android: AndroidNotificationDetails(
            'your channel id', 'your channel name',
            channelDescription: 'your channel description')),
    androidAllowWhileIdle: true,
    uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime);
	}

	tz.TZDateTime _convertTime(int hour, int minutes){
		final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
		tz.TZDateTime scheduleDate = tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, minutes);
		if(scheduleDate.isBefore(now)){
			scheduleDate = scheduleDate.add(const Duration(days: 1));
		}
		return scheduleDate;
	}

	Future<void> _configureLocalTimeZone()async{
		tz.initializeTimeZones();
		final String timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
		tz.setLocalLocation(tz.getLocation(timeZoneName));
	}
}