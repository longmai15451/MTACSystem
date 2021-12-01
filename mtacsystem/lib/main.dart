import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:get/get.dart';
import 'Screens/Home/homeContent.dart';
import 'Screens/Notify/notifyContent.dart';
import 'Screens/Calendar/calendarContent.dart';
import 'Screens/Profile/profile.dart';
import 'package:mtacsystem/Screens/Login/Login.dart';
import 'package:mtacsystem/models/account.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'db/dbHelper.dart';import 'package:timezone/timezone.dart' as tz;

late AccountProfile accountdata;
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =  FlutterLocalNotificationsPlugin();
Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await _configureLocalTimeZone();
  await DBHelper.initDb();
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('app_icon');
  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      );
  runApp(MyApp());
}

  Future<void> _configureLocalTimeZone()async{
		tz.initializeTimeZones();
		final String timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
		tz.setLocalLocation(tz.getLocation(timeZoneName));
	}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return GetMaterialApp(
      title: 'MTACSystem',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF2661FA),
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AnimatedSplashScreen(
        duration: 1200,
        splashIconSize: 200,
        splash: Center(
            child: Image.asset(
              'assets/images/Splash.png',
          ),
        ),
        nextScreen: LoginScreen(notify: flutterLocalNotificationsPlugin),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Colors.blue.shade50,
      ),
    );
  }
}
class MainScreen extends StatefulWidget{
  MainScreen({Key? key, 
  }) : super(key: key);
  @override
  State<StatefulWidget> createState(){
    return HomeScreen();
  }
}


class HomeScreen extends State<MainScreen>{
  int selectedIndex = 0;
  //HomeScreen({required this.selectedIndex});
  final List<Widget> _bodycontent = [
    HomeContent(accountdata: accountdata,),
    CalendarContent(),
    NotifyContent(),
    Profile(accountdata: accountdata,),
  ];
  late PreferredSizeWidget app;
  @override
  Widget build(BuildContext context){
    return Scaffold( 
         body: _bodycontent[selectedIndex],
         bottomNavigationBar: CurvedNavigationBar(
          color: Colors.blue.shade200,
          height: 50,
          buttonBackgroundColor: Colors.grey.shade100,
          backgroundColor: Colors.white,
          items: const <Widget>[
            Icon(Icons.home),
            Icon(Icons.calendar_today),
            Icon(Icons.notifications),
            Icon(Icons.person),
          ],
          onTap: (int index){
            setState((){this.selectedIndex = index;});
          },
        ),
      );
  }
}