import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:get/get.dart';
import 'package:mtacsystem/controller/notify_helper.dart';
import 'Screens/Home/homeContent.dart';
import 'Screens/Calendar/calendarContent.dart';
import 'Screens/Profile/profile.dart';
import 'package:mtacsystem/Screens/Login/Login.dart';
import 'package:mtacsystem/models/account.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

late AccountProfile accountdata;


NotifyHelper notify = NotifyHelper();
Future<void> mmm() async {
  WidgetsFlutterBinding.ensureInitialized();
  await notify.initializeNotification();
}
void main() {
  mmm();
  runApp(MyApp());
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
      home: LoginScreen()
    );
  }
}
class MainScreen extends StatefulWidget{
  final String address;
  final bool locationc;
  MainScreen({Key? key,  required this.address, required this.locationc, 
  }) : super(key: key);
  @override
  State<StatefulWidget> createState(){
    return HomeScreen();
  }
}


class HomeScreen extends State<MainScreen>{
  int selectedIndex = 0;
  late List<Widget> _bodycontent = [
      HomeContent(accountdata: accountdata, adres: widget.address,locationc: widget.locationc),
      CalendarContent(idCard: accountdata.idCard.toString(), adres: widget.address,locationc: widget.locationc),
      Profile(accountdata: accountdata,locationc: widget.locationc),
    ];

  @override
  Widget build(BuildContext context){
    return Scaffold( 
         body: _bodycontent[selectedIndex],
         bottomNavigationBar: CurvedNavigationBar(
          color: Colors.teal,
          height: 50,
          buttonBackgroundColor: Colors.grey.shade100,
          backgroundColor: Colors.teal.shade100,
          items: const <Widget>[
            Icon(Icons.home),
            Icon(Icons.calendar_today),
            Icon(Icons.person),
          ],
          onTap: (int index){
            setState((){this.selectedIndex = index;});
          },
        ),
      );
  }
}
