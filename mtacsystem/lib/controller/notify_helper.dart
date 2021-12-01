import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:mtacsystem/models/schedule.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;


class NotifyHelper{
	FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

	initializeNotification() async{
		_configureLocalTimeZone();
		final AndroidInitializationSettings initializationSettingAndroid = AndroidInitializationSettings(
			"appicon"
		);

		final InitializationSettings initializationSettings = InitializationSettings(
			android: initializationSettingAndroid,
		);
		await flutterLocalNotificationsPlugin.initialize(
			initializationSettings,
		);
	}

	Future onReceiveLocalNotification(int id, String? title, String? body, String? payload)async{
		Get.dialog(Text("Welcom to Fuck"));
	}

	// Future selectNotification(String payload)async{
	// 	if(payload!=null){
	// 		print('notification payload: $payload');
	// 	}
	// 	else{
	// 		print("Notification Done");
	// 	}
	// 	Get.to(()=>Container(color: Colors.white));//Go to new page
	// }

	scheduledNotification()async{
		await flutterLocalNotificationsPlugin.zonedSchedule(
			0,
			'schedule title',
			'THemmm',
			tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
			const NotificationDetails(
				android: AndroidNotificationDetails('your chanel id', 'your chanel name')),
			androidAllowWhileIdle: true,
			uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime);
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
		final String timezone = await FlutterNativeTimezone.getLocalTimezone();
		tz.setLocalLocation(tz.getLocation(timezone));
	}
}