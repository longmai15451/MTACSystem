import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'Screens/Home/homeappbar.dart';
import 'Screens/Home/homeContent.dart';
import 'Screens/Notify/notifyappbar.dart';
import 'Screens/Notify/notifyContent.dart';
import 'Screens/Calendar/calendarappbar.dart';
import 'Screens/Calendar/calendarContent.dart';
import 'Screens/Profile/profile.dart';
import 'Screens/Profile/profileAppbar.dart';
import 'Screens/qrScan/qrappbar.dart';
import 'Screens/qrScan/qrScan.dart';
import 'package:mtacsystem/Screens/Login/Login.dart';
import 'package:mtacsystem/Components/account.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

late AccountProfile accountdata;
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
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
        nextScreen: LoginScreen(),
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


PreferredSizeWidget _appbar(int index){
  switch(index){
    case 1: return CalendarAppBar(appbar: AppBar(toolbarHeight: 80.0,));
    case 2: return NotifyAppBar(appBar: AppBar(toolbarHeight: 80.0,));
    case 3: return ProfileAppBar(appbar: AppBar(toolbarHeight: 80.0,));
    default: return HomeAppBar(appBar: AppBar(toolbarHeight: 80.0,), accountdata: accountdata,);
  }
}


class HomeScreen extends State<MainScreen>{
  int selectedIndex = 0;
  //HomeScreen({required this.selectedIndex});
  final List<Widget> _bodycontent = [
    HomeContent(),
    CalendarContent(),
    NotifyContent(),
    Profile(accountdata: accountdata,),
  ];
  late PreferredSizeWidget app;
  @override
  Widget build(BuildContext context){
    return Scaffold( 
         appBar: app = _appbar(selectedIndex),
         body: ListView(
           children: <Widget>[
              _bodycontent[selectedIndex],
           ]
         ),
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