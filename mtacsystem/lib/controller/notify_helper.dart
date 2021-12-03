import 'package:flutter_local_notifications/flutter_local_notifications.dart';
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
    );
	}

	Future<void> scheduledNotification(int month, int day, int hour, int minutes, String title, String note) async{
		await flutterLocalNotificationsPlugin.zonedSchedule(
    0,
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
        UILocalNotificationDateInterpretation.absoluteTime);
	}

	tz.TZDateTime _convertTime(int month, int day, int hour, int minutes){
		final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
		tz.TZDateTime scheduleDate = tz.TZDateTime(tz.local, now.year, month, day, hour, minutes);
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