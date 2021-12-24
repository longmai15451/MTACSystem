import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:mtacsystem/Screens/Calendar/detail_vaccin_regis.dart';
import 'package:mtacsystem/models/schedule.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;


class NotifyHelper{
	FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =  FlutterLocalNotificationsPlugin();

	Future<void> initializeNotification() async{
		await _configureLocalTimeZone();
		final AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('app_icon');

		final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
		);
		await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: selectNotification
    );
	}

  Future<void> showNotification() async {
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

	Future<void> scheduledNotification(
    int id,
    int month, 
    int day, 
    int hour, 
    int minutes, 
    String title, 
    String note,
    String regisID,
    String adres,
    String des,
    String type,
  ) async{
		await flutterLocalNotificationsPlugin.zonedSchedule(
    id,
    title,
    note,
     _convertTime(month, day, hour, minutes),
    const NotificationDetails(
        android: AndroidNotificationDetails(
            '0000', 'vaccination schedule',
            channelDescription: 'Take Vaccination',
            importance: Importance.max,
            priority: Priority.high,
            )),
    androidAllowWhileIdle: true,
    uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime,
        payload: "$regisID|"+"$adres|"+"$type|"+"$des|"
    );
	}

	tz.TZDateTime _convertTime(int month, int day, int hour, int minutes){
		final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
		tz.TZDateTime scheduleDate = tz.TZDateTime(tz.local, now.year, month, day, hour, minutes);
		if(scheduleDate.isBefore(now)){
			scheduleDate = scheduleDate.add(const Duration(days: 1));
		}
		return scheduleDate;
	}

  Future selectNotification(String? payload)async{
    Get.to(()=>Detail(
      adres: payload.toString().split('|')[1], 
      des: payload.toString().split('|')[3], 
      id: payload.toString().split('|')[0], 
      locationc: true,
      type: payload.toString().split('|')[2],
    ));
  }

	Future<void> _configureLocalTimeZone()async{
		tz.initializeTimeZones();
		final String timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
		tz.setLocalLocation(tz.getLocation(timeZoneName));
	}
}