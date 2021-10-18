import 'package:flutter/material.dart';
import 'Screens/Home/homeappbar.dart';
import 'Screens/Home/homeContent.dart';
import 'Screens/Notify/notifyappbar.dart';
import 'Screens/Notify/notifyContent.dart';
import 'Screens/Calendar/calendarappbar.dart';
import 'Screens/Calendar/calendarContent.dart';
import 'Screens/Profile/profile.dart';
import 'Screens/Profile/profileAppbar.dart';

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
      home: MainScreen(),
    );
  }
}
class MainScreen extends StatefulWidget{
  MainScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState(){
    return HomeScreen();
  }
}

PreferredSizeWidget _appbar(int index){
  switch(index){
    case 1: return CalendarAppBar(appbar: AppBar(toolbarHeight: 80.0,));
    case 3: return NotifyAppBar(appBar: AppBar(toolbarHeight: 80.0,));
    case 4: return ProfileAppBar(appbar: AppBar(toolbarHeight: 80.0,));
    default: return HomeAppBar(appBar: AppBar(toolbarHeight: 80.0,));
  }
}

class HomeScreen extends State<MainScreen>{
  int selectedIndex = 0;
  final List<Widget> _bodycontent = [
    HomeContent(),
    CalendarContent(),
    HomeContent(),
    NotifyContent(),
    Profile(),
  ];
  late PreferredSizeWidget app;
  @override
  Widget build(BuildContext context){
    return Scaffold( 
         appBar: app = _appbar(selectedIndex),
         body: _bodycontent[selectedIndex],
         bottomNavigationBar: BottomNavigationBar(
          currentIndex: this.selectedIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.blue,
          selectedIconTheme: IconThemeData(
            color: Colors.blue,
          ),
          unselectedItemColor: Colors.grey[400],
          backgroundColor: Colors.grey[200],
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: 'Calendar',
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
              label: 'Notify',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          onTap: (int index){
            setState((){this.selectedIndex = index;});
          },
        ),
      );
  }
}