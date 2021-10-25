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
  int selected = 0;
  MainScreen({Key? key, //required this.selected
  }) : super(key: key);
  @override
  State<StatefulWidget> createState(){
    return HomeScreen();//selectedIndex: selected);
  }
}


PreferredSizeWidget _appbar(int index){
  switch(index){
    case 1: return CalendarAppBar(appbar: AppBar(toolbarHeight: 80.0,));
    case 2: return QRAppBar(appBar: AppBar());
    case 3: return NotifyAppBar(appBar: AppBar(toolbarHeight: 80.0,));
    case 4: return ProfileAppBar(appbar: AppBar(toolbarHeight: 80.0,));
    default: return HomeAppBar(appBar: AppBar(toolbarHeight: 80.0,));
  }
}


class HomeScreen extends State<MainScreen>{
  int selectedIndex = 0;
  //HomeScreen({required this.selectedIndex});
  final List<Widget> _bodycontent = [
    HomeContent(),
    CalendarContent(),
    QRScan(),
    NotifyContent(),
    Profile(),
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
         bottomNavigationBar: BottomNavigationBar(
          currentIndex: this.selectedIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.blue,
          selectedIconTheme: IconThemeData(
            color: Colors.blue,
          ),
          unselectedItemColor: Colors.grey[400],
          backgroundColor: Colors.white,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Trang chủ',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: 'Lịch hẹn',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.qr_code_scanner_rounded,
                size: 45.0,
                color: Colors.black,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Thông báo',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Cá nhân',
            ),
          ],
          onTap: (int index){
            setState((){this.selectedIndex = index;});
          },
        ),
      );
  }
}